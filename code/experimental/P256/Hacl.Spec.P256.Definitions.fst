module Hacl.Spec.P256.Definitions

open Lib.IntTypes
open FStar.Math.Lemmas
open FStar.Math.Lib

open FStar.HyperStack
open FStar.HyperStack.All
open Lib.Sequence
open Lib.Buffer

open Hacl.Spec.Curve25519.Field64.Definition
 

noextract
let prime:pos =
  assert_norm (pow2 256 - pow2 224 + pow2 192 + pow2 96 -1 > 0);
  pow2 256 - pow2 224 + pow2 192 + pow2 96 -1

inline_for_extraction
let p256_prime_list : x:list uint64{List.Tot.length x == 4 /\ 
  (
    let open FStar.Mul in 
    let l0 = uint_v (List.Tot.index x 0) in 
    let l1 = uint_v (List.Tot.index x 1) in 
    let l2 = uint_v (List.Tot.index x 2) in 
    let l3 = uint_v (List.Tot.index x 3) in 
    l0 + l1 * pow2 64 + l2 * pow2 128 + l3 * pow2 192 == prime)
  } =
  let open FStar.Mul in 
  [@inline_let]
  let x =
    [ (u64 0xffffffffffffffff);  (u64 0xffffffff); (u64 0);  (u64 0xffffffff00000001);] in
    assert_norm(0xffffffffffffffff + 0xffffffff * pow2 64 + 0xffffffff00000001 * pow2 192 == prime);
  x


inline_for_extraction noextract
let felem4 = uint64 * uint64 * uint64 * uint64
inline_for_extraction noextract
let felem8 = uint64 * uint64  * uint64  * uint64 * uint64 * uint64 * uint64 * uint64
inline_for_extraction noextract
let felem8_32 = uint32 * uint32 * uint32 * uint32 * uint32 * uint32 * uint32 * uint32
inline_for_extraction noextract
let felem9 = uint64 * uint64  * uint64  * uint64 * uint64 * uint64 * uint64 * uint64 * uint64

noextract
let point_nat = nat * nat * nat

inline_for_extraction
let felem = lbuffer uint64 (size 4)


noextract
let felem_seq_as_nat (a: lseq uint64 4) : Tot nat  = 
  let open FStar.Mul in 
  let a0 = Lib.Sequence.index a 0 in 
  let a1 = Lib.Sequence.index a 1 in 
  let a2 = Lib.Sequence.index  a 2 in 
  let a3 = Lib.Sequence.index a 3 in 
  uint_v a0 + uint_v a1 * pow2 64 + uint_v a2 * pow2 64 * pow2 64 + uint_v a3 * pow2 64 * pow2 64 * pow2 64

noextract
let felem_seq_as_nat_8 (a: lseq uint64 8) : Tot nat = 
  let open FStar.Mul in 
  let a0 = Lib.Sequence.index a 0 in 
  let a1 = Lib.Sequence.index a 1 in 
  let a2 = Lib.Sequence.index a 2 in 
  let a3 = Lib.Sequence.index a 3 in 
  let a4 = Lib.Sequence.index a 4 in 
  let a5 = Lib.Sequence.index a 5 in 
  let a6 = Lib.Sequence.index a 6 in 
  let a7 = Lib.Sequence.index a 7 in
  uint_v a0 + 
  uint_v a1 * pow2 64 + 
  uint_v a2 * pow2 64 * pow2 64 + 
  uint_v a3 * pow2 64 * pow2 64 * pow2 64 + 
  uint_v a4 * pow2 64 * pow2 64 * pow2 64 * pow2 64 + 
  uint_v a5 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 + 
  uint_v a6 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 + 
  uint_v a7 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64




open FStar.Mul

noextract
let felem_seq_prime = a: lseq uint64 4 {felem_seq_as_nat a < prime}
noextract
let point_prime =  p: lseq uint64 12{let x = Lib.Sequence.sub p 0 4 in let y = Lib.Sequence.sub p 4 4 in let z = Lib.Sequence.sub p 8 4 in 
  felem_seq_as_nat x < prime /\ felem_seq_as_nat y < prime /\ felem_seq_as_nat z < prime} 


inline_for_extraction
type point = lbuffer uint64 (size 12)

noextract 
let point_x_as_nat (h: mem) (e: point) : GTot nat = 
  let open Lib.Sequence in 
  let s = as_seq h e in 
  let s0 = s.[0] in
  let s1 = s.[1] in 
  let s2 = s.[2] in 
  let s3 = s.[3] in 
  as_nat4 (s0, s1, s2, s3)

noextract 
let point_y_as_nat (h: mem) (e: point) : GTot nat = 
  let open Lib.Sequence in 
  let s = as_seq h e in 
  let s0 = s.[4] in
  let s1 = s.[5] in 
  let s2 = s.[6] in 
  let s3 = s.[7] in 
  as_nat4 (s0, s1, s2, s3)

noextract 
let point_z_as_nat (h: mem) (e: point) : GTot nat = 
  let open Lib.Sequence in 
  let s = as_seq h e in 
  let s0 = s.[8] in
  let s1 = s.[9] in 
  let s2 = s.[10] in 
  let s3 = s.[11] in 
  as_nat4 (s0, s1, s2, s3)

type scalar = lbuffer uint8 (size 32)

val border_felem4: f: felem4 -> Lemma (as_nat4 f < pow2 256)
let border_felem4 f = admit()

noextract
val as_nat9: f: felem9 -> Tot nat 
let as_nat9 f = 
  let (s0, s1, s2, s3, s4, s5, s6, s7, s8) = f in
  v s0 + v s1 * pow2 64 + v s2 * pow2 64 * pow2 64 +
  v s3 * pow2 64 * pow2 64 * pow2 64 +
  v s4 * pow2 64 * pow2 64 * pow2 64 * pow2 64 +
  v s5 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 +
  v s6 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 +
  v s7 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 +
  v s8 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 * pow2 64 