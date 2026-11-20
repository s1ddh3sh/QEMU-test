# Dilithium fault-attack mapping — detections vs. literature

Scope: `pqcrystals_dilithium2_ref` (CRYSTALS-Dilithium / ML-DSA reference C, as compiled to
LLVM IR in `Dilithium-LLVM/`). Faults are the three IR-level fault models the tool injects
(`binOpFault` = zero/opA/opB/undef a binary op, `loadStoreSkip` = drop a load/store,
`loopOrFuncSkip` = skip a call/loop body) and are classified by five generic detectors:

| Detector | File | Flags |
|---|---|---|
| **Correction** `T_CF` | `correction_dilithium.py` | faulty out = correct out ⊕ constant α (α independent of the public per-signature background) |
| **Ineffective** `T_IF` | `ineffective_dilithium.py` | a secret value exists where the fault leaves the output *unchanged*, and a neighbouring one where it changes (effectiveness is secret-dependent) |
| **Direct-leak** `T_DT` | `dist_tests/direct_leak.py` | output coefficient equals an input ephemeral or secret coefficient verbatim |
| **Secret-vector / nonce-reuse** `T_DIST` | `common/secret_vector_dist.py` | a secret-derived value stops depending on the secret, or two independently-nonced polys collide |
| **Range-check** | `common/range_check.py` | a coefficient leaves its declared range in the faulty build |

Everything below is on the **reference, non-optimized** implementation and is intended for a
responsible-disclosure note to the pq-crystals / ML-DSA maintainers.

---

## 1. Literature landscape (correction + ineffective + related)

### Papers already in `msRnd/dilithium/`
- **Ouyang, Wang, Liu, Wu, Wang, Fan — *Improving Skipping Fault Correction Attacks on Randomized Dilithium via MILP*** (SAC 2026, ePrint 2026/1448) — `Dilithium_correction.pdf`. The `z = y + c·s1` single-coefficient skip; key recovery via MILP with reduced fault counts (−25.6/−13.5/−26.3 % at L2/L3/L5 in the shuffling setting). **This is the attack the tool's `T_CF` already flags on `polyvecl_add`.**
- **Islam, Mus, Singh, Sunar — *Signature Correction Attack on Dilithium*** (arXiv 2203.00637) — `Dilithium_correction_rowhammer.pdf`. Rowhammer bit-flip then "correct" the faulty signature; nonce-independent, so it applies to randomized signing.
- **Azevedo-Oliveira, Calle Viera, Cogliati, Goubin — *Finding a polytope: A practical fault attack against Dilithium*** — `Finding a polytope...pdf`. Polytope/inequality key recovery from faulted signatures.
- *Fault Attacks on CRYSTALS-Dilithium* survey — `dilithium_fault_attacks.pdf`; plus the Round-3 spec.

