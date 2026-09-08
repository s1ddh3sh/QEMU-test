# Fault Detection Report

Generated 2026-09-08 05:52 UTC.

Detection pattern: `pos [0-9]+: [0-9]+/[0-9]+ pairs disagree` — presence means at least one
output position showed `X/Y pairs disagree` with `X > 0` in the
corresponding paired test's result file.

## tests_mayo

### add_f

| Fault | Correction test | Ineffective test |
|---|---|---|
| `add_f_line0_opA` | ✅ | ✅ |
| `add_f_line0_opB` | — | — |
| `add_f_line0_undef` | ✅ | ✅ |
| `add_f_line0_zero` | ✅ | ✅ |

### add_f.25

_No result files found._

### aes128_ctr

_No result files found._

### AES_128_CTR

_No result files found._

### aes_ctr

_No result files found._

### aes_ctr4x

_No result files found._

### aes_ecb4x

_No result files found._

### br_dec32le

_No result files found._

### br_enc32le

_No result files found._

### br_range_dec32le

_No result files found._

### br_range_enc32le

_No result files found._

### compute_A

| Fault | Correction test | Ineffective test |
|---|---|---|
| `compute_A_fnSkip_decode_line276` | ✅ | ✅ |
| `compute_A_fnSkip_mayo_memset_line147` | — | — |
| `compute_A_fnSkip_mayo_memset_line2` | — | — |
| `compute_A_fnSkip_transpose_16x16_nibbles_line144` | ✅ | ✅ |
| `compute_A_line102_opA` | ✅ | ✅ |
| `compute_A_line102_opB` | — | — |
| `compute_A_line102_opC` | — | — |
| `compute_A_line102_undef` | ✅ | ✅ |
| `compute_A_line102_zero` | ✅ | ✅ |
| `compute_A_line112_opA` | ✅ | ✅ |
| `compute_A_line112_opB` | — | — |
| `compute_A_line112_opC` | — | — |
| `compute_A_line112_undef` | — | — |
| `compute_A_line112_zero` | — | — |
| `compute_A_line121_opA` | — | — |
| `compute_A_line121_opB` | — | — |
| `compute_A_line121_opC` | — | — |
| `compute_A_line121_undef` | — | — |
| `compute_A_line121_zero` | — | — |
| `compute_A_line12_opA` | — | — |
| `compute_A_line12_opB` | — | — |
| `compute_A_line12_opC` | — | — |
| `compute_A_line12_undef` | — | — |
| `compute_A_line12_zero` | — | — |
| `compute_A_line195_opA` | — | — |
| `compute_A_line195_opB` | — | — |
| `compute_A_line195_opC` | — | — |
| `compute_A_line195_undef` | — | — |
| `compute_A_line195_zero` | — | — |
| `compute_A_line196_opA` | — | — |
| `compute_A_line196_opB` | — | — |
| `compute_A_line196_opC` | — | — |
| `compute_A_line196_undef` | — | — |
| `compute_A_line196_zero` | — | — |
| `compute_A_line197_opA` | — | — |
| `compute_A_line197_opB` | — | — |
| `compute_A_line197_opC` | — | — |
| `compute_A_line197_undef` | — | — |
| `compute_A_line197_zero` | — | — |
| `compute_A_line198_opA` | — | — |
| `compute_A_line198_opB` | — | — |
| `compute_A_line198_opC` | — | — |
| `compute_A_line198_undef` | — | — |
| `compute_A_line198_zero` | — | — |
| `compute_A_line199_opA` | — | — |
| `compute_A_line199_opB` | — | — |
| `compute_A_line199_opC` | — | — |
| `compute_A_line199_undef` | — | — |
| `compute_A_line199_zero` | — | — |
| `compute_A_line202_opA` | — | — |
| `compute_A_line202_opB` | — | — |
| `compute_A_line202_opC` | — | — |
| `compute_A_line202_undef` | — | — |
| `compute_A_line202_zero` | — | — |
| `compute_A_line203_opA` | — | — |
| `compute_A_line203_opB` | — | — |
| `compute_A_line203_opC` | — | — |
| `compute_A_line203_undef` | — | — |
| `compute_A_line203_zero` | — | — |
| `compute_A_line212_opA` | — | — |
| `compute_A_line212_opB` | — | — |
| `compute_A_line212_opC` | — | — |
| `compute_A_line212_undef` | — | — |
| `compute_A_line212_zero` | — | — |
| `compute_A_line218_opA` | — | — |
| `compute_A_line218_opB` | — | — |
| `compute_A_line218_opC` | — | — |
| `compute_A_line218_undef` | — | — |
| `compute_A_line218_zero` | — | — |
| `compute_A_line219_opA` | — | — |
| `compute_A_line219_opB` | — | — |
| `compute_A_line219_opC` | — | — |
| `compute_A_line219_undef` | — | — |
| `compute_A_line219_zero` | — | — |
| `compute_A_line225_opA` | — | — |
| `compute_A_line225_opB` | — | — |
| `compute_A_line225_opC` | — | — |
| `compute_A_line225_undef` | — | — |
| `compute_A_line225_zero` | — | — |
| `compute_A_line226_opA` | — | — |
| `compute_A_line226_opB` | — | — |
| `compute_A_line226_opC` | — | — |
| `compute_A_line226_undef` | — | — |
| `compute_A_line226_zero` | — | — |
| `compute_A_line232_opA` | — | — |
| `compute_A_line232_opB` | — | — |
| `compute_A_line232_opC` | — | — |
| `compute_A_line232_undef` | — | — |
| `compute_A_line232_zero` | — | — |
| `compute_A_line233_opA` | — | — |
| `compute_A_line233_opB` | — | — |
| `compute_A_line233_opC` | — | — |
| `compute_A_line233_undef` | — | — |
| `compute_A_line233_zero` | — | — |
| `compute_A_line245_opA` | — | — |
| `compute_A_line245_opB` | ✅ | ✅ |
| `compute_A_line245_opC` | — | — |
| `compute_A_line245_undef` | — | — |
| `compute_A_line245_zero` | ✅ | ✅ |
| `compute_A_line43_opA` | ✅ | ✅ |
| `compute_A_line43_opB` | ✅ | ✅ |
| `compute_A_line43_opC` | — | — |
| `compute_A_line43_undef` | ✅ | ✅ |
| `compute_A_line43_zero` | ✅ | ✅ |
| `compute_A_line51_opA` | ✅ | ✅ |
| `compute_A_line51_opB` | — | — |
| `compute_A_line51_opC` | — | — |
| `compute_A_line51_undef` | ✅ | ✅ |
| `compute_A_line51_zero` | ✅ | ✅ |
| `compute_A_line61_opA` | ✅ | ✅ |
| `compute_A_line61_opB` | — | — |
| `compute_A_line61_opC` | — | — |
| `compute_A_line61_undef` | — | — |
| `compute_A_line61_zero` | — | — |
| `compute_A_line70_opA` | — | — |
| `compute_A_line70_opB` | — | — |
| `compute_A_line70_opC` | — | — |
| `compute_A_line70_undef` | — | — |
| `compute_A_line70_zero` | — | — |
| `compute_A_line94_opA` | ✅ | ✅ |
| `compute_A_line94_opB` | ✅ | ✅ |
| `compute_A_line94_opC` | — | — |
| `compute_A_line94_undef` | ✅ | ✅ |
| `compute_A_line94_zero` | ✅ | ✅ |

