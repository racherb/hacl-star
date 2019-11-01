module Hacl.HPKE.Curve51_CP32_SHA256

open Hacl.Impl.HPKE
module DH = Spec.Agile.DH
module AEAD = Spec.Agile.AEAD
module Hash = Spec.Agile.Hash

noextract unfold
let cs = (DH.DH_Curve25519, AEAD.CHACHA20_POLY1305, Hash.SHA2_256)

val setupBaseI: setupBaseI_st cs

val setupBaseR: setupBaseR_st cs

val encryptBase: encryptBase_st cs

val decryptBase: decryptBase_st cs