### Papers to add (not in the folder, directly relevant to what the tool detects)
1. **Krähmer, Mensch, Pessl et al. — *Correction Fault Attacks on Randomized CRYSTALS-Dilithium*** — TCHES 2024, **ePrint 2024/138**. The parent of the Ouyang MILP paper: defines the `z = y + c·s1` skip and, importantly, the **ineffective-fault variant obtained by setting the correction bound b = 0** (≈20 injections per ineffective bit). This is the primary reference for *both* the `T_CF` and `T_IF` hits on the response. **Highest-priority add.**
2. **Groot Bruinderink & Pessl — *Differential Fault Attacks on Deterministic Lattice Signatures*** — TCHES 2018, **ePrint 2018/355**. Nonce-reuse / partial-nonce-reuse key recovery; the theory behind the `T_DIST` nonce-reuse detector.
3. **Espitau et al. / follow-ups — *Loop Aborts Strike Back: Defeating Fault Countermeasures in Lattice Signatures with ILP*** — TCHES (ePrint; pubkey 33352). Zeroing one coefficient of the mask `y` (loop-abort) recovers the key across all levels; argues naive countermeasures are insufficient. Direct match for the `poly_uniform_gamma1` / mask-sampling skips.
4. ***Diverse Fault Attacks on Dilithium and Variant Implementation: Skipping, Aborting and Zeroing*** (2025). Combines the three fault classes this tool injects; shows shuffling + low-degree rejection are insufficient.
5. **Bauer et al. — *Forging Dilithium and Falcon Signatures by Single Fault Injection*** — **ePrint 2025/2029**. Removing `c·t1` and zeroing data inside the NTT to forge; relevant to the `ntt`/`invntt`/`power2round` detections.
6. ***Fault Attacks Sensitivity of Public Parameters in the Dilithium Verification*** — **ePrint 2023/1796**. Zeroizing the challenge `c` / public params on the verify side.
7. **Ulitzsch et al. (or similar) — *From MLWE to RLWE: A Differential Fault Attack on Randomized & Deterministic Dilithium*** — TCHES (ePrint). DFA that works against the randomized mode.
8. **ZKFault — *Fault attack analysis on ZK-based PQ signatures*** — arXiv 2409.07150 (broader family).
9. **Ravi et al. — *Number "Not Used" Once (NNUO)*** — COSADE 2019. Nonce/domain-separator skip makes two sampled secrets identical; the paper behind the `T_DIST` "missing poly / collapse" verdict.
10. **Pessl & Prokop — *Fault Attacks on CCA-secure Lattice KEMs*** — TCHES 2021. The ineffective/secret-independence reasoning the `T_IF` detector generalizes (already used on the Kyber side).
11. Survey: *Side-channel and Fault-injection attacks over Lattice-based PQ Schemes (Kyber, Dilithium)* — ACM 10.1145/3603170.

---

## 2. What the tool detects, mapped by signing stage

Detected faults (from `reports/faults/fault_report_dilithium.csv`): 28 correction, 72 ineffective,
2 direct-leak hits. Grouped by what they corrupt:

