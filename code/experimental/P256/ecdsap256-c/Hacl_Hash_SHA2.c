/* 
  This file was generated by KreMLin <https://github.com/FStarLang/kremlin>
  KreMLin invocation: /home/nkulatov/new2/kremlin/kremlin/krml -fbuiltin-uint128 -fnocompound-literals -fc89-scope -fparentheses -fcurly-braces -funroll-loops 4 -warn-error +9 -add-include "kremlib.h" -add-include "FStar_UInt_8_16_32_64.h" /dist/minimal/testlib.c -skip-compilation -no-prefix Hacl.Impl.P256 -bundle Lib.* -bundle Spec.* -bundle C=C.Endianness -bundle Hacl.Hash.SHA2=Hacl.Hash.*,Spec.Hash.* -bundle Hacl.Impl.P256=Hacl.Impl.P256.Arithmetics,Hacl.Impl.P256.PointDouble,Hacl.Impl.P256.PointAdd,Hacl.Impl.P256,Hacl.Impl.P256.MontgomeryMultiplication,Hacl.Impl.P256.LowLevel,Hacl.Impl.LowLevel,Hacl.Impl.SolinasReduction,Hacl.Spec.P256.*,Hacl.Spec.Curve25519.*,Hacl.Impl.Curve25519.* -bundle Hacl.Impl.ECDSA.P256SHA256.Verification=Hacl.Impl.MontgomeryMultiplication,Hacl.Impl.ECDSA.P256SHA256.Verification,Hacl.Impl.MM.Exponent -library C,FStar -drop LowStar,Spec,Prims,Lib,C.Loops.*,Hacl.Spec.P256.Lemmas,Hacl.Spec.P256,Hacl.Spec.ECDSA,Hacl.Spec.Ladder -add-include "c/Lib_PrintBuffer.h" -add-include "FStar_UInt_8_16_32_64.h" -tmpdir ecdsap256-c .output/prims.krml .output/FStar_Pervasives_Native.krml .output/FStar_Pervasives.krml .output/FStar_Squash.krml .output/FStar_Classical.krml .output/FStar_StrongExcludedMiddle.krml .output/FStar_FunctionalExtensionality.krml .output/FStar_List_Tot_Base.krml .output/FStar_List_Tot_Properties.krml .output/FStar_List_Tot.krml .output/FStar_Mul.krml .output/FStar_Math_Lib.krml .output/FStar_Math_Lemmas.krml .output/FStar_Seq_Base.krml .output/FStar_Seq_Properties.krml .output/FStar_Seq.krml .output/FStar_Set.krml .output/FStar_Preorder.krml .output/FStar_Ghost.krml .output/FStar_ErasedLogic.krml .output/FStar_PropositionalExtensionality.krml .output/FStar_PredicateExtensionality.krml .output/FStar_TSet.krml .output/FStar_Monotonic_Heap.krml .output/FStar_Heap.krml .output/FStar_Map.krml .output/FStar_Monotonic_Witnessed.krml .output/FStar_Monotonic_HyperHeap.krml .output/FStar_Monotonic_HyperStack.krml .output/FStar_HyperStack.krml .output/FStar_HyperStack_ST.krml .output/FStar_Calc.krml .output/FStar_BitVector.krml .output/FStar_UInt.krml .output/FStar_UInt32.krml .output/FStar_Universe.krml .output/FStar_GSet.krml .output/FStar_ModifiesGen.krml .output/FStar_Range.krml .output/FStar_Reflection_Types.krml .output/FStar_Tactics_Types.krml .output/FStar_Tactics_Result.krml .output/FStar_Tactics_Effect.krml .output/FStar_Tactics_Util.krml .output/FStar_Reflection_Data.krml .output/FStar_Reflection_Const.krml .output/FStar_Char.krml .output/FStar_Exn.krml .output/FStar_ST.krml .output/FStar_All.krml .output/FStar_List.krml .output/FStar_String.krml .output/FStar_Order.krml .output/FStar_Reflection_Basic.krml .output/FStar_Reflection_Derived.krml .output/FStar_Tactics_Builtins.krml .output/FStar_Reflection_Formula.krml .output/FStar_Reflection_Derived_Lemmas.krml .output/FStar_Reflection.krml .output/FStar_Tactics_Derived.krml .output/FStar_Tactics_Logic.krml .output/FStar_Tactics.krml .output/FStar_BigOps.krml .output/LowStar_Monotonic_Buffer.krml .output/LowStar_Buffer.krml .output/LowStar_BufferOps.krml .output/Spec_Loops.krml .output/FStar_UInt64.krml .output/C_Loops.krml .output/FStar_Int.krml .output/FStar_Int64.krml .output/FStar_Int63.krml .output/FStar_Int32.krml .output/FStar_Int16.krml .output/FStar_Int8.krml .output/FStar_UInt63.krml .output/FStar_UInt16.krml .output/FStar_UInt8.krml .output/FStar_Int_Cast.krml .output/FStar_UInt128.krml .output/FStar_Int_Cast_Full.krml .output/FStar_Int128.krml .output/Lib_IntTypes.krml .output/Lib_Loops.krml .output/Lib_LoopCombinators.krml .output/Lib_RawIntTypes.krml .output/Lib_Sequence.krml .output/Lib_ByteSequence.krml .output/LowStar_ImmutableBuffer.krml .output/Lib_Buffer.krml .output/FStar_HyperStack_All.krml .output/Hacl_Spec_ECDSAP256_Definition.krml .output/Spec_Hash_Definitions.krml .output/Spec_Hash_Lemmas0.krml .output/Spec_Hash_PadFinish.krml .output/Spec_SHA1.krml .output/Spec_MD5.krml .output/Spec_SHA2_Constants.krml .output/Spec_SHA2.krml .output/Spec_Hash.krml .output/FStar_Reflection_Arith.krml .output/FStar_Tactics_Canon.krml .output/Hacl_Spec_P256_Definitions.krml .output/Hacl_Spec_P256_Lemmas.krml .output/Hacl_Spec_P256.krml .output/Hacl_Spec_ECDSA.krml .output/Hacl_Impl_LowLevel.krml .output/Hacl_Spec_P256_MontgomeryMultiplication.krml .output/Hacl_Impl_P256_LowLevel.krml .output/Hacl_Spec_P256_SolinasReduction.krml .output/Hacl_Impl_SolinasReduction.krml .output/FStar_Kremlin_Endianness.krml .output/C_Endianness.krml .output/C.krml .output/Lib_ByteBuffer.krml .output/Spec_Hash_Incremental.krml .output/Spec_Hash_Lemmas.krml .output/Hacl_Hash_Lemmas.krml .output/LowStar_Modifies.krml .output/Hacl_Hash_Definitions.krml .output/Hacl_Hash_PadFinish.krml .output/Hacl_Hash_MD.krml .output/Hacl_Math.krml .output/Hacl_Impl_P256_MontgomeryMultiplication.krml .output/Hacl_Impl_P256_Arithmetics.krml .output/Hacl_Impl_ECDSA_MontgomeryMultiplication.krml .output/Hacl_Spec_P256_MontgomeryMultiplication_PointDouble.krml .output/Hacl_Spec_P256_MontgomeryMultiplication_PointAdd.krml .output/Hacl_Spec_P256_Ladder.krml .output/Hacl_Impl_ECDSA_MM_Exponent.krml .output/Hacl_Hash_Core_SHA2_Constants.krml .output/Hacl_Hash_Core_SHA2.krml .output/Hacl_Hash_SHA2.krml .output/Hacl_Spec_P256_Normalisation.krml .output/Hacl_Impl_P256_PointDouble.krml .output/Hacl_Impl_P256_PointAdd.krml .output/Hacl_Impl_P256.krml .output/Hacl_Impl_ECDSA_P256SHA256_Verification.krml .output/Hacl_Impl_ECDSA_P256SHA256_Signature.krml
  F* version: 0fd6ae12
  KreMLin version: 27ce15c8
 */

