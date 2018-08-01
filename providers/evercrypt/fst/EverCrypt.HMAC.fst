(* Agile HMAC *)
module EverCrypt.HMAC

/// Agile specification

open EverCrypt.Helpers
open FStar.Seq

noextract
let wrap (a:e_alg) (key: bytes{length key <= maxLength a}):
  GTot (lbseq (blockLength a))
=
  let key0 = if length key <= blockLength a then key else spec a key in
  let paddingLength = blockLength a - length key0 in
  key0 @| Seq.create paddingLength 0uy

private let wrap_lemma (a: e_alg) (key: bseq{Seq.length key <= maxLength a}): Lemma
  (requires length key > blockLength a)
  (ensures wrap a key == (
    let key0 = spec a key in
    let paddingLength = blockLength a - length key0 in
    key0 @| Seq.create paddingLength 0uy)) = ()

noextract let rec xor (v: bseq) (x: UInt8.t): lbseq (length v) =
  init (length v) (fun i -> FStar.UInt8.logxor (index v i) x)
//  Spec.Loops.seq_map (fun y -> FStar.UInt8.logxor x y) v
//18-04-08 not sure why the latter fails.


// [noextract] incompatible with interfaces?!
let hmac a key data =
  assert(tagLength a + blockLength a <= maxLength a); // avoid?
  let k = wrap a key in
  let h1 = spec a (xor k 0x36uy @| data) in
  let h2 = spec a (xor k 0x5cuy @| h1) in
  h2

/// Agile implementation, relying on 3 variants of SHA2 supported by
/// HACL*.

open FStar.HyperStack.ST
open FStar.Integers
open LowStar.Buffer

module ST = FStar.HyperStack.ST

(* we rely on the output being zero-initialized for the correctness of padding *)
//[@"substitute"]
val wrap_key:
  a: ha ->
  output: uint8_pl (blockLength (Ghost.hide a)) ->
  key: uint8_p {length key <= maxLength (Ghost.hide a) /\ disjoint output key} ->
  len: UInt32.t {v len = length key} ->
  Stack unit
    (requires (fun h0 ->
      live h0 output /\ live h0 key /\
      as_seq h0 output == Seq.create (blockLength (Ghost.hide a)) 0uy ))
    (ensures  (fun h0 _ h1 ->
      live h1 output /\ live h1 key /\ live h0 output /\ live h0 key /\
      as_seq h0 output == Seq.create (blockLength (Ghost.hide a)) 0uy /\
      LowStar.Modifies.(modifies (loc_buffer output) h0 h1) /\
      as_seq h1 output = wrap (Ghost.hide a) (as_seq h0 key) ))

(*
// missing in LowStar.Buffer, not sure about modifies clause
assume val blit: #t:Type
  -> a:buffer t
  -> idx_a:UInt32.t{v idx_a <= length a}
  -> b:buffer t{disjoint a b}
  -> idx_b:UInt32.t{v idx_b <= length b}
  -> len:UInt32.t{v idx_a + v len <= length a /\ v idx_b + v len <= length b}
  -> Stack unit
    (requires (fun h -> live h a /\ live h b))
    (ensures  (fun h0 _ h1 -> live h0 b /\ live h0 a /\ live h1 b /\ live h1 a /\ modifies_1 b h0 h1
      /\ Seq.slice (as_seq h1 b) (v idx_b) (v idx_b + v len) ==
        Seq.slice (as_seq h0 a) (v idx_a) (v idx_a + v len)
      /\ Seq.slice (as_seq h1 b) 0 (v idx_b) ==
        Seq.slice (as_seq h0 b) 0 (v idx_b)
      /\ Seq.slice (as_seq h1 b) (v idx_b+v len) (length b) ==
        Seq.slice (as_seq h0 b) (v idx_b+v len) (length b) ))
*)

let wrap_key a output key len =
  let i = if len <= blockLen a then len else tagLen a in
  let nkey = sub output 0ul i in
  let pad = sub output i (blockLen a - i) in
  let h0 = ST.get () in
  if len <= blockLen a then
    LowStar.BufferOps.blit key 0ul nkey 0ul len
  else
    Hash.hash a nkey key len;
  let h1 = ST.get () in
  Seq.lemma_eq_intro (as_seq h0 pad) (Seq.create (blockLength (Ghost.hide a) - v i) 0uy);
  Seq.lemma_split (as_seq h1 output) (v i)

