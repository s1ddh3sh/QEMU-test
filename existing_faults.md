# 1. MAYO

signature generation in MAYO:

```
s_i = v_i + O·x_i || x_i
```

Leakage can be either Ox_i or v_i

---

## **Target Function.** `mat_add(a, b, c)`: computes s=v+Ox

```
for i=0 to m:
c[i] = add_f(a[i], b[i])    // s_i = v_i xor Ox_i
```

**Target instructions from taint:**

| IR line | instruction | meaning |
| --- | --- | --- |
| 5 | `load a[0]` | read `v[0]` (Vdec) |
| 7 | `load b[0]` | read `Ox[0]` |
| 8 | `call add_f(a0, b0)` | `v[0] ⊕ Ox[0]` |
| 10 | `store c[0]` | write `s[0]` |

### 1. line8: skip the `add_f` call:

Skipping the call replaces its result with the first argument, so

```
s[0] = v[0]            instead of   s[0] = v[0] ⊕ Ox[0]
```

### Attacks Detected:

### Abdelmonem et al., *Splitting the MAYO* :

- **Correction fault attack on s=v+Ox; skip addition and correct it.**

Correction fault test (T_CF): y1 = y2 xor alpha (alpha != 0).
**where signature(y),vinegar(r),oil(s)**

```
y1= v ⊕ Ox, y2=v; so alpha = y1 ⊕ y2 = Ox(s)
// correction_result.txt:
pos 0: 15/16 secret values with y1 = y2 xor alpha (alpha != 0) for all 16 (p, r)
  s=1, alpha=1
  s=2, alpha=2
  s=3, alpha=3
  s=4, alpha=4
  s=5, alpha=5
  s=6, alpha=6
...
```

### Sayari, Oussama, et al. "HaMAYO",  Campos et. al. “Oil, Vinegar, and Sparks: Key Recovery from {UOV} via Single EFI”

- differential attacks on signature; s=v+Ox, s' = v: s-s' = Ox
- **Can be detected by Ineffective fault test for Ox=0**

```
 d1 = [Δ==0], d2 = [Δ!=0]
// ineffective_result.txt:

pos 0: 15/120 pairs disagree (d1 != d2; unordered pairs, minimum over seeds)
    seed#0: s1=0 (ineffective) vs s2=1 (effective), on all 4 ephemeral draw(s)
    seed#1: s1=0 (ineffective) vs s2=1 (effective), on all 4 ephemeral draw(s)
    seed#2: s1=0 (ineffective) vs s2=1 (effective), on all 4 ephemeral draw(s)
    seed#3: s1=0 (ineffective) vs s2=1 (effective), on all 4 ephemeral draw(s)
```

- Same fault also detected via Direct_leak test (T_DT)
- **T_DT = [output == ephemeral] or [output == secret]**

---

### 2. line3: skip the vinegar load - `load a[0]`

### Aulbach et al., *MAYo or MAY-not* :

- Targets vinegar sampling to fault to a known/zero constant.
- The same fault is realized **from a different location** : Fault load v[0] in the signature : **v[0]=0**
**Target function :  mat_add**

```
s[0] = 0 ⊕ Ox[0] = Ox[0]
```

Direct_leak test detects s[0] = Ox[0]

```
// direct_leak.txt
function: mat_add
fault: loadStoreSkip/mat_add_line5_mem
secret-buf: Ox
eph_secret: Vdec
traces: 16 (existing)
[RESULT] direct-leak test: DETECTED -- secret-buf: output 's' at [0] holds input 'Ox'
```

> Symmetrically `line7`` skips the `Ox` load instead,
giving `s = v` (direct leak of the ephemeral);
> 

---

## Target function: `m_vec_mul_add`: scalar*vector multiplication across m dimension

- Used in intermediate calculaton of A=v*L, where L(expanded secret) : `L= (P1 + P1t)*O + P2`
- `m_vec_mul_add` : acc ⊕= v[0]*L  in a **bit-sliced** manner.

#### **Found attack : ineffective fault at an intermediate `v·L` product.**

- Skip any of the multiplication step below,

```jsx
line 10:  %mul   = (L & lsb)      · (v[0]·1)   →  v[0]·1 · bit0(L)   // plane 0
line 16:  %mul7  = (L>>1 & lsb)   · (v[0]·2)   →  v[0]·2 · bit1(L)   // plane 1
line 25:  %mul14 = (L>>2 & lsb)   · (v[0]·4)   →  v[0]·4 · bit2(L)   // plane 2
line 34:  %mul22 = (L>>3 & lsb)   · (v[0]·8)   →  v[0]·8 · bit3(L)   // plane 3
XOR of all four  =  v[0] · (bit0 + 2·bit1 + 4·bit2 + 8·bit3)  =  v[0] · L
```

- Eg. line 10: `%mul = mul i64 %and, %conv, !dbg !154"` , i.e v[0]·(bit0 L)