### compute_M_and_VPV

_No result files found._

### compute_P3

| Fault | Correction test | Ineffective test |
|---|---|---|
| `compute_P3_fnSkip_mul_add_mat_trans_x_m_mat_line1` | — | — |
| `compute_P3_fnSkip_P1_times_O_line0` | — | — |

### compute_rhs

_No result files found._

### decode

| Fault | Correction test | Ineffective test |
|---|---|---|
| `decode_line10_mem` | ✅ | ✅ |
| `decode_line14_mem` | — | — |
| `decode_line26_mem` | — | — |

### EF

| Fault | Correction test | Ineffective test |
|---|---|---|
| `EF_fnSkip_ef_pack_m_vec_line22` | — | — |
| `EF_fnSkip_ef_unpack_m_vec_line141` | — | — |
| `EF_fnSkip_inverse_f_line87` | — | — |
| `EF_fnSkip_mayo_memset_line4` | — | — |
| `EF_fnSkip_m_extract_element_line124` | — | — |
| `EF_fnSkip_m_extract_element_line79` | — | — |
| `EF_fnSkip_vec_mul_add_u64_line128` | — | — |
| `EF_fnSkip_vec_mul_add_u64_line88` | — | — |
| `EF_line104_mem` | — | — |
| `EF_line105_opA` | — | — |
| `EF_line105_opB` | — | — |
| `EF_line105_undef` | — | — |
| `EF_line105_zero` | — | — |
| `EF_line107_mem` | — | — |
| `EF_line108_opA` | — | — |
| `EF_line108_opB` | — | — |
| `EF_line108_undef` | — | — |
| `EF_line108_zero` | — | — |
| `EF_line109_opA` | — | — |
| `EF_line109_opB` | — | — |
| `EF_line109_undef` | — | — |
| `EF_line109_zero` | — | — |
| `EF_line113_mem` | — | — |
| `EF_line147_mem` | — | — |
| `EF_line151_mem` | — | — |
| `EF_line44_mem` | — | — |
| `EF_line46_mem` | — | — |
| `EF_line71_mem` | — | — |
| `EF_line72_opA` | — | — |
| `EF_line72_opB` | — | — |
| `EF_line72_undef` | — | — |
| `EF_line72_zero` | — | — |
| `EF_line74_mem` | — | — |
| `EF_line75_opA` | — | — |
| `EF_line75_opB` | — | — |
| `EF_line75_undef` | — | — |
| `EF_line75_zero` | — | — |
| `EF_line76_mem` | — | — |