#include "Hacl_Hash_SHA2.h"

static uint32_t
Hacl_Hash_Core_SHA2_Constants_k224_256[64U] =
  {
    (uint32_t)0x428a2f98U, (uint32_t)0x71374491U, (uint32_t)0xb5c0fbcfU, (uint32_t)0xe9b5dba5U,
    (uint32_t)0x3956c25bU, (uint32_t)0x59f111f1U, (uint32_t)0x923f82a4U, (uint32_t)0xab1c5ed5U,
    (uint32_t)0xd807aa98U, (uint32_t)0x12835b01U, (uint32_t)0x243185beU, (uint32_t)0x550c7dc3U,
    (uint32_t)0x72be5d74U, (uint32_t)0x80deb1feU, (uint32_t)0x9bdc06a7U, (uint32_t)0xc19bf174U,
    (uint32_t)0xe49b69c1U, (uint32_t)0xefbe4786U, (uint32_t)0x0fc19dc6U, (uint32_t)0x240ca1ccU,
    (uint32_t)0x2de92c6fU, (uint32_t)0x4a7484aaU, (uint32_t)0x5cb0a9dcU, (uint32_t)0x76f988daU,
    (uint32_t)0x983e5152U, (uint32_t)0xa831c66dU, (uint32_t)0xb00327c8U, (uint32_t)0xbf597fc7U,
    (uint32_t)0xc6e00bf3U, (uint32_t)0xd5a79147U, (uint32_t)0x06ca6351U, (uint32_t)0x14292967U,
    (uint32_t)0x27b70a85U, (uint32_t)0x2e1b2138U, (uint32_t)0x4d2c6dfcU, (uint32_t)0x53380d13U,
    (uint32_t)0x650a7354U, (uint32_t)0x766a0abbU, (uint32_t)0x81c2c92eU, (uint32_t)0x92722c85U,
    (uint32_t)0xa2bfe8a1U, (uint32_t)0xa81a664bU, (uint32_t)0xc24b8b70U, (uint32_t)0xc76c51a3U,
    (uint32_t)0xd192e819U, (uint32_t)0xd6990624U, (uint32_t)0xf40e3585U, (uint32_t)0x106aa070U,
    (uint32_t)0x19a4c116U, (uint32_t)0x1e376c08U, (uint32_t)0x2748774cU, (uint32_t)0x34b0bcb5U,
    (uint32_t)0x391c0cb3U, (uint32_t)0x4ed8aa4aU, (uint32_t)0x5b9cca4fU, (uint32_t)0x682e6ff3U,
    (uint32_t)0x748f82eeU, (uint32_t)0x78a5636fU, (uint32_t)0x84c87814U, (uint32_t)0x8cc70208U,
    (uint32_t)0x90befffaU, (uint32_t)0xa4506cebU, (uint32_t)0xbef9a3f7U, (uint32_t)0xc67178f2U
  };