`%mul = mul i64 %and, %conv`  faulted to ⇒ `%mul=0` , v[0]·1 · bit0(L) is dropped.

**Detection : ineffective test  on vinegar(s)**:

```
pos 0: 64/120 pairs disagree (d1 != d2; unordered pairs, minimum over seeds)
    seed#0: s1=0 (ineffective) vs s2=2 (effective), on all 1 ephemeral draw(s)
    seed#1: s1=0 (ineffective) vs s2=2 (effective), on all 1 ephemeral draw(s)
    seed#2: s1=0 (ineffective) vs s2=2 (effective), on all 1 ephemeral draw(s)
    seed#3: s1=0 (ineffective) vs s2=2 (effective), on all 1 ephemeral draw(s)
```

Same results for instructions 16,25,34.

---

## Linearity test detection

- Linear system on secret from a faulted key
- `P3 = Ot*P1*O + Ot*P2`  faulted to ⇒ `P3 = Ot*P2 (linear system in O)`

**Locations flagged by the linearity test** :

| Target function | Fault |
| --- | --- |
| `compute_P3` | `skip call P1_times_O` |
| `compute_P3` | `skip call mul_add_mat_trans_x_m_mat` |
| `P1_times_O` | `skip call mul_add_m_upper_triangular_mat_x_mat`  |
| `pqmayo_MAYO_1_ref_mayo_keypair_compact` | `skip call expand_P1_P2` |
1. skip `P2=P1O + P2`  ⇒ `P3 = Ot*P2` 
2. skip `P2=Ot*P2`  ⇒ `P3 = zero (trivial)` 
3. same as 1.
4. skip `expand_P1_P2` ⇒ `P1 = 0; P2=0` 

---

# 2. Kyber

Kyber decryption decodes each message bit from a noisy coefficient

```
x = m·⌈q/2⌉ + d   (mod q, centered),   q = 3329, ⌈q/2⌉ = 1665
```

where the decryption noise

```
d = eᵀr + e₂ − sᵀ(e₁ + Δu) + Δv       (linear in the secret (s, e))
```

Every term except `(s, e)` is known to the attacker in a CCA attack.
So any fault whose **effectiveness depends on `d`** leaks a linear
inequality in `(s, e)`; collect enough inequalities and the key is recovered.
A fault that depends only on `m` leaks nothing (the attacker chose `m`).

---

## Target Function. `poly_tomsg(msg, a)`: the message decoder

Decodes each coefficient `x` of the decrypted polynomial to one message bit.

Original reference code:

```c
void poly_tomsg(uint8_t msg[KYBER_INDCPA_MSGBYTES], const poly *a)
{
  unsigned int i,j;
  uint16_t t;

  for(i=0;i<KYBER_N/8;i++) {
    msg[i] = 0;
    for(j=0;j<8;j++) {
      t  = a->coeffs[8*i+j];
      t += ((int16_t)t >> 15) & KYBER_Q;
      t  = (((t << 1) + KYBER_Q/2)/KYBER_Q) & 1; // skip + KYBER_Q/2 for attack
      msg[i] |= t << j;
    }
  }
}
```

Latest code (claimed to be patched) :

```c
void poly_tomsg(uint8_t msg[KYBER_INDCPA_MSGBYTES], const poly *a)
{
  unsigned int i,j;
  uint32_t t;

  for(i=0;i<KYBER_N/8;i++) {
    msg[i] = 0;
    for(j=0;j<8;j++) {
      t  = a->coeffs[8*i+j];
      t <<= 1;
      t += 1665; //+ KYBER_Q/2 is hardcoded
      t *= 80635; 
      t >>= 28;
      t &= 1;
      msg[i] |= t << j;
    }
  }
}

```

**Target instructions in LLVM:**

| IR line | instruction | meaning |
| --- | --- | --- |
| 13 | `%0 = load a[0]` | `x`, signed 16-bit, in [−1664, 1664] |
| 15 | `%1 = mul %conv, 161270` | `2·80635·x` (the `<<1` folded in) |
| 16 | `%mul6 = add %1, 134257275` | `+ 1665·80635`: the **`+q/2` offset** |
| 17 | `%shr = lshr %mul6, 28` | top bits, `⌊(2x+q/2)/q⌋` |
| 18 | `and %shr, 1` | the decoded bit |

