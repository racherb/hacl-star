module Lib.Arithmetic.Sums

open Lib.IntTypes
open Lib.Sequence

open Lib.Arithmetic.Group
open Lib.Arithmetic.Ring

open FStar.Mul

open FStar.Tactics.Typeclasses

module Seq = Lib.Sequence
module Loops = Lib.LoopCombinators

#reset-options "--z3rlimit 200 --max_fuel 0 --max_ifuel 0 --using_facts_from '* -FStar.Seq'"

val br: i:size_nat -> x:nat{x<pow2 i} -> y:nat{y<pow2 i}

val br_involutive: i:size_nat -> x:nat{x<pow2 i} -> Lemma (br i (br i x) = x)

val reorg: #a:Type0 -> #n:size_nat -> i:size_nat{n = pow2 i} -> p:lseq a n -> lseq a n

val reorg_involutive: #a:Type0 -> #n:size_nat -> i:size_nat{n = pow2 i} -> p:lseq a n -> Lemma (reorg i (reorg i p) == p)

val split_seq:
   #a:Type0
   -> #n:size_nat{n%2=0}
   -> p:lseq a n
   -> Tot (p':((lseq a (n / 2)) & (lseq a (n / 2))){let (peven,podd)=p' in forall(k:nat{k < n / 2}). peven.[k] == p.[2*k] /\ podd.[k] == p.[2*k+1]})

val join_seq:
  #a:Type0
  -> #[tcresolve ()] r:ring a
  -> #n:size_nat{n%2=0}
  -> peven:lseq a (n/2)
  -> podd:lseq a (n/2)
  -> p:lseq a n{forall(k:nat{k<n/2}). p.[2*k] == peven.[k] /\ p.[2*k+1] == podd.[k]}


val lemma_split_join:
  #a:Type0
  -> #[tcresolve ()] r:ring a
  -> #n:size_nat{n%2=0}
  -> p:lseq a n
  -> Lemma (let peven,podd = split_seq p in join_seq peven podd == p)


val lemma_join_split:
  #a:Type0
  -> #[tcresolve ()] r:ring a
  -> #n:size_nat{n%2=0}
  -> p1:lseq a (n/2)
  -> p2:lseq a (n/2)
  -> Lemma (let peven,podd = split_seq (join_seq p1 p2) in peven == p1 /\ podd == p2)


val sum_n:
  #a:Type0
  -> #[tcresolve ()] m: monoid a
  -> #n:size_nat
  -> l:lseq a n
  -> Tot (s:a) (decreases n)

val sum_n_zero_elements_is_id:
  #a:Type0
  -> #[tcresolve ()] m: monoid a
  -> p:lseq a 0
  -> Lemma (ensures sum_n p == id)

val sum_n_simple_lemma2:
  #a:Type0
  -> #[FStar.Tactics.Typeclasses.tcresolve ()] r:monoid a
  -> #n:size_nat{n>=1}
  -> l:lseq a n
  -> Lemma (ensures sum_n l == op (sum_n (sub l 0 (n-1))) (l.[n-1]))
	  (decreases n)


val sum_n_simple_lemma1:
  #a:Type0
  -> #[FStar.Tactics.Typeclasses.tcresolve ()] r:monoid a
  -> #n:size_nat{n>=1}
  -> l:lseq a n
  -> Lemma (ensures sum_n l == op l.[0] (sum_n (sub l 1 (n-1))))
	  (decreases n)