static uint64_t
Hacl_Hash_Core_SHA2_Constants_k384_512[80U] =
  {
    (uint64_t)0x428a2f98d728ae22U, (uint64_t)0x7137449123ef65cdU, (uint64_t)0xb5c0fbcfec4d3b2fU,
    (uint64_t)0xe9b5dba58189dbbcU, (uint64_t)0x3956c25bf348b538U, (uint64_t)0x59f111f1b605d019U,
    (uint64_t)0x923f82a4af194f9bU, (uint64_t)0xab1c5ed5da6d8118U, (uint64_t)0xd807aa98a3030242U,
    (uint64_t)0x12835b0145706fbeU, (uint64_t)0x243185be4ee4b28cU, (uint64_t)0x550c7dc3d5ffb4e2U,
    (uint64_t)0x72be5d74f27b896fU, (uint64_t)0x80deb1fe3b1696b1U, (uint64_t)0x9bdc06a725c71235U,
    (uint64_t)0xc19bf174cf692694U, (uint64_t)0xe49b69c19ef14ad2U, (uint64_t)0xefbe4786384f25e3U,
    (uint64_t)0x0fc19dc68b8cd5b5U, (uint64_t)0x240ca1cc77ac9c65U, (uint64_t)0x2de92c6f592b0275U,
    (uint64_t)0x4a7484aa6ea6e483U, (uint64_t)0x5cb0a9dcbd41fbd4U, (uint64_t)0x76f988da831153b5U,
    (uint64_t)0x983e5152ee66dfabU, (uint64_t)0xa831c66d2db43210U, (uint64_t)0xb00327c898fb213fU,
    (uint64_t)0xbf597fc7beef0ee4U, (uint64_t)0xc6e00bf33da88fc2U, (uint64_t)0xd5a79147930aa725U,
    (uint64_t)0x06ca6351e003826fU, (uint64_t)0x142929670a0e6e70U, (uint64_t)0x27b70a8546d22ffcU,
    (uint64_t)0x2e1b21385c26c926U, (uint64_t)0x4d2c6dfc5ac42aedU, (uint64_t)0x53380d139d95b3dfU,
    (uint64_t)0x650a73548baf63deU, (uint64_t)0x766a0abb3c77b2a8U, (uint64_t)0x81c2c92e47edaee6U,
    (uint64_t)0x92722c851482353bU, (uint64_t)0xa2bfe8a14cf10364U, (uint64_t)0xa81a664bbc423001U,
    (uint64_t)0xc24b8b70d0f89791U, (uint64_t)0xc76c51a30654be30U, (uint64_t)0xd192e819d6ef5218U,
    (uint64_t)0xd69906245565a910U, (uint64_t)0xf40e35855771202aU, (uint64_t)0x106aa07032bbd1b8U,
    (uint64_t)0x19a4c116b8d2d0c8U, (uint64_t)0x1e376c085141ab53U, (uint64_t)0x2748774cdf8eeb99U,
    (uint64_t)0x34b0bcb5e19b48a8U, (uint64_t)0x391c0cb3c5c95a63U, (uint64_t)0x4ed8aa4ae3418acbU,
    (uint64_t)0x5b9cca4f7763e373U, (uint64_t)0x682e6ff3d6b2b8a3U, (uint64_t)0x748f82ee5defb2fcU,
    (uint64_t)0x78a5636f43172f60U, (uint64_t)0x84c87814a1f0ab72U, (uint64_t)0x8cc702081a6439ecU,
    (uint64_t)0x90befffa23631e28U, (uint64_t)0xa4506cebde82bde9U, (uint64_t)0xbef9a3f7b2c67915U,
    (uint64_t)0xc67178f2e372532bU, (uint64_t)0xca273eceea26619cU, (uint64_t)0xd186b8c721c0c207U,
    (uint64_t)0xeada7dd6cde0eb1eU, (uint64_t)0xf57d4f7fee6ed178U, (uint64_t)0x06f067aa72176fbaU,
    (uint64_t)0x0a637dc5a2c898a6U, (uint64_t)0x113f9804bef90daeU, (uint64_t)0x1b710b35131c471bU,
    (uint64_t)0x28db77f523047d84U, (uint64_t)0x32caab7b40c72493U, (uint64_t)0x3c9ebe0a15c9bebcU,
    (uint64_t)0x431d67c49c100d4cU, (uint64_t)0x4cc5d4becb3e42b6U, (uint64_t)0x597f299cfc657e2aU,
    (uint64_t)0x5fcb6fab3ad6faecU, (uint64_t)0x6c44198c4a475817U
  };

static void Hacl_Hash_Core_SHA2_update_224(uint32_t *hash1, uint8_t *block)
{
  uint32_t hash11[8U] = { 0U };
  uint32_t computed_ws[64U] = { 0U };
  {
    uint32_t i;
    for (i = (uint32_t)0U; i < (uint32_t)64U; i = i + (uint32_t)1U)
    {
      if (i < (uint32_t)16U)
      {
        uint8_t *b = block + i * (uint32_t)4U;
        uint32_t u = load32_be(b);
        computed_ws[i] = u;
      }
      else
      {
        uint32_t t16 = computed_ws[i - (uint32_t)16U];
        uint32_t t15 = computed_ws[i - (uint32_t)15U];
        uint32_t t7 = computed_ws[i - (uint32_t)7U];
        uint32_t t2 = computed_ws[i - (uint32_t)2U];
        uint32_t
        s1 =
          (t2 >> (uint32_t)17U | t2 << (uint32_t)15U)
          ^ ((t2 >> (uint32_t)19U | t2 << (uint32_t)13U) ^ t2 >> (uint32_t)10U);
        uint32_t
        s0 =
          (t15 >> (uint32_t)7U | t15 << (uint32_t)25U)
          ^ ((t15 >> (uint32_t)18U | t15 << (uint32_t)14U) ^ t15 >> (uint32_t)3U);
        uint32_t w = s1 + t7 + s0 + t16;
        computed_ws[i] = w;
      }
    }
  }
  memcpy(hash11, hash1, (uint32_t)8U * sizeof hash1[0U]);
  {
    uint32_t i;
    for (i = (uint32_t)0U; i < (uint32_t)64U; i = i + (uint32_t)1U)
    {
      uint32_t a0 = hash11[0U];
      uint32_t b0 = hash11[1U];
      uint32_t c0 = hash11[2U];
      uint32_t d0 = hash11[3U];
      uint32_t e0 = hash11[4U];
      uint32_t f0 = hash11[5U];
      uint32_t g0 = hash11[6U];
      uint32_t h03 = hash11[7U];
      uint32_t w = computed_ws[i];
      uint32_t
      t1 =
        h03
        +
          ((e0 >> (uint32_t)6U | e0 << (uint32_t)26U)
          ^
            ((e0 >> (uint32_t)11U | e0 << (uint32_t)21U)
            ^ (e0 >> (uint32_t)25U | e0 << (uint32_t)7U)))
        + ((e0 & f0) ^ (~e0 & g0))
        + Hacl_Hash_Core_SHA2_Constants_k224_256[i]
        + w;
      uint32_t
      t2 =
        ((a0 >> (uint32_t)2U | a0 << (uint32_t)30U)
        ^
          ((a0 >> (uint32_t)13U | a0 << (uint32_t)19U)
          ^ (a0 >> (uint32_t)22U | a0 << (uint32_t)10U)))
        + ((a0 & b0) ^ ((a0 & c0) ^ (b0 & c0)));
      hash11[0U] = t1 + t2;
      hash11[1U] = a0;
      hash11[2U] = b0;
      hash11[3U] = c0;
      hash11[4U] = d0 + t1;
      hash11[5U] = e0;
      hash11[6U] = f0;
      hash11[7U] = g0;
    }
  }
  {
    uint32_t i;
    for (i = (uint32_t)0U; i < (uint32_t)8U; i = i + (uint32_t)1U)
    {
      uint32_t xi = hash1[i];
      uint32_t yi = hash11[i];
      hash1[i] = xi + yi;
    }
  }
}