### ef_pack_m_vec

_No result files found._

### ef_unpack_m_vec

_No result files found._

### encode

_No result files found._

### eval_public_map

_No result files found._

### example_mayo

_No result files found._

### expand_P1_P2

_No result files found._

### inverse_f

| Fault | Correction test | Ineffective test |
|---|---|---|
| `inverse_f_fnSkip_mul_f.23_line0` | ✅ | ✅ |
| `inverse_f_fnSkip_mul_f.23_line1` | ✅ | ✅ |
| `inverse_f_fnSkip_mul_f.23_line2` | ✅ | ✅ |
| `inverse_f_fnSkip_mul_f.23_line3` | ✅ | ✅ |
| `inverse_f_fnSkip_mul_f.23_line4` | ✅ | ✅ |

### keccak_squeezeblocks

_No result files found._

### lincomb

| Fault | Correction test | Ineffective test |
|---|---|---|
| `lincomb_fnSkip_add_f_line10` | — | — |
| `lincomb_fnSkip_mul_f_line9` | ✅ | ✅ |
| `lincomb_line7_mem` | ✅ | ✅ |
| `lincomb_line8_mem` | ✅ | ✅ |

### lincomb.24

_No result files found._

### mat_add

| Fault | Correction test | Ineffective test |
|---|---|---|
| `mat_add_fnSkip_add_f_line8` | ✅ | ✅ |
| `mat_add_line10_mem` | ✅ | ✅ |
| `mat_add_line5_mem` | — | — |
| `mat_add_line7_mem` | ✅ | ✅ |

### mat_mul

| Fault | Correction test | Ineffective test |
|---|---|---|
| `mat_mul_fnSkip_lincomb_line10` | ✅ | ✅ |
| `mat_mul_line11_mem` | ✅ | ✅ |

### mat_mul.21

_No result files found._

### mayo_generic_m_calculate_PS

_No result files found._

### mayo_generic_m_calculate_SPS

_No result files found._

### mayo_memcpy

_No result files found._

### mayo_memset

_No result files found._

### m_calculate_PS_SPS

_No result files found._

### m_extract_element

_No result files found._

### mul_add_mat_trans_x_m_mat

| Fault | Correction test | Ineffective test |
|---|---|---|
| `mul_add_mat_trans_x_m_mat_fnSkip_m_vec_mul_add_line24` | ✅ | ✅ |
| `mul_add_mat_trans_x_m_mat_line19_mem` | ✅ | ✅ |

### mul_add_mat_x_m_mat

| Fault | Correction test | Ineffective test |
|---|---|---|
| `mul_add_mat_x_m_mat_fnSkip_m_vec_mul_add_line24` | ✅ | ✅ |
| `mul_add_mat_x_m_mat_line19_mem` | ✅ | ✅ |

### mul_add_m_upper_triangular_mat_x_mat

| Fault | Correction test | Ineffective test |
|---|---|---|
| `mul_add_m_upper_triangular_mat_x_mat_fnSkip_m_vec_mul_add_line26` | ✅ | ✅ |
| `mul_add_m_upper_triangular_mat_x_mat_line21_mem` | ✅ | ✅ |

### mul_add_m_upper_triangular_mat_x_mat_trans

| Fault | Correction test | Ineffective test |
|---|---|---|
| `mul_add_m_upper_triangular_mat_x_mat_trans_fnSkip_m_vec_mul_add_line26` | ✅ | ✅ |
| `mul_add_m_upper_triangular_mat_x_mat_trans_line21_mem` | ✅ | ✅ |