### A. Response `z = y + c·s1` — **already-known, cleanly reproduced**
| Fault | Detector | Maps to |
|---|---|---|
| `polyvecl_add / fnSkip poly_add` (drop one component's `+y`) | **Correction** (α const) | **Ouyang 2026/1448, Krähmer 2024/138** — the exact `z=y+c·s1` skip |
| `poly_add line8_opA` / `line7_mem` (zero/skip the add) | Correction + Ineffective | same family (coefficient-level) |
| `poly_add line8_opB` / `line5_mem` | **Direct-leak** | faulty `z[i]=y[i]` (leaks the mask) or `z[i]=(c·s1)[i]` (leaks the secret term directly) |

This confirms the tool catches the published correction attack from **two independent injection
points** (the vector-level `poly_add` skip and the scalar add), and additionally surfaces the
**direct-leak** reading of the same spot, which the correction papers do not emphasize.

### B. `c·s1`, `A·y`, `c·t0` pointwise products — **new injection points for the same key recovery**
| Fault | Detector |
|---|---|
| `poly_pointwise_montgomery line10 zero/opA/opB/undef` | Ineffective (+ correction on `undef`) |
| `polyvecl_pointwise_poly_montgomery / polyveck_pointwise_poly_montgomery / polyvecl_pointwise_acc_montgomery — fnSkip poly_pointwise_montgomery` | Ineffective |
| `poly_pointwise_montgomery — fnSkip montgomery_reduce` | Ineffective |

Zeroing a single coefficient of `c·s1` in the NTT domain yields `z[i]=y[i]` — the **same leak as
A, but realized at the multiply instead of the add**. Krähmer's b=0 ineffective variant lives here.
Because the ineffective-ness is secret-dependent (`(c·s1)[i]==0` ⇔ skip is ineffective), this is a
textbook `T_IF` target. **Candidate reportable finding: the multiply is an equally effective and
arguably stealthier injection site than the documented `z=y+c·s1` add.**

### C. Secret / mask sampling and nonce — **nonce-reuse & NNUO family**
| Fault | Detector | Maps to |
|---|---|---|
| `polyvecl_uniform_eta / polyveck_uniform_eta — fnSkip poly_uniform_eta` | Correction + Ineffective | NNUO (Ravi 2019): skip a nonced `s1/s2` draw → missing/duplicated secret poly |
| `polyvecl_uniform_gamma1 / poly_uniform_gamma1 — fnSkip poly_uniform_gamma1` | Correction + Ineffective | **Loop-Abort (33352), Bruinderink-Pessl 2018/355**: mask `y` collapse → `z=y+c·s1` leaks `s1` |
| `poly_uniform_* — fnSkip shake/stream_init / squeezeblocks` | Ineffective | XOF-skip → seed-derived value becomes public-recomputable (NNUO) |
| `signature_internal — fnSkip polyvecl_uniform_gamma1_line36` | Ineffective | whole-mask skip (pipeline-level confirmation of the above) |

The dedicated `T_DIST` runner is the right instrument here (the marginal distribution stays
uniform; only the secret-conditional statistic collapses). Note: on the `sign` entry the current
`T_DIST` baseline is 0.000 and these show NO COLLAPSE via the direct-call harness — the collapse is
seen at the sampler functions themselves, so **report these as sampler-level, not pipeline-level**.

### D. Rejection / norm check — **loop-abort / out-of-range**
| Fault | Detector | Note |
|---|---|---|
| `signature_internal — fnSkip polyveck_chknorm_line64` | Ineffective | **skips the `‖z‖, ‖r0‖ < γ1−β` rejection** → emits an out-of-bound signature that leaks `s1` (loop-abort / Bruinderink-Pessl family). Clean single-call skip. |
| `poly_uniform_eta — fnSkip rej_eta_line4` | Correction + Ineffective | **skips rejection in `η`-sampling** → secret coeffs fall outside `[−η,η]` → biased/weak key at keygen |

**Candidate reportable finding (D):** the `chknorm` rejection is a single `fnSkip` away from
leaking an unreduced `z`; and skipping `rej_eta` is a keygen-integrity fault that the **range-check**
detector is designed to catch (coefficients leaving `[−η,η]`).

### E. Rounding / hint / high-bits — **forgery & polytope family (least-covered, most novel)**
| Fault | Detector | Constant α |
|---|---|---|
| `decompose line7/8/11 (opA/undef/zero)` | Correction + Ineffective | e.g. α=128 |
| `poly_decompose / polyveck_decompose — fnSkip decompose` | Correction + Ineffective | |
| `power2round line2/3 (opB/undef/zero)` | Correction + Ineffective | α=1 |
| `poly_make_hint — fnSkip make_hint` | Correction + Ineffective | α=95232 |
| `polyveck_shiftl — fnSkip poly_shiftl` | Correction + Ineffective | shift of `t0` |
| `poly_caddq / polyveck_caddq — fnSkip caddq` | Ineffective | α=−4190208 (=−q) |

These corrupt `w1`/`h` (signing) and `t1`/`t0` (keygen) with a **constant additive correction** —
exactly the shape **Finding-a-polytope** and the **verification/public-param** attacks (2023/1796,
Bauer 2025/2029) exploit, but here injected on the **signing/keygen side** of the reference code.
The `T_CF` "constant α across all public backgrounds" signature means a faulted `w1`/`h`/`t0`
differs from the honest one by a fixed offset — a signature that may still verify (hint absorbs
small `w` errors) while encoding a linear relation on the secret. **This is the richest cluster of
candidate new attacks on the reference implementation** (see §3).

### F. NTT / inverse-NTT — **forgery-by-NTT-zeroing**
`ntt line23/27/33`, `invntt_tomont`, `polyvecl_ntt / polyveck_ntt — fnSkip poly_ntt` populate the
range-check and nonce-reuse result files but **do not collapse** under `T_IF`/`T_CF`/`T_DIST`.
That is the correct outcome: an NTT-twiddle fault is a *global* linear distortion, not a
constant-α or secret-independence fault, so it belongs to the **Bauer 2025/2029 / survey**
"zero data in the NTT to forge" family rather than to the correction/ineffective detectors. Worth
noting as a **gap**: the tool currently has no detector tuned to the NTT-zeroing forgery pattern.

### G. XOF / Keccak core
`keccak_absorb line46/50 (opA/opB/zero/undef)` → Correction + Ineffective. Faulting the SHAKE
absorb perturbs every seed-derived value (matrix `A`, secret, mask, challenge). Maps loosely to
NNUO / challenge-manipulation; most useful as an **amplifier** feeding C/E above.

### H. Trivial / output-mangling (report as low value)
`signature_internal — fnSkip` of `unpack_sk`, `pack_sig`, `memcpy`, `shake256_*`,
`polyvec_matrix_expand`, `polyveck_pack_w1`, `invntt`, etc. flag Ineffective only because skipping
a whole stage changes the output. These are **detector noise at the pipeline level** (any skip
changes the signature) and should be de-emphasized vs. the coefficient-level hits in A–E.

---

## 3. Candidate new attacks on the reference implementation (from unmapped detections)

Ranked by how far they go beyond what a single existing Dilithium paper already states:

1. **Constant-α correction on `decompose` / `make_hint` / `power2round` (cluster E).**
   The `T_CF` hits show a faulted `w1`, hint `h`, or `t0`/`t1` that is a *fixed offset* from honest.
   Proposed attack: inject the skip once per signature, collect signatures that still verify (the
   hint mechanism tolerates small `w` perturbations), and solve the resulting linear system on `s2`
   / `t0` — a signing-side analogue of *Finding a polytope* and of the verify-side public-param
   attacks (2023/1796). Not, to our knowledge, published as a **signing-side rounding-correction**
   attack on the reference code. **Most promising.**

2. **Ineffective fault at the `c·s1` multiply (cluster B)** as a drop-in, stealthier instantiation
   of Krähmer's b=0 ineffective variant: zero one coefficient of `poly_pointwise_montgomery` so the
   skip is effective ⇔ `(c·s1)[i] ≠ 0`, giving one inequality on `s1` per injection without the
   `b=0` add-bound trick. Report as an **improved injection point** for 2024/138 / 2026/1448.

3. **`rej_eta` skip → weak-key keygen (cluster D).** Skipping the `η`-rejection makes secret
   coefficients exceed `[−η,η]`; the **range-check** detector confirms out-of-domain coefficients.
   A keygen-integrity fault (biased/weak `s1,s2`) rather than a signature attack — under-covered in
   the Dilithium fault literature and cheap to trigger.

4. **`chknorm` rejection-skip (cluster D).** Single `fnSkip` emits an unreduced `z`; loop-abort /
   Bruinderink-Pessl key recovery. Known family, **new single-call injection site** worth flagging
   to maintainers for a redundancy/verify-after-sign countermeasure.

5. **`caddq` ineffective fault (cluster E, α=−q).** Leaves a non-canonical (negative) representative
   that flows into packing; candidate signature-malleability / encoding attack — needs a follow-up
   check on whether the packed signature still verifies.

### Detector gap to note in the report
The **NTT-zeroing forgery** (Bauer 2025/2029) is visible to the fault *injector* (cluster F) but no
current detector fires on it. Adding an "NTT linear-distortion / forgery-verify" detector would
close the one family the tool injects but cannot yet classify.

---

## 4. Suggested countermeasures to accompany disclosure
- Verify-after-sign (recompute `A·z − c·t1·2^d` and the challenge) kills the correction (A/B),
  rounding (E) and rejection-skip (D) families in one shot — single-fault correction attacks are
  inherently stopped by sign-then-verify.
- Redundant / checksummed nonce counter and sampler-output non-zero checks address C.
- Range assertions on sampled `s1,s2 ∈ [−η,η]` and on `z` before packing address D.