static void Hacl_Hash_Core_SHA2_update_256(uint32_t *hash1, uint8_t *block)
{
  uint32_t hash11[8U] = { 0U };
  uint32_t computed_ws[64U] = { 0U };
  {
    uint32_t i;
    for (i = (uint32_t)0U; i < (uint32_t)64U; i = i + (uint32_t)1U)
    {
      if (i < (uint32_t)16U)
      {
        uint8_t *b = block + i * (uint32_t)4U;
        uint32_t u = load32_be(b);
        computed_ws[i] = u;
      }
      else
      {
        uint32_t t16 = computed_ws[i - (uint32_t)16U];
        uint32_t t15 = computed_ws[i - (uint32_t)15U];
        uint32_t t7 = computed_ws[i - (uint32_t)7U];
        uint32_t t2 = computed_ws[i - (uint32_t)2U];
        uint32_t
        s1 =
          (t2 >> (uint32_t)17U | t2 << (uint32_t)15U)
          ^ ((t2 >> (uint32_t)19U | t2 << (uint32_t)13U) ^ t2 >> (uint32_t)10U);
        uint32_t
        s0 =
          (t15 >> (uint32_t)7U | t15 << (uint32_t)25U)
          ^ ((t15 >> (uint32_t)18U | t15 << (uint32_t)14U) ^ t15 >> (uint32_t)3U);
        uint32_t w = s1 + t7 + s0 + t16;
        computed_ws[i] = w;
      }
    }
  }
  memcpy(hash11, hash1, (uint32_t)8U * sizeof hash1[0U]);
  {
    uint32_t i;
    for (i = (uint32_t)0U; i < (uint32_t)64U; i = i + (uint32_t)1U)
    {
      uint32_t a0 = hash11[0U];
      uint32_t b0 = hash11[1U];
      uint32_t c0 = hash11[2U];
      uint32_t d0 = hash11[3U];
      uint32_t e0 = hash11[4U];
      uint32_t f0 = hash11[5U];
      uint32_t g0 = hash11[6U];
      uint32_t h03 = hash11[7U];
      uint32_t w = computed_ws[i];
      uint32_t
      t1 =
        h03
        +
          ((e0 >> (uint32_t)6U | e0 << (uint32_t)26U)
          ^
            ((e0 >> (uint32_t)11U | e0 << (uint32_t)21U)
            ^ (e0 >> (uint32_t)25U | e0 << (uint32_t)7U)))
        + ((e0 & f0) ^ (~e0 & g0))
        + Hacl_Hash_Core_SHA2_Constants_k224_256[i]
        + w;
      uint32_t
      t2 =
        ((a0 >> (uint32_t)2U | a0 << (uint32_t)30U)
        ^
          ((a0 >> (uint32_t)13U | a0 << (uint32_t)19U)
          ^ (a0 >> (uint32_t)22U | a0 << (uint32_t)10U)))
        + ((a0 & b0) ^ ((a0 & c0) ^ (b0 & c0)));
      hash11[0U] = t1 + t2;
      hash11[1U] = a0;
      hash11[2U] = b0;
      hash11[3U] = c0;
      hash11[4U] = d0 + t1;
      hash11[5U] = e0;
      hash11[6U] = f0;
      hash11[7U] = g0;
    }
  }
  {
    uint32_t i;
    for (i = (uint32_t)0U; i < (uint32_t)8U; i = i + (uint32_t)1U)
    {
      uint32_t xi = hash1[i];
      uint32_t yi = hash11[i];
      hash1[i] = xi + yi;
    }
  }
}