### mul_f

| Fault | Correction test | Ineffective test |
|---|---|---|
| `mul_f_line10_opA` | ✅ | ✅ |
| `mul_f_line10_opB` | ✅ | ✅ |
| `mul_f_line10_undef` | ✅ | ✅ |
| `mul_f_line10_zero` | ✅ | ✅ |
| `mul_f_line11_opA` | ✅ | ✅ |
| `mul_f_line11_opB` | ✅ | ✅ |
| `mul_f_line11_undef` | ✅ | ✅ |
| `mul_f_line11_zero` | ✅ | ✅ |
| `mul_f_line12_opA` | ✅ | ✅ |
| `mul_f_line12_opB` | ✅ | ✅ |
| `mul_f_line12_undef` | ✅ | ✅ |
| `mul_f_line12_zero` | ✅ | ✅ |
| `mul_f_line13_opA` | ✅ | ✅ |
| `mul_f_line13_opB` | ✅ | ✅ |
| `mul_f_line13_undef` | ✅ | ✅ |
| `mul_f_line13_zero` | ✅ | ✅ |
| `mul_f_line14_opA` | ✅ | ✅ |
| `mul_f_line14_opB` | ✅ | ✅ |
| `mul_f_line14_undef` | ✅ | ✅ |
| `mul_f_line14_zero` | ✅ | ✅ |
| `mul_f_line15_opA` | ✅ | ✅ |
| `mul_f_line15_opB` | ✅ | ✅ |
| `mul_f_line15_undef` | ✅ | ✅ |
| `mul_f_line15_zero` | ✅ | ✅ |
| `mul_f_line16_opA` | ✅ | ✅ |
| `mul_f_line16_opB` | ✅ | ✅ |
| `mul_f_line16_undef` | ✅ | ✅ |
| `mul_f_line16_zero` | ✅ | ✅ |
| `mul_f_line17_opA` | ✅ | ✅ |
| `mul_f_line17_opB` | ✅ | ✅ |
| `mul_f_line17_undef` | ✅ | ✅ |
| `mul_f_line17_zero` | ✅ | ✅ |
| `mul_f_line18_opA` | ✅ | ✅ |
| `mul_f_line18_opB` | ✅ | ✅ |
| `mul_f_line18_undef` | ✅ | ✅ |
| `mul_f_line18_zero` | ✅ | ✅ |
| `mul_f_line1_opA` | — | — |
| `mul_f_line1_opB` | ✅ | ✅ |
| `mul_f_line1_undef` | ✅ | ✅ |
| `mul_f_line1_zero` | ✅ | ✅ |
| `mul_f_line3_opA` | ✅ | ✅ |
| `mul_f_line3_opB` | ✅ | ✅ |
| `mul_f_line3_undef` | ✅ | ✅ |
| `mul_f_line3_zero` | ✅ | ✅ |
| `mul_f_line4_opA` | ✅ | ✅ |
| `mul_f_line4_opB` | ✅ | ✅ |
| `mul_f_line4_undef` | ✅ | ✅ |
| `mul_f_line4_zero` | ✅ | ✅ |
| `mul_f_line6_opA` | ✅ | ✅ |
| `mul_f_line6_opB` | ✅ | ✅ |
| `mul_f_line6_undef` | ✅ | ✅ |
| `mul_f_line6_zero` | ✅ | ✅ |
| `mul_f_line7_opA` | ✅ | ✅ |
| `mul_f_line7_opB` | ✅ | ✅ |
| `mul_f_line7_undef` | ✅ | ✅ |
| `mul_f_line7_zero` | ✅ | ✅ |
| `mul_f_line8_opA` | ✅ | ✅ |
| `mul_f_line8_opB` | ✅ | ✅ |
| `mul_f_line8_undef` | ✅ | ✅ |
| `mul_f_line8_zero` | ✅ | ✅ |
| `mul_f_line9_opA` | ✅ | ✅ |
| `mul_f_line9_opB` | ✅ | ✅ |
| `mul_f_line9_undef` | ✅ | ✅ |
| `mul_f_line9_zero` | ✅ | ✅ |

### mul_f.23

_No result files found._

### mul_fx8

_No result files found._

### m_vec_add