// we pre-allocate the variable-type, variable length hash state,
// to avoid both verification and extraction problems.

val part1:
  a: alg -> (
  let a = Ghost.hide a in
  acc: state a ->
  //let uint = state_word a in
  s2: uint8_pl (blockLength a) ->
  data: uint8_p {
    length data + blockLength a  < pow2 32 /\
    length data + blockLength a  <= maxLength a /\
    disjoint data s2} ->
  len: UInt32.t {length data = v len} ->
  ST unit
    (requires fun h0 ->
      LowStar.Modifies.(
        loc_disjoint (footprint acc h0) (loc_buffer s2) /\
        loc_disjoint (footprint acc h0) (loc_buffer data)) /\
      invariant acc h0 /\
      live h0 s2 /\
      live h0 data)
    (ensures  fun h0 _ h1 ->
      live h1 s2 /\ live h1 data /\
      Hash.invariant acc h1 /\
      LowStar.Modifies.(modifies (loc_union (footprint acc h0) (loc_buffer s2)) h0 h1) /\
      (
      let hash0 = Seq.slice (as_seq h1 s2) 0 (tagLength a) in
      hash0 == spec a (Seq.append (as_seq h0 s2) (as_seq h0 data)))))

//18-07-12 could not find existing lemma: loc_disjoint_gsub_buffer is not enough! 
assume val loc_disjoint_gsub_buffer1
  (#t: Type)
  (l0: loc)
  (b: buffer t)
  (i: UInt32.t)
  (len: UInt32.t)
: Lemma
  (requires (
    UInt32.v i + UInt32.v len <= length b /\
    loc_disjoint l0 (loc_buffer b) 
  ))
  (ensures (
    UInt32.v i + UInt32.v len <= length b /\
    loc_disjoint l0 (loc_buffer (gsub b i len))
  ))
  //[SMTPat (gsub b i len)] // ? FIXME 

#reset-options "--max_fuel 0 --z3rlimit 1000"
let part1 a (acc: state (Ghost.hide a)) key data len =
  let ll = len % blockLen a in
  let lb = len - ll in
  let blocks = LowStar.Buffer.sub data 0ul lb in
  let last = LowStar.Buffer.offset data lb in
  Hash.init acc;
  let h0 = ST.get() in //assume(bounded_counter acc h0 1);
  Hash.update
    (Ghost.hide Seq.empty)
    acc key;
  let h1 = ST.get() in
  assert(
    let k = LowStar.Buffer.as_seq h0 key in
    FStar.Seq.lemma_eq_intro (Seq.append (Seq.empty #UInt8.t) k) k;
    repr acc h1 == hash0 k);
  Hash.update_multi
    (Ghost.hide (LowStar.Buffer.as_seq h0 key))
    acc blocks lb;
  let h2 = ST.get() in
  Hash.update_last
    (Ghost.hide (Seq.append (LowStar.Buffer.as_seq h0 key) (LowStar.Buffer.as_seq h2 blocks)))
    acc last (blockLen a + len);
  let h3 = ST.get() in
  // assert(LowStar.Buffer.live h3 key);
  let tag = LowStar.Buffer.sub key 0ul (tagLen a) in (* Salvage memory *)
  Hash.finish acc tag;
  let h4 = ST.get() in 
  (
    modifies_trans (footprint acc h0) h0 h3 (loc_buffer key) h4; // should this implicitly trigger?
    let a = Ghost.hide a in
    let p = blockLength a in
    let key1 = as_seq h1 key in
    let blocks1 = as_seq h1 blocks in
    let acc1 = repr acc h1 in
    lemma_compress (acc0 #a) key1;
    assert(acc1 == hash0 key1);
    let v2 = key1 @| blocks1 in
    let acc2 = repr acc h2 in
    // assert (Seq.length key1 % p = 0);
    // assert (Seq.length blocks1 % p = 0);
    // assert (Seq.length v2 % p = 0);
    lemma_hash2 (acc0 #a) key1 blocks1;
    assert(acc2 == hash0 #a v2);
    let data1 = as_seq h1 data in
    let last1 = as_seq h1 last in
    let suffix1 = suffix a (p + v len) in
    Seq.lemma_eq_intro data1 (blocks1 @| last1);
    let acc3 = repr acc h3 in
    let ls = Seq.length suffix1 in
    assert((p + v len + ls) % p = 0);
    Math.Lemmas.lemma_mod_plus (v ll + ls) (1 + v len / p) p;
    assert((v ll + ls) % p = 0);
    lemma_hash2 (acc0 #a) v2 (last1 @| suffix1);
    assert(acc3 == hash0 #a (v2 @| (last1 @| suffix1)));
    Seq.append_assoc v2 last1 suffix1;
    Seq.append_assoc key1 blocks1 last1;
    assert(acc3 == hash0 #a ((key1 @| data1) @| suffix1));
    assert(extract acc3 == spec a (key1 @| data1)))

// the two parts have the same stucture; let's keep their proofs in sync.
[@"substitute"]
val part2:
  a: alg -> (
  let a = Ghost.hide a in
  acc: state a ->
  mac: uint8_pl (tagLength a) ->
  opad: uint8_pl (blockLength a) ->
  tag: uint8_pl (tagLength a) {disjoint mac opad /\ disjoint mac tag} ->
  ST unit
    (requires fun h0 ->
      invariant acc h0 /\
      LowStar.Buffer.(
        live h0 mac /\
        live h0 opad /\
        live h0 tag) /\
      LowStar.Modifies.(
        loc_disjoint (footprint acc h0) (loc_buffer opad) /\
        loc_disjoint (footprint acc h0) (loc_buffer tag) /\
        loc_disjoint (footprint acc h0) (loc_buffer mac)))
    (ensures fun h0 _ h1 ->
      live h1 mac /\ live h1 opad /\ live h1 tag /\ 
      invariant acc h1 /\
      LowStar.Modifies.(modifies (loc_union (footprint acc h0) (loc_buffer mac)) h0 h1) /\
      ( let payload = Seq.append (as_seq h0 opad) (as_seq h0 tag) in
        Seq.length payload <= maxLength a /\
        as_seq h1 mac = spec a payload)))

[@"substitute"]
let part2 a acc mac opad tag =
  let totLen = blockLen a + tagLen a in
  assert_norm(v totLen <= maxLength (Ghost.hide a));
  let h0 = ST.get() in
  //assume(LowStar.Modifies.(loc_disjoint (footprint acc h0) (loc_buffer opad)));
  Hash.init acc;
  Hash.update
    (Ghost.hide Seq.empty)
    acc opad;
  let h1 = ST.get() in
  // assert(
  //   footprint acc h1 == footprint acc h0 /\
  //   LowStar.Buffer.live h1 mac /\
  //   LowStar.Modifies.(loc_disjoint (footprint acc h1) (loc_buffer mac)) );
  assert(
    let k = LowStar.Buffer.as_seq h0 opad in
    FStar.Seq.lemma_eq_intro (Seq.append (Seq.empty #UInt8.t) k) k;
    repr acc h1 == hash0 k);
  Hash.update_last
    (Ghost.hide (LowStar.Buffer.as_seq h1 opad))
    acc tag totLen;
  let h2 = ST.get() in
  // assert(
  //   LowStar.Buffer.live h2 mac /\
  //   LowStar.Modifies.(loc_disjoint (footprint acc h2) (loc_buffer mac)) );
  Hash.finish acc mac;
  (
    let v1 = as_seq h1 opad in
    let acc1 = repr acc h1 in
    lemma_compress (acc0 #(Ghost.hide a)) v1;
    assert(acc1 == hash0 v1);
    let tag1 = as_seq h1 tag in
    let suffix1 = suffix (Ghost.hide a) (blockLength (Ghost.hide a) + tagLength (Ghost.hide a)) in
    let acc2 = repr acc h2 in
    lemma_hash2 (acc0 #(Ghost.hide a)) v1 (tag1 @| suffix1);
    Seq.append_assoc v1 tag1 suffix1;
    assert(acc2 == hash0 ((v1 @| tag1) @| suffix1));
    assert(extract acc2 = spec (Ghost.hide a) (v1 @| tag1)))

// similar spec as hmac with keylen = blockLen a
val hmac_core:
  a: alg -> (
  let a = Ghost.hide a in
  acc: state a -> (
  tag: uint8_pl (tagLength a) ->
  key: uint8_pl (blockLength a) {disjoint key tag} ->
  data: uint8_p{
    length data + blockLength a < pow2 32 /\
    length data + blockLength a <= maxLength a /\
    disjoint data key } ->
  datalen: UInt32.t {v datalen = length data} ->
  ST unit
  (requires fun h0 ->
    LowStar.Modifies.(
      loc_disjoint (footprint acc h0) (loc_buffer tag) /\
      loc_disjoint (footprint acc h0) (loc_buffer key) /\
      loc_disjoint (footprint acc h0) (loc_buffer data)) /\
    invariant acc h0 /\
    live h0 tag /\ live h0 key /\ live h0 data)
  (ensures fun h0 _ h1 ->
    live h1 tag /\ live h0 tag /\
    live h1 key /\ live h0 key /\
    live h1 data /\ live h0 data /\
    LowStar.Modifies.(modifies (loc_union (footprint acc h0) (loc_buffer tag)) h0 h1) /\
    ( let k = as_seq h0 key in
      let k1 = xor k 0x36uy in
      let k2 = xor k 0x5cuy in
      let v1 = spec a (k1 @| as_seq h0 data) in
      Seq.length (k2 @| v1) <= maxLength a /\
      as_seq h1 tag == spec a (k2 @| v1)))))

// todo functional correctness.
// below, we only XOR with a constant bytemask.
val xor_bytes_inplace:
  a: uint8_p ->
  b: uint8_p{ disjoint a b } ->
  len: UInt32.t {v len = length a /\ v len = length b} ->
  Stack unit
  (requires fun h0 -> live h0 a /\ live h0 b)
  (ensures fun h0 _ h1 ->
    LowStar.Modifies.(modifies (loc_buffer a) h0 h1))
let xor_bytes_inplace a b len =
  let a = LowStar.ToFStarBuffer.new_to_old_st a in
  let b = LowStar.ToFStarBuffer.new_to_old_st b in
  C.Loops.in_place_map2 a b len (fun x y -> UInt8.logxor x y)

// TODO small improvements: part1 and part2 could return their tags in
// mac, so that we can reuse the pad.
let hmac_core a acc mac key data len =
  let h00 = ST.get() in
  push_frame ();
  let h01 = ST.get() in 
  assume(invariant acc h00 ==> invariant acc h01); //?
  let ipad = LowStar.Buffer.alloca 0x36uy (blockLen a) in
  let h02 = ST.get() in 
  assume(loc_in (footprint acc h01) h01);//?
  fresh_is_disjoint (loc_buffer ipad) (footprint acc h01)  h01 h02;
  let opad = LowStar.Buffer.alloca 0x5cuy (blockLen a) in
  xor_bytes_inplace ipad key (blockLen a);
  xor_bytes_inplace opad key (blockLen a);
  let h0 = ST.get() in
  assume(loc_in (footprint acc h0) h0);//?
  LowStar.Modifies.(frame_invariant (loc_union (loc_buffer ipad) (loc_buffer opad)) acc h01 h0);
  // assert(invariant acc h0);
  // assert(
  //   // not sure how to frame acc's invariant and footprint through push_frame, alloca, xor_inplace
  //   LowStar.Modifies.(
  //     loc_disjoint (footprint acc h0) (loc_buffer data) /\
  //     loc_disjoint (footprint acc h0) (loc_buffer ipad) /\
  //     loc_disjoint (footprint acc h0) (loc_buffer opad))
  //   );
  part1 a acc ipad data len;
  let h1 = ST.get() in
  assert(live h1 ipad);//18-07-12 TODO framing
  let inner = sub ipad 0ul (tagLen a) in (* salvage memory *)
  assume(
    live h1 mac /\ live h1 opad /\ 
    LowStar.Modifies.(
      loc_disjoint (footprint acc h1) (loc_buffer data) /\
      loc_disjoint (footprint acc h1) (loc_buffer ipad) /\
      loc_disjoint (footprint acc h1) (loc_buffer opad) /\
      loc_disjoint (footprint acc h1) (loc_buffer mac))
    );
  part2 a acc mac opad inner;
  let h2 = ST.get() in
  (
    let a = Ghost.hide a in
    let k = as_seq h0 key in
    let k1: lbseq (blockLength a) = xor k 0x36uy in
    let k2: lbseq (blockLength a) = xor k 0x5cuy in
    let vdata = as_seq h0 data in
    let v1: lbseq (tagLength a) = as_seq h1 inner in
    assert_norm(blockLength a + tagLength a <= maxLength a);
    assert(Seq.length (k2 @| v1) <= maxLength a);
    let v2 = as_seq h2 mac in

    assume(as_seq h0 ipad = k1);
    assume(as_seq h1 opad = k2);
    assert(v1 == spec a (k1 @| vdata));
    assert(v2 == spec a (k2 @| v1));
    //assert(modifies_2 acc ipad h0 h1);
    //assert(modifies_2 acc mac h1 h2)
    assert(live h1 key);
    assert(live h1 data);
    //assert(footprint acc h1 == footprint acc h0);
    LowStar.Modifies.(
      let fp2 = loc_union (footprint acc h1) (loc_buffer mac) in 
      assert(modifies fp2 h1 h2); 
      //assert(loc_disjoint (footprint acc h1) (loc_buffer key));
      assert(loc_disjoint (loc_buffer mac) (loc_buffer key))
      //assert(loc_disjoint fp2 (loc_buffer data)));
    // assert(live h2 key);      
    // assert(live h2 mac)
  ));
  pop_frame ();
  
  let h3 = ST.get() in
  admit() 
(* still missing some framing, 
  assume(
    live h3 key /\
    LowStar.Modifies.(modifies (loc_union (footprint acc h0) (loc_buffer mac)) h00 h3)
    )
  //assume(modifies_2 acc mac h00 h3) //18-04-14 still no convenient way to prove those?
*)

let compute a mac key keylen data datalen =
  push_frame ();
  assert_norm(pow2 32 <= maxLength (Ghost.hide a));
  let keyblock = LowStar.Buffer.alloca 0x00uy (blockLen a) in
  let acc = Hash.create a in
  let h0 = ST.get() in
  wrap_key a keyblock key keylen;
  let h1 = ST.get() in
  Hash.frame_invariant (LowStar.Modifies.loc_buffer keyblock) acc h0 h1;
  Hash.frame_invariant_implies_footprint_preservation (LowStar.Modifies.loc_buffer keyblock) acc h0 h1;
  hmac_core a acc mac keyblock data datalen;
  let h2 = ST.get() in
  assume(
    //18-07-12 not sure this is provable, even after deallocating acc!
    LowStar.Modifies.(
      modifies (loc_union (footprint acc h1) (loc_buffer mac)) h1 h2 ==>
      modifies (loc_buffer mac) h1 h2));
  pop_frame ()

(* was:
// not much point in separating hmac_core? verbose, but it helps
// monomorphise stack allocations.

let compute a mac key keylen data datalen =
  push_frame ();
  assert_norm(pow2 32 <= maxLength a);
  let keyblock = Buffer.create 0x00uy (blockLen a) in
  wrap_key a keyblock key keylen;
  ( match a with
  | SHA256 ->
      push_frame();
      // 18-04-15 hardcoding the type to prevent extraction errors :(
      let acc = Buffer.create #UInt32.t (state_zero a) (state_size a) in
      hmac_core SHA256 acc mac keyblock data datalen;
      pop_frame()
  | SHA384 ->
      push_frame();
      let acc = Buffer.create #UInt64.t (state_zero a) (state_size a) in
      hmac_core SHA384 acc mac keyblock data datalen;
      pop_frame()
  | SHA512 ->
      push_frame();
      let acc = Buffer.create #UInt64.t (state_zero a) (state_size a) in
      hmac_core SHA512 acc mac keyblock data datalen;
      pop_frame());
  pop_frame ()

// 18-04-11 this alternative is leaky and does not typecheck.
// I get an error pointing to `sub_effect DIV ~> GST = lift_div_gst` in HyperStack

let compute a mac key keylen data datalen =
  push_frame ();
  let keyblock = Buffer.create 0x00uy (blockLen a) in
  assert_norm(pow2 32 <= maxLength a);
  wrap_key a keyblock key keylen;
  let acc =
    match a with
    | SHA256 -> Buffer.rcreate HyperStack.root 0ul (state_size a)
    | SHA384 -> Buffer.rcreate HyperStack.root 0UL (state_size a)
    | SHA512 -> Buffer.rcreate HyperStack.root 0UL (state_size a) in
  hmac_core SHA256 acc mac keyblock data datalen;
  pop_frame ()
*)