### Attacks Detected:

### Pessl, Prokop, *Fault Attacks on CCA-secure Lattice KEMs* :

- **Skip the `+q/2` offset (or an equivalent scaling step) so the decision
boundary slides onto `x = 0`, which is exactly where `d` changes sign.**
- The computation looks like:

| Case | t | u = 2t | ⌊u/q⌋ | bit′ | Correct | Result |
| --- | --- | --- | --- | --- | --- | --- |
| A (d ≥ 0) | 300 | 600 | 0 | 0 | 0 | ineffective |
| B (d < 0) | 3029 | 6058 | 1 | **1** | 0 | **effective** |
| C (d ≥ 0) | 1965 | 3930 | 1 | 1 | 1 | ineffective |
| D (d < 0) | 1365 | 2730 | 0 | **0** | 1 | **effective** |

Target instruction 16 in patched code:

```
line 15:  %1    = mul %conv, 161270        ; %1 = 2·80635·x   (161270 = 2·80635)
line 16:  %mul6 = add %1, 134257275        ; %1 + 1665·80635  (the +q/2 offset)
```

Correct :  (2x + 1665)·80635  =  2x·80635  +  1665·80635 =  161270·x  +  134257275

Fault at line16 : `%mul6 = add %1, 0`

(2x + 1665)·80635  =  2x·80635  +  1665·80635 =  161270·x 

- Effectively skips the addition of 1665 (q/2), resulting into same condition as Pessl, Prokop

The computation looks like:

| x = a[0] | correct `P = (2x+1665)·80635` | `⌊P/2²⁸⌋ mod 2` = bit | faulty `P′ = 2x·80635` | `⌊P′/2²⁸⌋ mod 2` = bit′ | result |
| --- | --- | --- | --- | --- | --- |
| +831 | 268,272,645 | 0 | 134,015,370 | 0 | ineffective |
| **+829** (s₁) | 267,950,105 | 0 | 133,692,830 | 0 | **ineffective** |
| +300 | 182,638,275 | 0 | 48,381,000 | 0 | ineffective |
| 0 | 134,257,275 | 0 | 0 | 0 | ineffective |
| −1 | 134,096,005 | 0 | −161,270 | **1** | **effective** |
| −300 | 85,876,275 | 0 | −48,381,000 | **1** | **effective** |
| **−829** (s₂) | 564,445 | 0 | −133,692,830 | **1** | **effective** |
| −831 | 241,905 | 0 | −134,015,370 | **1** | **effective** |

**Detection : ineffective test (T_IF) : ineffective ⇔d ≥0 and effective ⇔ d < 0, holds same as Pessl, Prokop.**

```
[i] secret range [-1664, 1664] (from --secret-range), 256 value(s) swept
[+] INEFFECTIVE hit at pos 0: a pair exists on each of 4 public seeds [0, 1, 2, 3], constant over 1 ephemeral draw(s): 
p=0: s1=0 (ineffective) vs s2=-829 (effective), p=1: s1=0 (ineffective) vs s2=-829 (effective), 
p=2: s1=0 (ineffective) vs s2=-829 (effective), p=3: s1=0 (ineffective) vs s2=-829 (effective)

[+] CORRECTION hit at pos 0: s=-829, alpha=1 constant across 4 public backgrounds (seeds=[0, 1, 2, 3]) x 1 ephemeral draw(s)
[i] stopping sweep at sv=-829: 66 secret values examined (66 newly collected, 0 reused from disk), out of a possible 3329 -- 2.0% of the full sweep.

[RESULT] ineffective test: DETECTED at pos 0 (s1=0 ineffective, s2=-829 effective; pair on each of 4 public seeds, constant over 1 ephemeral draw(s))
[RESULT] correction test: SATISFIED at pos 0 (s=-829, alpha=1: y1 = y2 xor alpha for all 4 swept p x 1 ephemeral draw(s))
```

## **Target function.** `poly_add(r, a, b)` :

- computes `r[i] = a[i] + b[i]`.
- In `indcpa_enc`  encryption function, the second ciphertext component `v` is built by two of these

```c
poly_add(&v, &v, &epp);                          // v = tᵀr + e2 (epp = e2)
poly_add(&v, &v, &k);                            // v = tᵀr + e2 + decomp(m)
poly_reduce(&v);
pack_ciphertext(c, &b, &v);                   // v Is packed into the ciphertext
```