| Fault | Correction test | Ineffective test |
|---|---|---|
| `m_vec_add_line5_mem` | ✅ | ✅ |
| `m_vec_add_line7_mem` | — | — |
| `m_vec_add_line8_opA` | ✅ | ✅ |
| `m_vec_add_line8_opB` | — | — |
| `m_vec_add_line8_undef` | ✅ | ✅ |
| `m_vec_add_line8_zero` | ✅ | ✅ |
| `m_vec_add_line9_mem` | — | — |

### m_vec_add.18

_No result files found._

### m_vec_copy

_No result files found._

### m_vec_copy.17

_No result files found._

### m_vec_mul_add

| Fault | Correction test | Ineffective test |
|---|---|---|
| `m_vec_mul_add_fnSkip_mul_table_line0` | ✅ | ✅ |

### m_vec_mul_add_x

_No result files found._

### m_vec_mul_add_x_inv

_No result files found._

### m_vec_multiply_bins

_No result files found._

### P1P1t_times_O

| Fault | Correction test | Ineffective test |
|---|---|---|
| `P1P1t_times_O_fnSkip_m_vec_mul_add_line28` | — | — |
| `P1P1t_times_O_fnSkip_m_vec_mul_add_line39` | ✅ | ✅ |

### P1_times_O

| Fault | Correction test | Ineffective test |
|---|---|---|
| `P1_times_O_fnSkip_mul_add_m_upper_triangular_mat_x_mat_line0` | ✅ | ✅ |

### P1_times_Vt

| Fault | Correction test | Ineffective test |
|---|---|---|
| `P1_times_Vt_fnSkip_mul_add_m_upper_triangular_mat_x_mat_trans_line0` | ✅ | ✅ |

### pack_m_vecs

_No result files found._

### pqmayo_MAYO_1_ref_mayo_expand_pk

_No result files found._

### pqmayo_MAYO_1_ref_mayo_expand_sk

_No result files found._

### pqmayo_MAYO_1_ref_mayo_keypair

| Fault | Correction test | Ineffective test |
|---|---|---|
| `pqmayo_MAYO_1_ref_mayo_keypair_fnSkip_pqmayo_MAYO_1_ref_mayo_keypair_compact_line0` | — | — |

### pqmayo_MAYO_1_ref_mayo_keypair_compact

| Fault | Correction test | Ineffective test |
|---|---|---|
| `pqmayo_MAYO_1_ref_mayo_keypair_compact_fnSkip_compute_P3_line12` | — | — |
| `pqmayo_MAYO_1_ref_mayo_keypair_compact_fnSkip_decode_line10` | — | — |
| `pqmayo_MAYO_1_ref_mayo_keypair_compact_fnSkip_expand_P1_P2_line11` | — | — |
| `pqmayo_MAYO_1_ref_mayo_keypair_compact_fnSkip_mayo_memset_line5` | — | — |
| `pqmayo_MAYO_1_ref_mayo_keypair_compact_fnSkip_memcpy_line13` | — | — |
| `pqmayo_MAYO_1_ref_mayo_keypair_compact_fnSkip_pack_m_vecs_line16` | — | — |
| `pqmayo_MAYO_1_ref_mayo_keypair_compact_fnSkip_pqmayo_MAYO_1_ref_m_upper_line14` | — | — |

### pqmayo_MAYO_1_ref_mayo_open

_No result files found._

### pqmayo_MAYO_1_ref_mayo_sign

_No result files found._

### pqmayo_MAYO_1_ref_mayo_sign_signature

_No result files found._

### pqmayo_MAYO_1_ref_mayo_verify

_No result files found._

### pqmayo_MAYO_1_ref_m_upper

_No result files found._

### pqmayo_MAYO_1_ref_sample_solution

_No result files found._

### randombytes

_No result files found._

### randombytes_nist

_No result files found._

### shake256

| Fault | Correction test | Ineffective test |
|---|---|---|
| `shake256_fnSkip_shake256_squeezeblocks_line11` | ✅ | ✅ |
| `shake256_fnSkip_shake256_squeezeblocks_line4` | — | — |
| `shake256_line17_mem` | ✅ | ✅ |
| `shake256_line19_mem` | ✅ | ✅ |

### shake256_squeezeblocks

_No result files found._

### store64

_No result files found._

### sub_f

| Fault | Correction test | Ineffective test |
|---|---|---|
| `sub_f_line0_opA` | ✅ | ✅ |
| `sub_f_line0_opB` | — | — |
| `sub_f_line0_undef` | ✅ | ✅ |
| `sub_f_line0_zero` | ✅ | ✅ |

### transpose_16x16_nibbles