static void Hacl_Hash_Core_SHA2_update_384(uint64_t *hash1, uint8_t *block)
{
  uint64_t hash11[8U] = { 0U };
  uint64_t computed_ws[80U] = { 0U };
  {
    uint32_t i;
    for (i = (uint32_t)0U; i < (uint32_t)80U; i = i + (uint32_t)1U)
    {
      if (i < (uint32_t)16U)
      {
        uint8_t *b = block + i * (uint32_t)8U;
        uint64_t u = load64_be(b);
        computed_ws[i] = u;
      }
      else
      {
        uint64_t t16 = computed_ws[i - (uint32_t)16U];
        uint64_t t15 = computed_ws[i - (uint32_t)15U];
        uint64_t t7 = computed_ws[i - (uint32_t)7U];
        uint64_t t2 = computed_ws[i - (uint32_t)2U];
        uint64_t
        s1 =
          (t2 >> (uint32_t)19U | t2 << (uint32_t)45U)
          ^ ((t2 >> (uint32_t)61U | t2 << (uint32_t)3U) ^ t2 >> (uint32_t)6U);
        uint64_t
        s0 =
          (t15 >> (uint32_t)1U | t15 << (uint32_t)63U)
          ^ ((t15 >> (uint32_t)8U | t15 << (uint32_t)56U) ^ t15 >> (uint32_t)7U);
        uint64_t w = s1 + t7 + s0 + t16;
        computed_ws[i] = w;
      }
    }
  }
  memcpy(hash11, hash1, (uint32_t)8U * sizeof hash1[0U]);
  {
    uint32_t i;
    for (i = (uint32_t)0U; i < (uint32_t)80U; i = i + (uint32_t)1U)
    {
      uint64_t a0 = hash11[0U];
      uint64_t b0 = hash11[1U];
      uint64_t c0 = hash11[2U];
      uint64_t d0 = hash11[3U];
      uint64_t e0 = hash11[4U];
      uint64_t f0 = hash11[5U];
      uint64_t g0 = hash11[6U];
      uint64_t h03 = hash11[7U];
      uint64_t w = computed_ws[i];
      uint64_t
      t1 =
        h03
        +
          ((e0 >> (uint32_t)14U | e0 << (uint32_t)50U)
          ^
            ((e0 >> (uint32_t)18U | e0 << (uint32_t)46U)
            ^ (e0 >> (uint32_t)41U | e0 << (uint32_t)23U)))
        + ((e0 & f0) ^ (~e0 & g0))
        + Hacl_Hash_Core_SHA2_Constants_k384_512[i]
        + w;
      uint64_t
      t2 =
        ((a0 >> (uint32_t)28U | a0 << (uint32_t)36U)
        ^
          ((a0 >> (uint32_t)34U | a0 << (uint32_t)30U)
          ^ (a0 >> (uint32_t)39U | a0 << (uint32_t)25U)))
        + ((a0 & b0) ^ ((a0 & c0) ^ (b0 & c0)));
      hash11[0U] = t1 + t2;
      hash11[1U] = a0;
      hash11[2U] = b0;
      hash11[3U] = c0;
      hash11[4U] = d0 + t1;
      hash11[5U] = e0;
      hash11[6U] = f0;
      hash11[7U] = g0;
    }
  }
  {
    uint32_t i;
    for (i = (uint32_t)0U; i < (uint32_t)8U; i = i + (uint32_t)1U)
    {
      uint64_t xi = hash1[i];
      uint64_t yi = hash11[i];
      hash1[i] = xi + yi;
    }
  }
}

static void Hacl_Hash_Core_SHA2_update_512(uint64_t *hash1, uint8_t *block)
{
  uint64_t hash11[8U] = { 0U };
  uint64_t computed_ws[80U] = { 0U };
  {
    uint32_t i;
    for (i = (uint32_t)0U; i < (uint32_t)80U; i = i + (uint32_t)1U)
    {
      if (i < (uint32_t)16U)
      {
        uint8_t *b = block + i * (uint32_t)8U;
        uint64_t u = load64_be(b);
        computed_ws[i] = u;
      }
      else
      {
        uint64_t t16 = computed_ws[i - (uint32_t)16U];
        uint64_t t15 = computed_ws[i - (uint32_t)15U];
        uint64_t t7 = computed_ws[i - (uint32_t)7U];
        uint64_t t2 = computed_ws[i - (uint32_t)2U];
        uint64_t
        s1 =
          (t2 >> (uint32_t)19U | t2 << (uint32_t)45U)
          ^ ((t2 >> (uint32_t)61U | t2 << (uint32_t)3U) ^ t2 >> (uint32_t)6U);
        uint64_t
        s0 =
          (t15 >> (uint32_t)1U | t15 << (uint32_t)63U)
          ^ ((t15 >> (uint32_t)8U | t15 << (uint32_t)56U) ^ t15 >> (uint32_t)7U);
        uint64_t w = s1 + t7 + s0 + t16;
        computed_ws[i] = w;
      }
    }
  }
  memcpy(hash11, hash1, (uint32_t)8U * sizeof hash1[0U]);
  {
    uint32_t i;
    for (i = (uint32_t)0U; i < (uint32_t)80U; i = i + (uint32_t)1U)
    {
      uint64_t a0 = hash11[0U];
      uint64_t b0 = hash11[1U];
      uint64_t c0 = hash11[2U];
      uint64_t d0 = hash11[3U];
      uint64_t e0 = hash11[4U];
      uint64_t f0 = hash11[5U];
      uint64_t g0 = hash11[6U];
      uint64_t h03 = hash11[7U];
      uint64_t w = computed_ws[i];
      uint64_t
      t1 =
        h03
        +
          ((e0 >> (uint32_t)14U | e0 << (uint32_t)50U)
          ^
            ((e0 >> (uint32_t)18U | e0 << (uint32_t)46U)
            ^ (e0 >> (uint32_t)41U | e0 << (uint32_t)23U)))
        + ((e0 & f0) ^ (~e0 & g0))
        + Hacl_Hash_Core_SHA2_Constants_k384_512[i]
        + w;
      uint64_t
      t2 =
        ((a0 >> (uint32_t)28U | a0 << (uint32_t)36U)
        ^
          ((a0 >> (uint32_t)34U | a0 << (uint32_t)30U)
          ^ (a0 >> (uint32_t)39U | a0 << (uint32_t)25U)))
        + ((a0 & b0) ^ ((a0 & c0) ^ (b0 & c0)));
      hash11[0U] = t1 + t2;
      hash11[1U] = a0;
      hash11[2U] = b0;
      hash11[3U] = c0;
      hash11[4U] = d0 + t1;
      hash11[5U] = e0;
      hash11[6U] = f0;
      hash11[7U] = g0;
    }
  }
  {
    uint32_t i;
    for (i = (uint32_t)0U; i < (uint32_t)8U; i = i + (uint32_t)1U)
    {
      uint64_t xi = hash1[i];
      uint64_t yi = hash11[i];
      hash1[i] = xi + yi;
    }
  }
}

static void Hacl_Hash_Core_SHA2_pad_224(uint64_t len, uint8_t *dst)
{
  uint8_t *dst1 = dst;
  uint8_t *dst2;
  uint8_t *dst3;
  dst1[0U] = (uint8_t)0x80U;
  dst2 = dst + (uint32_t)1U;
  {
    uint32_t i;
    for
    (i
      = (uint32_t)0U;
      i
      <
        ((uint32_t)128U - ((uint32_t)9U + (uint32_t)(len % (uint64_t)(uint32_t)64U)))
        % (uint32_t)64U;
      i = i + (uint32_t)1U)
    {
      dst2[i] = (uint8_t)0U;
    }
  }
  dst3 =
    dst
    +
      (uint32_t)1U
      +
        ((uint32_t)128U - ((uint32_t)9U + (uint32_t)(len % (uint64_t)(uint32_t)64U)))
        % (uint32_t)64U;
  store64_be(dst3, len << (uint32_t)3U);
}