### Hermelink, Pessl, Poppelmann, *Fault-Enabled Chosen-Ciphertext Attacks on Kyber* :

The paper flips **one** **bit** of a valid ciphertext and lets a fault **"correct"** that ciphertext again during decapsulation. We do not inject bit faults, so the match is **not the same location or primitive,** but flags the same *correctable output of the ciphertext* through the **correction test (T_CF)** on `poly_add`.

So `a = v` (the running accumulator) and `b = epp` is the term added.

**Target instructions from `poly_add`:**

| IR line | instruction | meaning |
| --- | --- | --- |
| 5 | `%0 = load a[i]` | running `v` |
| 7 | `%1 = load b[i]` | load 2nd operand |
| 8 | `%add = add %0, %1` | `v + b` |
| 10 | `store r[i]` | write the ciphertext coefficient |

**Fault : skip the load `b`** or `%add = add %0, 0` (zeroB). Either fault leaves 

`v = v instead of  v = v + epp`

so the ciphertext coefficient is shifted by the **constant additive
correction `α = b`** — exactly an additive ciphertext manipulation that a
later step could "correct" by adding `b` back.

**Detection : correction test (T_CF).** 

```
[+] INEFFECTIVE hit at pos 0: a pair exists on each of 4 public seeds [0, 1, 2, 3], constant over 1 ephemeral draw(s): 
p=0: s1=0 (ineffective) vs s2=13 (effective), p=1: s1=0 (ineffective) vs s2=13 (effective), 
p=2: s1=0 (ineffective) vs s2=13 (effective), p=3: s1=0 (ineffective) vs s2=13 (effective)

[+] CORRECTION hit at pos 0: s=13, alpha=13 constant across 4 public backgrounds (seeds=[0, 1, 2, 3]) x 1 ephemeral draw(s)
[i] stopping sweep at sv=13: 2 secret values examined (2 newly collected, 0 reused from disk), out of a possible 3329 -- 0.1% of the full sweep.

[RESULT] ineffective test: DETECTED at pos 0 (s1=0 ineffective, s2=13 effective; pair on each of 4 public seeds, constant over 1 ephemeral draw(s))
[RESULT] correction test: SATISFIED at pos 0 (s=13, alpha=13: y1 = y2 xor alpha for all 4 swept p x 1 ephemeral draw(s))
```

---

# 3. Dilithium

## **Target function.** `polyvecl_add(w, u, v)`:

- `polyvecl_add` adds two vectors of length L, component-wise, one `poly_add` per component:

```c
void polyvecl_add(polyvecl *w, const polyvecl *u, const polyvecl *v) {
  for (i = 0; i < L; ++i)
    poly_add(&(*w)[i], &(*u)[i], &(*v)[i]);   // w[i] = u[i] + v[i]
}
```

- In `crypto_sign_signature_internal` it forms the response `z` of the signature. Just before the call, `z` holds `c·s1` (from `polyvecl_pointwise_poly_montgomery(&z, &cp, &s1)` then `polyvecl_invntt_tomont(&z)`), and `y` is the ephemeral masking vector:

```c
/* Compute z, reject if it reveals secret */
polyvecl_pointwise_poly_montgomery(&z, &cp, &s1);   // z = c·s1
polyvecl_invntt_tomont(&z);
polyvecl_add(&z, &z, &y);                            // z = c·s1 + y 
polyvecl_reduce(&z);
if (polyvecl_chknorm(&z, GAMMA1 - BETA))
  goto rej;
```

### Attacks detected

### Ouyang, Haobo, et al. *Improving Skipping Fault Correction Attacks on Randomized Dilithium via MILP* :

> For each signing attempt, the adversary can inject a single instruction-skipping fault during the computation `z = y + c·s1` that skips one coefficient addition in one secret key component. Concretely, if the targeted coefficient is position `i` in component `j`, the faulty signature contains `z'_j[i] = y_j[i]` instead of `z_j[i] = y_j[i] + (c·s1)_j[i]`, while all other coefficients are computed normally.
> 

This is a **correction fault**: a single additive term is dropped from one `z` coefficient so the faulty `z` differs from the correct one by a **additive correction.** Exactly detected by the correction fault test (T_CF) on `polyvecl_add` fn.

**Target instruction from `poly_add` (inside the `polyvecl_add` loop):**

| IR | instruction | meaning |
| --- | --- | --- |
| line7 | `call poly_add(&z[i], &z[i], &y[i])` | add `z[i] = z[i] + y[i]` |

**Fault : skip the `poly_add` call at iteration 0**