_No result files found._

### unpack_m_vecs

_No result files found._

### vec_mul_add_u64

_No result files found._

## tests_kyber

### cbd2

| Fault | Correction test | Ineffective test |
|---|---|---|
| `cbd2_line27_mem` | ✅ | ✅ |

### keccak_absorb

| Fault | Correction test | Ineffective test |
|---|---|---|
| `keccak_absorb_line17_mem` | ✅ | ✅ |
| `keccak_absorb_line41_mem` | — | — |

### keccak_absorb_once

| Fault | Correction test | Ineffective test |
|---|---|---|
| `keccak_absorb_once_fnSkip_load64_line23` | — | — |
| `keccak_absorb_once_line38_mem` | ✅ | ✅ |

### keccak_squeeze

| Fault | Correction test | Ineffective test |
|---|---|---|
| `keccak_squeeze_line27_mem` | ✅ | ✅ |

### load64

_No result files found._

### pack_ciphertext

| Fault | Correction test | Ineffective test |
|---|---|---|
| `pack_ciphertext_fnSkip_pqcrystals_kyber768_ref_poly_compress_line2` | — | — |
| `pack_ciphertext_fnSkip_pqcrystals_kyber768_ref_polyvec_compress_line0` | ✅ | ✅ |

### pack_pk

_No result files found._

### pack_sk

_No result files found._

### pqcrystals_kyber768_ref_barrett_reduce

| Fault | Correction test | Ineffective test |
|---|---|---|
| `pqcrystals_kyber768_ref_barrett_reduce_line6_opA` | — | — |
| `pqcrystals_kyber768_ref_barrett_reduce_line6_OpA` | — | — |
| `pqcrystals_kyber768_ref_barrett_reduce_line6_opB` | — | — |
| `pqcrystals_kyber768_ref_barrett_reduce_line6_opC` | — | — |
| `pqcrystals_kyber768_ref_barrett_reduce_line6_undef` | ✅ | ✅ |
| `pqcrystals_kyber768_ref_barrett_reduce_line6_zero` | — | — |

### pqcrystals_kyber768_ref_basemul

| Fault | Correction test | Ineffective test |
|---|---|---|
| `pqcrystals_kyber768_ref_basemul_line11_mem` | — | — |
| `pqcrystals_kyber768_ref_basemul_line12_opA` | ✅ | ✅ |
| `pqcrystals_kyber768_ref_basemul_line12_opB` | — | — |
| `pqcrystals_kyber768_ref_basemul_line12_undef` | ✅ | ✅ |
| `pqcrystals_kyber768_ref_basemul_line12_zero` | ✅ | ✅ |
| `pqcrystals_kyber768_ref_basemul_line13_mem` | — | — |
| `pqcrystals_kyber768_ref_basemul_line19_mem` | ✅ | — |
| `pqcrystals_kyber768_ref_basemul_line25_mem` | ✅ | — |
| `pqcrystals_kyber768_ref_basemul_line26_opA` | ✅ | — |
| `pqcrystals_kyber768_ref_basemul_line26_opB` | ✅ | — |
| `pqcrystals_kyber768_ref_basemul_line26_undef` | ✅ | — |
| `pqcrystals_kyber768_ref_basemul_line26_zero` | ✅ | ✅ |
| `pqcrystals_kyber768_ref_basemul_line27_mem` | ✅ | — |
| `pqcrystals_kyber768_ref_basemul_line5_mem` | — | — |
| `pqcrystals_kyber768_ref_basemul_line7_mem` | ✅ | — |

### pqcrystals_kyber768_ref_cmov

_No result files found._

### pqcrystals_kyber768_ref_dec

| Fault | Correction test | Ineffective test |
|---|---|---|
| `pqcrystals_kyber768_ref_dec_fnSkip_memcpy_line7` | — | — |
| `pqcrystals_kyber768_ref_dec_fnSkip_pqcrystals_kyber768_ref_cmov_line16` | — | — |
| `pqcrystals_kyber768_ref_dec_fnSkip_pqcrystals_kyber768_ref_indcpa_dec_line4` | — | — |
| `pqcrystals_kyber768_ref_dec_fnSkip_pqcrystals_kyber768_ref_indcpa_enc_line10` | — | — |
| `pqcrystals_kyber768_ref_dec_fnSkip_pqcrystals_kyber768_ref_kyber_shake256_rkprf_line13` | — | — |
| `pqcrystals_kyber768_ref_dec_fnSkip_pqcrystals_kyber768_ref_verify_line11` | ✅ | ✅ |
| `pqcrystals_kyber768_ref_dec_fnSkip_pqcrystals_kyber_fips202_ref_sha3_512_line8` | — | — |