val sum_n_split_lemma:
  #a:Type0
  -> #[FStar.Tactics.Typeclasses.tcresolve ()] r:ring a
  -> #n:size_nat{n%2 = 0}
  -> l:lseq a n
  -> leven:lseq a (n/2)
  -> lodd:lseq a (n/2)
  -> Lemma (requires (leven,lodd) == split_seq l) (ensures sum_n #a #add_ag.g.m l == plus (sum_n #a #add_ag.g.m leven) (sum_n #a #add_ag.g.m lodd))
	  (decreases n)

val sum_n_mul_distrib_l_lemma:
  #a:Type0
  -> #[tcresolve ()] r:ring a
  -> #n:size_nat
  -> l:lseq a n
  -> k:a
  -> Lemma (ensures mul k (sum_n #a #add_ag.g.m l) == sum_n #a #add_ag.g.m (Seq.map (fun x -> mul k x) l))
	  (decreases n)

val sum_n_mul_distrib_r_lemma:
  #a:Type0
  -> #[tcresolve ()] r:ring a
  -> #n:size_nat
  -> l:lseq a n
  -> k:a
  -> Lemma (ensures mul (sum_n #a #add_ag.g.m l) k == sum_n #a #add_ag.g.m (Seq.map (fun x -> mul x k) l))
	  (decreases n)

val sum_n_all_id:
  #a:Type0
  -> #[tcresolve ()] m:monoid a
  -> #n:size_nat
  -> l:lseq a n{forall (k:nat{k<n}). l.[k] == id #a}
  -> Lemma (ensures (sum_n l == id #a))
	  (decreases n)

val sum_n_one_non_id_coeff:
  #a:Type0
  -> #[tcresolve ()] m:monoid a
  -> #n:size_nat
  -> k:nat{k<n}
  -> l:lseq a n{forall (d:nat{d<n}). d <> k ==> l.[d] == id #a}
  -> Lemma (ensures sum_n l == l.[k]) (decreases k)

val sum_n_all_c_is_repeat_c_n:
  #a:Type0
  -> #[tcresolve ()] m:monoid a
  -> #n:size_nat{n>=0}
  -> c:a
  -> l:lseq a n{forall(d:nat{d<n}). l.[d] == c}
  -> Lemma (ensures sum_n l == repeat_op c n) (decreases n)

val sum_n_fubini:
  #a:Type0
  -> #b:Type0
  -> #c:Type0
  -> #[tcresolve ()] cm: commutative_monoid c
  -> #n1:size_nat
  -> #n2:size_nat
  -> f: (a -> b -> c)
  -> l1: lseq a n1
  -> l2: lseq b n2
  //-> s1: lseq c n1
  //-> s2: lseq c n2
  -> Lemma (*(requires (let m = add_ag.g.m in s1 == Seq.map (fun x -> sum_n (Seq.map (fun y -> f x y) l2)) l1 /\ s2 == Seq.map (fun y -> sum_n (Seq.map (fun x -> f x y) l1)) l2))*) (ensures (let m = bm #c in let s1 = Seq.map (fun x -> sum_n (Seq.map (fun y -> f x y) l2)) l1 in let s2 = Seq.map (fun y -> sum_n (Seq.map (fun x -> f x y) l1)) l2 in sum_n s1 == sum_n s2))
	  (decreases n2)

val sum_n_fubini_ring:
  #a:Type0
  -> #b:Type0
  -> #c:Type0
  -> #[tcresolve ()] r: ring c
  -> #n1:size_nat
  -> #n2:size_nat
  -> f: (a -> b -> c)
  -> l1: lseq a n1
  -> l2: lseq b n2
  //-> s1: lseq c n1
  //-> s2: lseq c n2
  -> Lemma (*(requires (let m = add_ag.g.m in s1 == Seq.map (fun x -> sum_n (Seq.map (fun y -> f x y) l2)) l1 /\ s2 == Seq.map (fun y -> sum_n (Seq.map (fun x -> f x y) l1)) l2))*) (ensures (let m = (add_ag #c).g.m in let s1 = Seq.map (fun x -> sum_n (Seq.map (fun y -> f x y) l2)) l1 in let s2 = Seq.map (fun y -> sum_n (Seq.map (fun x -> f x y) l1)) l2 in sum_n s1 == sum_n s2))
	  (decreases n2)