`z[0] = (c·s1)[0]  instead of  z[0] = (c·s1)[0] + y[0]`

```
[+] CORRECTION hit at pos 6: s=0, alpha=1 constant across 4 public backgrounds (seeds=[0, 1, 2, 3]) x 4 ephemeral draw(s)
[i] swept 157 secret value(s) spread over [-78, 78] (157 newly collected, 0 reused from disk) without satisfying --require=all for --test=both

[RESULT] ineffective test: no disagreement found in range swept
[RESULT] correction test: SATISFIED at pos 6 (s=0, alpha=1: y1 = y2 xor alpha for all 4 swept p x 4 ephemeral draw(s))
```

### *Loop Aborts Strike Back: Defeating Fault Countermeasures in Lattice Signatures with ILP* (TCHES) :

>The same `z = y + c·s1` spot is the target of the **loop-abort** family. Instead of dropping the
`+y` addition, the attack **zeros / aborts one coefficient of the mask `y`** (an early loop exit or a
stuck-at-zero store during `poly_uniform_gamma1`), so the corresponding response coefficient becomes
>
`z[i] = (c·s1)[i] + 0 = (c·s1)[i]`

— a `z` coefficient that exposes `c·s1` directly. The paper shows that zeroing even a **single**
coefficient of `y` suffices for key recovery across all Dilithium security levels via an ILP
formulation, and that the simple countermeasures proposed earlier (Espitau et al.) are insufficient.

Our tool reaches the **same faulty `z[i] = (c·s1)[i]`** from the mirror injection (skipping the add
drops `y` rather than zeroing it), so it is flagged by the **same correction test (T_CF)** result
above. The mask-zeroing root cause itself is caught upstream by the sampler collapse on
`poly_uniform_gamma1` (see the distribution-test section). Related nonce/mask-reuse DFA:
**Groot Bruinderink & Pessl, *Differential Fault Attacks on Deterministic Lattice Signatures*
(TCHES 2018, ePrint 2018/355)**.

---

## Same `poly_add`, direct-leak direction : `z` passes one operand through

The correction entry above drops `y` and keeps `c·s1`. Faulting `poly_add` so that **one operand
passes straight to the output** is the mirror image, and is flagged by the **Direct_leak test (T_DT)**
instead of T_CF — the same reading the MAYO `mat_add` entries use (`[output == ephemeral]`).

**Target instruction from `poly_add`** (same IR table as above):

| IR line | fault | effect |
| --- | --- | --- |
| line5 | skip `load a` (`line5_mem`) | `a` never loaded ⇒ `c = b` (the addend passes through) |
| line8 | `opB` on the add | add returns one operand ⇒ `c = b` |

**Detection : direct-leak test (T_DT).**

```
// poly_add/binOpFault/..._line8_opB/direct_leak_result.txt
[RESULT] direct-leak test: DETECTED -- secret-buf: output 'c' at [0, 1, 2] holds input 'b'
  at the same index in all 16 trace(s) where the fault changed it

// poly_add/loadStoreSkip/..._line5_mem/direct_leak_result.txt
[RESULT] direct-leak test: DETECTED -- secret-buf: output 'c' at [0, 1, 2, 3] holds input 'b'
  at the same index in all 4 trace(s) where the fault changed it
```

Depending on the operand binding in `z = (c·s1) + y`, the surviving operand is either the mask `y`
(reveals the mask of that coefficient) or `c·s1` (reveals the secret term directly) — the leak
primitive both correction attacks ultimately rely on, here exposed in a single pass.

---

## Rounding / hint / high-bits : constant-α correction on `w1`, `h`, `t0`, `t1`

**(New finding — signing/keygen-side rounding-correction, not covered by a single existing
Dilithium paper.)**

Dilithium's rounding primitives all have the shape `out = round(in)` with a small, fixed set of
output values. A skip/zero fault on one of them shifts the rounded value by a **constant additive
correction α independent of the public per-signature background** — exactly the `T_CF` signature.
Because the hint mechanism tolerates small perturbations of `w`, a faulted `w1`/`h` can still verify
while encoding a linear relation on the secret; a faulted `t0`/`t1` perturbs the public key / `c·t0`
term. This is the signing/keygen-side analogue of the inequality/polytope key recovery in
Azevedo-Oliveira et al. *Finding a polytope*, and of the verification-side public-parameter attacks
(ePrint 2023/1796; Bauer et al. 2025/2029).

**Target functions and faults (all `T_CF` SATISFIED with constant α):**