static void Hacl_Hash_Core_SHA2_pad_256(uint64_t len, uint8_t *dst)
{
  uint8_t *dst1 = dst;
  uint8_t *dst2;
  uint8_t *dst3;
  dst1[0U] = (uint8_t)0x80U;
  dst2 = dst + (uint32_t)1U;
  {
    uint32_t i;
    for
    (i
      = (uint32_t)0U;
      i
      <
        ((uint32_t)128U - ((uint32_t)9U + (uint32_t)(len % (uint64_t)(uint32_t)64U)))
        % (uint32_t)64U;
      i = i + (uint32_t)1U)
    {
      dst2[i] = (uint8_t)0U;
    }
  }
  dst3 =
    dst
    +
      (uint32_t)1U
      +
        ((uint32_t)128U - ((uint32_t)9U + (uint32_t)(len % (uint64_t)(uint32_t)64U)))
        % (uint32_t)64U;
  store64_be(dst3, len << (uint32_t)3U);
}

static void Hacl_Hash_Core_SHA2_pad_384(uint128_t len, uint8_t *dst)
{
  uint8_t *dst1 = dst;
  uint8_t *dst2;
  uint32_t len_zero;
  uint8_t *dst3;
  uint128_t len_;
  dst1[0U] = (uint8_t)0x80U;
  dst2 = dst + (uint32_t)1U;
  len_zero =
    ((uint32_t)256U - ((uint32_t)17U + (uint32_t)((uint64_t)len % (uint64_t)(uint32_t)128U)))
    % (uint32_t)128U;
  {
    uint32_t i;
    for
    (i
      = (uint32_t)0U;
      i
      <
        ((uint32_t)256U - ((uint32_t)17U + (uint32_t)((uint64_t)len % (uint64_t)(uint32_t)128U)))
        % (uint32_t)128U;
      i = i + (uint32_t)1U)
    {
      dst2[i] = (uint8_t)0U;
    }
  }
  dst3 =
    dst
    +
      (uint32_t)1U
      +
        ((uint32_t)256U - ((uint32_t)17U + (uint32_t)((uint64_t)len % (uint64_t)(uint32_t)128U)))
        % (uint32_t)128U;
  len_ = len << (uint32_t)3U;
  store128_be(dst3, len_);
}

static void Hacl_Hash_Core_SHA2_pad_512(uint128_t len, uint8_t *dst)
{
  uint8_t *dst1 = dst;
  uint8_t *dst2;
  uint32_t len_zero;
  uint8_t *dst3;
  uint128_t len_;
  dst1[0U] = (uint8_t)0x80U;
  dst2 = dst + (uint32_t)1U;
  len_zero =
    ((uint32_t)256U - ((uint32_t)17U + (uint32_t)((uint64_t)len % (uint64_t)(uint32_t)128U)))
    % (uint32_t)128U;
  {
    uint32_t i;
    for
    (i
      = (uint32_t)0U;
      i
      <
        ((uint32_t)256U - ((uint32_t)17U + (uint32_t)((uint64_t)len % (uint64_t)(uint32_t)128U)))
        % (uint32_t)128U;
      i = i + (uint32_t)1U)
    {
      dst2[i] = (uint8_t)0U;
    }
  }
  dst3 =
    dst
    +
      (uint32_t)1U
      +
        ((uint32_t)256U - ((uint32_t)17U + (uint32_t)((uint64_t)len % (uint64_t)(uint32_t)128U)))
        % (uint32_t)128U;
  len_ = len << (uint32_t)3U;
  store128_be(dst3, len_);
}

static void Hacl_Hash_Core_SHA2_finish_224(uint32_t *s, uint8_t *dst)
{
  uint32_t *uu____0 = s;
  uint32_t i;
  for (i = (uint32_t)0U; i < (uint32_t)7U; i = i + (uint32_t)1U)
  {
    store32_be(dst + i * (uint32_t)4U, uu____0[i]);
  }
}

static void Hacl_Hash_Core_SHA2_finish_256(uint32_t *s, uint8_t *dst)
{
  uint32_t *uu____0 = s;
  uint32_t i;
  for (i = (uint32_t)0U; i < (uint32_t)8U; i = i + (uint32_t)1U)
  {
    store32_be(dst + i * (uint32_t)4U, uu____0[i]);
  }
}

static void Hacl_Hash_Core_SHA2_finish_384(uint64_t *s, uint8_t *dst)
{
  uint64_t *uu____0 = s;
  uint32_t i;
  for (i = (uint32_t)0U; i < (uint32_t)6U; i = i + (uint32_t)1U)
  {
    store64_be(dst + i * (uint32_t)8U, uu____0[i]);
  }
}

static void Hacl_Hash_Core_SHA2_finish_512(uint64_t *s, uint8_t *dst)
{
  uint64_t *uu____0 = s;
  uint32_t i;
  for (i = (uint32_t)0U; i < (uint32_t)8U; i = i + (uint32_t)1U)
  {
    store64_be(dst + i * (uint32_t)8U, uu____0[i]);
  }
}

void Hacl_Hash_SHA2_update_multi_224(uint32_t *s, uint8_t *blocks, uint32_t n_blocks)
{
  uint32_t i;
  for (i = (uint32_t)0U; i < n_blocks; i = i + (uint32_t)1U)
  {
    uint32_t sz = (uint32_t)64U;
    uint8_t *block = blocks + sz * i;
    Hacl_Hash_Core_SHA2_update_224(s, block);
  }
}