### pqcrystals_kyber768_ref_enc

_No result files found._

### pqcrystals_kyber768_ref_enc_derand

| Fault | Correction test | Ineffective test |
|---|---|---|
| `pqcrystals_kyber768_ref_enc_derand_fnSkip_memcpy_line2` | — | — |
| `pqcrystals_kyber768_ref_enc_derand_fnSkip_memcpy_line8` | — | — |
| `pqcrystals_kyber768_ref_enc_derand_fnSkip_pqcrystals_kyber768_ref_indcpa_enc_line7` | — | — |
| `pqcrystals_kyber768_ref_enc_derand_fnSkip_pqcrystals_kyber_fips202_ref_sha3_256_line4` | — | — |
| `pqcrystals_kyber768_ref_enc_derand_fnSkip_pqcrystals_kyber_fips202_ref_sha3_512_line5` | — | — |

### pqcrystals_kyber768_ref_gen_matrix

| Fault | Correction test | Ineffective test |
|---|---|---|
| `pqcrystals_kyber768_ref_gen_matrix_fnSkip_pqcrystals_kyber768_ref_kyber_shake128_absorb_line14` | — | — |
| `pqcrystals_kyber768_ref_gen_matrix_fnSkip_pqcrystals_kyber768_ref_kyber_shake128_absorb_line18` | — | — |

### pqcrystals_kyber768_ref_indcpa_dec

| Fault | Correction test | Ineffective test |
|---|---|---|
| `pqcrystals_kyber768_ref_indcpa_dec_fnSkip_pqcrystals_kyber768_ref_poly_invntt_tomont_line8` | ✅ | ✅ |
| `pqcrystals_kyber768_ref_indcpa_dec_fnSkip_pqcrystals_kyber768_ref_poly_reduce_line10` | — | — |
| `pqcrystals_kyber768_ref_indcpa_dec_fnSkip_pqcrystals_kyber768_ref_poly_sub_line9` | ✅ | ✅ |
| `pqcrystals_kyber768_ref_indcpa_dec_fnSkip_pqcrystals_kyber768_ref_poly_tomsg_line11` | ✅ | ✅ |
| `pqcrystals_kyber768_ref_indcpa_dec_fnSkip_pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery_line7` | ✅ | ✅ |
| `pqcrystals_kyber768_ref_indcpa_dec_fnSkip_pqcrystals_kyber768_ref_polyvec_ntt_line6` | ✅ | ✅ |
| `pqcrystals_kyber768_ref_indcpa_dec_fnSkip_unpack_ciphertext_line4` | ✅ | ✅ |
| `pqcrystals_kyber768_ref_indcpa_dec_fnSkip_unpack_sk_line5` | ✅ | ✅ |

### pqcrystals_kyber768_ref_indcpa_enc

| Fault | Correction test | Ineffective test |
|---|---|---|
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pack_ciphertext_line51` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_gen_matrix_line11` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_poly_add_line47` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_poly_add_line48` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_poly_frommsg_line10` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_poly_getnoise_eta1_line19` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_poly_getnoise_eta2_line28` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_poly_getnoise_eta2_line32` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_poly_invntt_tomont_line45` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_poly_reduce_line50` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_polyvec_add_line46` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery_line40` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery_line43` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_polyvec_invntt_tomont_line44` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_polyvec_ntt_line33` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_pqcrystals_kyber768_ref_polyvec_reduce_line49` | — | — |
| `pqcrystals_kyber768_ref_indcpa_enc_fnSkip_unpack_pk_line9` | — | — |

### pqcrystals_kyber768_ref_indcpa_keypair_derand

_No result files found._

### pqcrystals_kyber768_ref_invntt

_No result files found._

### pqcrystals_kyber768_ref_keypair

_No result files found._

### pqcrystals_kyber768_ref_keypair_derand

_No result files found._

### pqcrystals_kyber768_ref_kyber_shake128_absorb

_No result files found._

### pqcrystals_kyber768_ref_kyber_shake256_prf

_No result files found._

### pqcrystals_kyber768_ref_kyber_shake256_rkprf

_No result files found._

### pqcrystals_kyber768_ref_ntt

_No result files found._

### pqcrystals_kyber768_ref_poly_add