| Function | Role | Fault | α |
| --- | --- | --- | --- |
| `decompose` | `w = w1·2γ2 + w0` (signing high/low bits) | `line8_opA`, `line11_opA` | 128 |
| `poly_decompose` / `polyveck_decompose` | per-coeff / per-vector wrapper | `fnSkip decompose_line7` | — |
| `power2round` | `t = t1·2^d + t0` (keygen) | `line3_opB/undef/zero`, `line2_undef` | 1 |
| `make_hint` / `poly_make_hint` | hint bit `h` | `fnSkip make_hint_line9` | 95232 |
| `polyveck_shiftl` | `t0 << d` | `fnSkip poly_shiftl_line5` | — |
| `caddq` / `poly_caddq` | conditional `+q` (canonical form) | `fnSkip caddq` | −4190208 (= −q) |

**Detection : correction test (T_CF)** (ineffective T_IF fires alongside on most):

```
// decompose/binOpFault/..._line11_opA/test_result.txt
[+] CORRECTION hit at pos 0: s=128, alpha=128 constant across 4 public backgrounds (seeds=[0,1,2,3])
[RESULT] correction test: SATISFIED at pos 0 (s=128, alpha=128: y1 = y2 xor alpha for all 4 swept p ...)

// poly_make_hint/.../..._fnSkip_..._make_hint_line9/test_result.txt
[+] CORRECTION hit at pos 0: s=-95232, alpha=95232 constant across 4 public backgrounds
[RESULT] correction test: SATISFIED at pos 0 (s=-95232, alpha=95232: y1 = y2 xor alpha ...)

// power2round/binOpFault/..._line3_zero/test_result.txt
[RESULT] correction test: SATISFIED at pos 0 (s=1, alpha=1: y1 = y2 xor alpha for all 4 swept p ...)
```

The `caddq` case is a pure `T_IF` hit (α = −q leaves a non-canonical negative representative that
flows into packing) — a candidate signature-malleability/encoding issue to follow up by checking
whether the packed signature still verifies.

---

# 4. SNOVA

Parameter set `SNOVA_I_S_AES` (NIST level I): `v = 27, o = 5, l = 4, r = 4, q = 16`
(`n = v + o = 32`, `l² = lr = 16`). The secret an attacker wants is the private
linear map `T12`; an equivalent key follows from it. For each signature the signer
derives fresh **vinegar** `V_i` and solves for the oil part so the signature verifies,
via the reconciliation relation

```
S = T⁻¹ · V ,   with   S_i + Σ_j T12_ij · S_{v+j} = V_i  and  S_{v+j} = O_j
```

## **Target function.** `SNOVA_NAMESPACE(sign)` — the per-signature vinegar generator