void Hacl_Hash_SHA2_update_multi_256(uint32_t *s, uint8_t *blocks, uint32_t n_blocks)
{
  uint32_t i;
  for (i = (uint32_t)0U; i < n_blocks; i = i + (uint32_t)1U)
  {
    uint32_t sz = (uint32_t)64U;
    uint8_t *block = blocks + sz * i;
    Hacl_Hash_Core_SHA2_update_256(s, block);
  }
}

void Hacl_Hash_SHA2_update_multi_384(uint64_t *s, uint8_t *blocks, uint32_t n_blocks)
{
  uint32_t i;
  for (i = (uint32_t)0U; i < n_blocks; i = i + (uint32_t)1U)
  {
    uint32_t sz = (uint32_t)128U;
    uint8_t *block = blocks + sz * i;
    Hacl_Hash_Core_SHA2_update_384(s, block);
  }
}

void Hacl_Hash_SHA2_update_multi_512(uint64_t *s, uint8_t *blocks, uint32_t n_blocks)
{
  uint32_t i;
  for (i = (uint32_t)0U; i < n_blocks; i = i + (uint32_t)1U)
  {
    uint32_t sz = (uint32_t)128U;
    uint8_t *block = blocks + sz * i;
    Hacl_Hash_Core_SHA2_update_512(s, block);
  }
}

void
Hacl_Hash_SHA2_update_last_224(
  uint32_t *s,
  uint64_t prev_len,
  uint8_t *input,
  uint32_t input_len
)
{
  uint32_t blocks_n = input_len / (uint32_t)64U;
  uint32_t blocks_len = blocks_n * (uint32_t)64U;
  uint8_t *blocks = input;
  uint32_t rest_len = input_len - blocks_len;
  uint8_t *rest = input + blocks_len;
  uint64_t total_input_len;
  uint32_t pad_len1;
  uint32_t tmp_len;
  Hacl_Hash_SHA2_update_multi_224(s, blocks, blocks_n);
  total_input_len = prev_len + (uint64_t)input_len;
  pad_len1 =
    (uint32_t)1U
    +
      ((uint32_t)128U - ((uint32_t)9U + (uint32_t)(total_input_len % (uint64_t)(uint32_t)64U)))
      % (uint32_t)64U
    + (uint32_t)8U;
  tmp_len = rest_len + pad_len1;
  {
    uint8_t tmp_twoblocks[128U] = { 0U };
    uint8_t *tmp = tmp_twoblocks;
    uint8_t *tmp_rest = tmp;
    uint8_t *tmp_pad = tmp + rest_len;
    memcpy(tmp_rest, rest, rest_len * sizeof rest[0U]);
    Hacl_Hash_Core_SHA2_pad_224(total_input_len, tmp_pad);
    Hacl_Hash_SHA2_update_multi_224(s, tmp, tmp_len / (uint32_t)64U);
  }
}

void
Hacl_Hash_SHA2_update_last_256(
  uint32_t *s,
  uint64_t prev_len,
  uint8_t *input,
  uint32_t input_len
)
{
  uint32_t blocks_n = input_len / (uint32_t)64U;
  uint32_t blocks_len = blocks_n * (uint32_t)64U;
  uint8_t *blocks = input;
  uint32_t rest_len = input_len - blocks_len;
  uint8_t *rest = input + blocks_len;
  uint64_t total_input_len;
  uint32_t pad_len1;
  uint32_t tmp_len;
  Hacl_Hash_SHA2_update_multi_256(s, blocks, blocks_n);
  total_input_len = prev_len + (uint64_t)input_len;
  pad_len1 =
    (uint32_t)1U
    +
      ((uint32_t)128U - ((uint32_t)9U + (uint32_t)(total_input_len % (uint64_t)(uint32_t)64U)))
      % (uint32_t)64U
    + (uint32_t)8U;
  tmp_len = rest_len + pad_len1;
  {
    uint8_t tmp_twoblocks[128U] = { 0U };
    uint8_t *tmp = tmp_twoblocks;
    uint8_t *tmp_rest = tmp;
    uint8_t *tmp_pad = tmp + rest_len;
    memcpy(tmp_rest, rest, rest_len * sizeof rest[0U]);
    Hacl_Hash_Core_SHA2_pad_256(total_input_len, tmp_pad);
    Hacl_Hash_SHA2_update_multi_256(s, tmp, tmp_len / (uint32_t)64U);
  }
}

void
Hacl_Hash_SHA2_update_last_384(
  uint64_t *s,
  uint128_t prev_len,
  uint8_t *input,
  uint32_t input_len
)
{
  uint32_t blocks_n = input_len / (uint32_t)128U;
  uint32_t blocks_len = blocks_n * (uint32_t)128U;
  uint8_t *blocks = input;
  uint32_t rest_len = input_len - blocks_len;
  uint8_t *rest = input + blocks_len;
  uint128_t total_input_len;
  uint32_t pad_len1;
  uint32_t tmp_len;
  Hacl_Hash_SHA2_update_multi_384(s, blocks, blocks_n);
  total_input_len = prev_len + (uint128_t)(uint64_t)input_len;
  pad_len1 =
    (uint32_t)1U
    +
      ((uint32_t)256U
      - ((uint32_t)17U + (uint32_t)((uint64_t)total_input_len % (uint64_t)(uint32_t)128U)))
      % (uint32_t)128U
    + (uint32_t)16U;
  tmp_len = rest_len + pad_len1;
  {
    uint8_t tmp_twoblocks[256U] = { 0U };
    uint8_t *tmp = tmp_twoblocks;
    uint8_t *tmp_rest = tmp;
    uint8_t *tmp_pad = tmp + rest_len;
    memcpy(tmp_rest, rest, rest_len * sizeof rest[0U]);
    Hacl_Hash_Core_SHA2_pad_384(total_input_len, tmp_pad);
    Hacl_Hash_SHA2_update_multi_384(s, tmp, tmp_len / (uint32_t)128U);
  }
}