| Fault | Correction test | Ineffective test |
|---|---|---|
| `pqcrystals_kyber768_ref_poly_add_line10_mem` | ✅ | — |
| `pqcrystals_kyber768_ref_poly_add_line5_mem` | — | — |
| `pqcrystals_kyber768_ref_poly_add_line7_mem` | ✅ | — |
| `pqcrystals_kyber768_ref_poly_add_line8_opA` | ✅ | — |
| `pqcrystals_kyber768_ref_poly_add_line8_opB` | — | — |
| `pqcrystals_kyber768_ref_poly_add_line8_undef` | ✅ | — |
| `pqcrystals_kyber768_ref_poly_add_line8_zero` | ✅ | — |

### pqcrystals_kyber768_ref_poly_basemul_montgomery

_No result files found._

### pqcrystals_kyber768_ref_poly_cbd_eta1

_No result files found._

### pqcrystals_kyber768_ref_poly_cbd_eta2

_No result files found._

### pqcrystals_kyber768_ref_poly_compress

_No result files found._

### pqcrystals_kyber768_ref_poly_frombytes

_No result files found._

### pqcrystals_kyber768_ref_poly_frommsg

_No result files found._

### pqcrystals_kyber768_ref_poly_getnoise_eta1

_No result files found._

### pqcrystals_kyber768_ref_poly_getnoise_eta2

_No result files found._

### pqcrystals_kyber768_ref_poly_invntt_tomont

_No result files found._

### pqcrystals_kyber768_ref_poly_ntt

| Fault | Correction test | Ineffective test |
|---|---|---|
| `pqcrystals_kyber768_ref_poly_ntt_fnSkip_pqcrystals_kyber768_ref_ntt_line0` | ✅ | ✅ |
| `pqcrystals_kyber768_ref_poly_ntt_fnSkip_pqcrystals_kyber768_ref_poly_reduce_line1` | — | — |

### pqcrystals_kyber768_ref_poly_reduce

_No result files found._

### pqcrystals_kyber768_ref_poly_sub

_No result files found._

### pqcrystals_kyber768_ref_poly_tobytes

_No result files found._

### pqcrystals_kyber768_ref_poly_tomont

_No result files found._

### pqcrystals_kyber768_ref_poly_tomsg

| Fault | Correction test | Ineffective test |
|---|---|---|
| `pqcrystals_kyber768_ref_poly_tomsg_line13_mem` | — | — |

### pqcrystals_kyber768_ref_polyvec_add

_No result files found._

### pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery

_No result files found._

### pqcrystals_kyber768_ref_polyvec_compress

_No result files found._

### pqcrystals_kyber768_ref_polyvec_decompress

_No result files found._

### pqcrystals_kyber768_ref_polyvec_frombytes

_No result files found._

### pqcrystals_kyber768_ref_polyvec_invntt_tomont

_No result files found._

### pqcrystals_kyber768_ref_polyvec_ntt

_No result files found._

### pqcrystals_kyber768_ref_polyvec_reduce

_No result files found._

### pqcrystals_kyber768_ref_polyvec_tobytes

_No result files found._

### pqcrystals_kyber768_ref_verify

_No result files found._

### pqcrystals_kyber_fips202_ref_sha3_256

| Fault | Correction test | Ineffective test |
|---|---|---|
| `pqcrystals_kyber_fips202_ref_sha3_256_fnSkip_keccak_absorb_once_line1` | ✅ | ✅ |
| `pqcrystals_kyber_fips202_ref_sha3_256_fnSkip_store64_line11` | ✅ | ✅ |

### pqcrystals_kyber_fips202_ref_sha3_512

_No result files found._

### pqcrystals_kyber_fips202_ref_shake128_absorb_once

_No result files found._

### pqcrystals_kyber_fips202_ref_shake256

_No result files found._

### pqcrystals_kyber_fips202_ref_shake256_absorb

_No result files found._

### pqcrystals_kyber_fips202_ref_shake256_absorb_once

_No result files found._

### pqcrystals_kyber_fips202_ref_shake256_squeeze

_No result files found._

### randombytes

_No result files found._

### store64

_No result files found._

### test_invalid_ciphertext

_No result files found._

### test_invalid_sk_a

_No result files found._

### test_keys

_No result files found._

### unpack_ciphertext

_No result files found._

### unpack_pk

_No result files found._

### unpack_sk

_No result files found._

## Summary

- Fault folders scanned: **366**
- Correction-test detections: **155**
- Ineffective-test detections: **143**