The vinegar is a SHAKE256 stream **keyed by the private seed**, then two GF(16) nibbles
are unpacked per squeezed byte ([src/snova_ref.c:881-914](src/snova_ref.c#L881-L914)):

```c
shake256_init(&v_instance);
shake_absorb(&v_instance, seed + SEED_LENGTH_PUBLIC, SEED_LENGTH_PRIVATE); // L886: PRIVATE seed
shake_absorb(&v_instance, digest, BYTES_DIGEST);                          // L887: public
shake_absorb(&v_instance, salt,   BYTES_SALT);                            // L888: public (in sig)
shake_absorb(&v_instance, &num_sign, 1);                                  // L889: public counter
shake_finalize(&v_instance);
...
while (t_idx < SNOVA_v * SNOVA_l * SNOVA_r) {
    if (b_idx >= SK_BLOCK_SIZE) { shake_squeeze(vinegar_in_byte, SK_BLOCK_SIZE, &v_instance); b_idx = 0; }
    signature_in_GF[t_idx] = vinegar_in_byte[b_idx] & 0xf;  t_idx++;       // L908
    signature_in_GF[t_idx] = vinegar_in_byte[b_idx] >> 4;   t_idx++;       // L910-911
    b_idx++;
}
```

Only the first absorb (L886) carries the secret; `digest`, `salt`, `num_sign` are all
public / recoverable from the signature. This block is the C analogue of **line 13 of
Algorithm 2** in the SNOVA spec — the exact step the only prior fault paper targets.

### Attacks Detected

### Banegas & Villanueva-Polanco, *A Fault Analysis on SNOVA* (ePrint 2024/1883 / arXiv 2509.12879) :

> The only dedicated SNOVA fault attack. It **value-fixes** the vinegar entries `V_i`
> at Alg. 2 line 13; differencing many signatures cancels the fixed entries, giving
> linear systems that recover `T12` (≈ 22 faulty signatures at level I). A
> single-signature "fault-assisted reconciliation attack" (quadratic solve) is also given.
> The paper's model is **value-fixing only**; it explicitly declines the Keccak-targeting
> route and does not consider instruction-/store-skip or secret-independence faults.

Our sweep rediscovers the paper's injection point — the vinegar generation in `sign` —
and reaches it with cheaper fault primitives:

| Target function | Fault | Test | Detail |
| --- | --- | --- | --- |
| `_SNOVA_I_S_AES_ref_sign` | `loadStoreSkip/..._line911_mem` | ineffective | skipping the vinegar store leaves a **stale fixed-unknown** entry in that slot every signature — the precondition of the paper's many-signature attack (Alg. 3), reached by a skip instead of precise value control. `pos 6: 15/120 pairs disagree (+9 more positions)` |
| `_SNOVA_I_S_AES_ref_sign` | `loopOrFuncSkip/..._fnSkip_shake_absorb_line168` | vinegar-entropy | skip of the **private-seed absorb** (src L886) ⇒ vinegar no longer depends on the secret ⇒ **FULL COLLAPSE** (see below) |

---

## Vinegar-entropy (secret-dependence) detection — skipping the private-seed `shake_absorb`

**This is a new vector (A), not in the prior paper.** The four absorbs at L886–889 are
ordered private-seed → digest → salt → counter. A fault that **skips only the first absorb
(L886)** gives

```
vinegar = SHAKE256( digest ‖ salt ‖ num_sign )      // no secret input
```

so the attacker **recomputes `V` exactly** from public signature data. The reconciliation
relation `S = T⁻¹·V` then has a **fully known** right-hand side — strictly stronger than the
paper's *fixed-but-unknown* entry: no constant to guess, no quadratic search. In principle
**one** faulty signature pins the oil subspace and hence `T12`.

**Detection : vinegar-distribution test (`vinegar_dist_snova.py`)** — a whole-program test
that holds `digest`, `salt`, `num_sign` fixed and **sweeps the 32-byte private seed**,
capturing the signing vinegar each time and measuring per-nibble-position Shannon entropy:

- **correct build:** every position moves with the seed → entropy ≈ `Hmax` (≈ 4 bits) — the
  vinegar is secret-dependent (healthy);
- **faulty build:** the position is **frozen** (entropy 0) → the vinegar no longer depends on
  the secret.

The vinegar stays statistically uniform in both builds (flat nibble histogram), so a
frequency/chi-square test — and the value-level ineffective/correction tests — **cannot** see
this; only a secret-*dependence* measure can.

**Target instruction (base-IR line in the gated full-program ELF):**

| IR | instruction | meaning |
| --- | --- | --- |
| line168 | `call shake_absorb(&v_instance, seed + SEED_LENGTH_PUBLIC, SEED_LENGTH_PRIVATE)` | absorb the **private seed** into the vinegar PRG (src L886) |

**Fault : skip the private-seed `shake_absorb` call**

```
vinegar = SHAKE256(digest ‖ salt ‖ num_sign)   instead of   SHAKE256(privseed ‖ digest ‖ salt ‖ num_sign)
```

```
[ correct ] mean per-position entropy 3.816 bits (Hmax = 4.0), 64/64 seeds distinct, collision_rate 0.00
[ faulty  ] mean per-position entropy 0.000 bits, 1/64 distinct (all seeds → identical vinegar block), collision_rate 1.00
[ compare ] 64/64 secret-dependent positions collapsed to frozen -> leak_fraction = 1.00

[RESULT] vinegar-distribution test: COLLAPSE DETECTED (verdict = FULL) at fnSkip shake_absorb line168
         vinegar frozen across all private seeds -> secret removed from the PRG (vector A)
```

> The same whole-program collapse is also reported for
> `fnSkip_shake_finalize_line172` (src L890): skipping the sponge finalize breaks the
> secret→vinegar dependence the same way.
> 

A **value-level** vinegar sanity check (rejecting signatures whose fresh vinegar has
too many repeated/colliding values) would catch the value-fixing / stale-store cases
(paper's attack, vector B) but **cannot** see vector A — there the vinegar is still
correctly distributed and merely stops depending on the secret.

---

# Distribution tests for Kyber/Dilithium

## Target Function. `indcpa_keypair_derand` : keygen for kyber

In `indcpa_keypair_derand` the secret and error polynomials are drawn as :

```
// sampling code in indcpa_keypair_derand():
  for (i = 0; i < KYBER_K; i++)
    poly_getnoise_eta1(&skpv[i], noiseseed, nonce++);
  for (i = 0; i < KYBER_K; i++)
    poly_getnoise_eta1(&e[i], noiseseed, nonce++);
    
    
void poly_getnoise_eta1(poly *r, const uint8_t seed[KYBER_SYMBYTES],
                        uint8_t nonce) {
  uint8_t buf[KYBER_ETA1 * KYBER_N / 4];
  prf(buf, sizeof(buf), seed, nonce);
  poly_cbd_eta1(r, buf);
}

// call chain inside keypair:
poly_getnoise_eta1(r, seed, nonce)          
  └─ prf(buf, seed, nonce)               
       └─ extkey = seed ‖ nonce              
       └─ shake256(buf, extkey)
            └─ keccak_absorb_once(s, RATE, extkey, …)   
            └─ keccak_squeezeblocks(buf, …, s)          
  └─ poly_cbd_eta1(r, buf)                  
```

### Ravi, et al., *Number "Not Used" Once* :

**Detection : By $T_{\mathrm{DIST}}$** for Kyber/Dilithium

1. Does the entropy check for each s[i], e[i].
2. Compare the equal fraction between correct and faulty run. (To check if same sampled)\
3. Check if all the polynomials are sampled (else are zero).

### Detected faults (Dilithium):

The Dilithium samplers expand one seed into several secret-derived polynomials separated only by an
incrementing nonce: `s1,s2` via `poly_uniform_eta` and the per-signature mask `y` via
`poly_uniform_gamma1`. Skipping a sampler (or its inner XOF) **freezes that output / removes the
secret-seed dependence** — the nonce/domain-separator misuse condition behind
**Ravi et al. *Number "Not Used" Once*** (`s==e` / `y[i]==y[j]` collapse), the mask-collapse
loop-abort attacks (*Loop Aborts Strike Back*), and the nonce-reuse DFA of
**Bruinderink & Pessl** (a repeated mask leaks `s1` via `z = y + c·s1`).

On these gated ELFs the leak surfaces through the **generic `T_CF`/`T_IF`** detectors (the skipped
sampler leaves the output buffer at a frozen/constant value, so faulty = correct ⊕ const, with
α = 255 at the byte level and secret-independent effectiveness). The dedicated `T_DIST`
coordinate-collision statistic is the natural detector for the *collision* variant; via the
direct-call sign harness its baseline stays 0.000 (NO COLLAPSE) on NTT/pack skips, so the sampler
collapse is reported at the sampler functions themselves.

| Fault | maps to |
| --- | --- |
| `polyvecl_uniform_gamma1 / poly_uniform_gamma1 — fnSkip poly_uniform_gamma1` | mask `y` frozen → Loop-Abort / Bruinderink-Pessl nonce-reuse |
| `poly_uniform_gamma1 — fnSkip shake256_stream_init / shake256_squeezeblocks` | XOF-skip: mask becomes public-recomputable (NNUO) |
| `polyvecl_uniform_eta / polyveck_uniform_eta — fnSkip poly_uniform_eta` | `s1,s2` draw skipped/duplicated → NNUO "missing secret poly" |
| `poly_uniform_eta — fnSkip rej_eta` | η-rejection skipped → secret coeffs leave `[−η,η]` (weak-key keygen; also caught by the **range-check** detector) |

```
// polyvecl_uniform_gamma1/.../..._fnSkip_..._poly_uniform_gamma1_line9/test_result.txt
[+] CORRECTION hit at pos 83: s=0, alpha=255 constant across 4 public backgrounds (seeds=[0,1,2,3])
[RESULT] ineffective test: DETECTED at pos 31 (s1=0 ineffective, s2=1 effective; pair on each of 4 public seeds)
[RESULT] correction test: SATISFIED at pos 83 (s=0, alpha=255: y1 = y2 xor alpha for all 4 swept p ...)

// poly_uniform_eta/.../..._fnSkip_rej_eta_line4/test_result.txt
[+] CORRECTION hit at pos 17: s=0, alpha=255 constant across 4 public backgrounds
[RESULT] ineffective test: DETECTED at pos 9 (s1=0 ineffective, s2=1 effective; pair on each of 4 public seeds)
[RESULT] correction test: SATISFIED at pos 17 (s=0, alpha=255: y1 = y2 xor alpha ...)
```

The `rej_eta` skip is a **keygen-integrity** fault (biased/weak `s1,s2`) rather than a signature
attack, and is under-covered in the Dilithium fault literature — worth flagging to the maintainers
alongside a sampled-coefficient range assertion as the countermeasure.