void
Hacl_Hash_SHA2_update_last_512(
  uint64_t *s,
  uint128_t prev_len,
  uint8_t *input,
  uint32_t input_len
)
{
  uint32_t blocks_n = input_len / (uint32_t)128U;
  uint32_t blocks_len = blocks_n * (uint32_t)128U;
  uint8_t *blocks = input;
  uint32_t rest_len = input_len - blocks_len;
  uint8_t *rest = input + blocks_len;
  uint128_t total_input_len;
  uint32_t pad_len1;
  uint32_t tmp_len;
  Hacl_Hash_SHA2_update_multi_512(s, blocks, blocks_n);
  total_input_len = prev_len + (uint128_t)(uint64_t)input_len;
  pad_len1 =
    (uint32_t)1U
    +
      ((uint32_t)256U
      - ((uint32_t)17U + (uint32_t)((uint64_t)total_input_len % (uint64_t)(uint32_t)128U)))
      % (uint32_t)128U
    + (uint32_t)16U;
  tmp_len = rest_len + pad_len1;
  {
    uint8_t tmp_twoblocks[256U] = { 0U };
    uint8_t *tmp = tmp_twoblocks;
    uint8_t *tmp_rest = tmp;
    uint8_t *tmp_pad = tmp + rest_len;
    memcpy(tmp_rest, rest, rest_len * sizeof rest[0U]);
    Hacl_Hash_Core_SHA2_pad_512(total_input_len, tmp_pad);
    Hacl_Hash_SHA2_update_multi_512(s, tmp, tmp_len / (uint32_t)128U);
  }
}

void Hacl_Hash_SHA2_hash_224(uint8_t *input, uint32_t input_len, uint8_t *dst)
{
  uint32_t
  s[8U] =
    {
      (uint32_t)0xc1059ed8U, (uint32_t)0x367cd507U, (uint32_t)0x3070dd17U, (uint32_t)0xf70e5939U,
      (uint32_t)0xffc00b31U, (uint32_t)0x68581511U, (uint32_t)0x64f98fa7U, (uint32_t)0xbefa4fa4U
    };
  uint32_t blocks_n = input_len / (uint32_t)64U;
  uint32_t blocks_len = blocks_n * (uint32_t)64U;
  uint8_t *blocks = input;
  uint32_t rest_len = input_len - blocks_len;
  uint8_t *rest = input + blocks_len;
  Hacl_Hash_SHA2_update_multi_224(s, blocks, blocks_n);
  Hacl_Hash_SHA2_update_last_224(s, (uint64_t)blocks_len, rest, rest_len);
  Hacl_Hash_Core_SHA2_finish_224(s, dst);
}

void Hacl_Hash_SHA2_hash_256(uint8_t *input, uint32_t input_len, uint8_t *dst)
{
  uint32_t
  s[8U] =
    {
      (uint32_t)0x6a09e667U, (uint32_t)0xbb67ae85U, (uint32_t)0x3c6ef372U, (uint32_t)0xa54ff53aU,
      (uint32_t)0x510e527fU, (uint32_t)0x9b05688cU, (uint32_t)0x1f83d9abU, (uint32_t)0x5be0cd19U
    };
  uint32_t blocks_n = input_len / (uint32_t)64U;
  uint32_t blocks_len = blocks_n * (uint32_t)64U;
  uint8_t *blocks = input;
  uint32_t rest_len = input_len - blocks_len;
  uint8_t *rest = input + blocks_len;
  Hacl_Hash_SHA2_update_multi_256(s, blocks, blocks_n);
  Hacl_Hash_SHA2_update_last_256(s, (uint64_t)blocks_len, rest, rest_len);
  Hacl_Hash_Core_SHA2_finish_256(s, dst);
}

void Hacl_Hash_SHA2_hash_384(uint8_t *input, uint32_t input_len, uint8_t *dst)
{
  uint64_t
  s[8U] =
    {
      (uint64_t)0xcbbb9d5dc1059ed8U, (uint64_t)0x629a292a367cd507U, (uint64_t)0x9159015a3070dd17U,
      (uint64_t)0x152fecd8f70e5939U, (uint64_t)0x67332667ffc00b31U, (uint64_t)0x8eb44a8768581511U,
      (uint64_t)0xdb0c2e0d64f98fa7U, (uint64_t)0x47b5481dbefa4fa4U
    };
  uint32_t blocks_n = input_len / (uint32_t)128U;
  uint32_t blocks_len = blocks_n * (uint32_t)128U;
  uint8_t *blocks = input;
  uint32_t rest_len = input_len - blocks_len;
  uint8_t *rest = input + blocks_len;
  Hacl_Hash_SHA2_update_multi_384(s, blocks, blocks_n);
  Hacl_Hash_SHA2_update_last_384(s, (uint128_t)(uint64_t)blocks_len, rest, rest_len);
  Hacl_Hash_Core_SHA2_finish_384(s, dst);
}

void Hacl_Hash_SHA2_hash_512(uint8_t *input, uint32_t input_len, uint8_t *dst)
{
  uint64_t
  s[8U] =
    {
      (uint64_t)0x6a09e667f3bcc908U, (uint64_t)0xbb67ae8584caa73bU, (uint64_t)0x3c6ef372fe94f82bU,
      (uint64_t)0xa54ff53a5f1d36f1U, (uint64_t)0x510e527fade682d1U, (uint64_t)0x9b05688c2b3e6c1fU,
      (uint64_t)0x1f83d9abfb41bd6bU, (uint64_t)0x5be0cd19137e2179U
    };
  uint32_t blocks_n = input_len / (uint32_t)128U;
  uint32_t blocks_len = blocks_n * (uint32_t)128U;
  uint8_t *blocks = input;
  uint32_t rest_len = input_len - blocks_len;
  uint8_t *rest = input + blocks_len;
  Hacl_Hash_SHA2_update_multi_512(s, blocks, blocks_n);
  Hacl_Hash_SHA2_update_last_512(s, (uint128_t)(uint64_t)blocks_len, rest, rest_len);
  Hacl_Hash_Core_SHA2_finish_512(s, dst);
}

