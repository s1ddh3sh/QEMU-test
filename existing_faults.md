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

# DONE TILL HERE.

### **Target function.** `poly_add(r, a, b)` :

- computes `r[i] = a[i] + b[i]`.
- In `indcpa_enc`  encryption function, the second ciphertext component `v` is built by two of these

```c
v = tᵀr + e2                      // poly_add(&v, &v, &epp)   
v = tᵀr + e2 + Decompress(m)      // poly_add(&v, &v, &k)     
pack_ciphertext(c, &b, &v);       // v IS the ciphertext coefficient
```

### Hermelink, Pessl, Pöppelmann, *Fault-Enabled Chosen-Ciphertext Attacks on Kyber* :

The paper flips one **bit** of a valid ciphertext and lets a fault **"correct"**
that ciphertext again during decapsulation, using the Fujisaki–Okamoto
re-encryption + equality test as an oracle (decapsulation succeeds ⇔ the net
perturbation did not change the decoded message). We do not inject bit faults,
so the match is **not the same location or primitive** — but the framework
flags the same *correctable additive perturbation of the ciphertext* through
the **correction test (T_CF)** on `poly_add`.

So `a = v` (the running accumulator) and `b` is the term being folded into
the ciphertext (`e2`, resp. the message encoding `k = Decompress(m)`). This
same `poly_add` is re-executed in the FO **re-encryption** during decapsulation.

**Target instructions from taint:**

| IR line | instruction | meaning |
| --- | --- | --- |
| 5 | `%0 = load a[i]` | running `v` |
| 7 | `%1 = load b[i]` | the addend being folded in |
| 8 | `%add = add %0, %1` | `v + b` |
| 10 | `store r[i]` | write the ciphertext coefficient |

**Fault : drop the addend `b`** — `line7_mem` (skip the load of `b`) or
`line8_opA` (drop that operand of the add). Either leaves

```
r = a            instead of   r = a + b
```

so the ciphertext coefficient is shifted by the **constant additive
correction `α = b`** — exactly an additive ciphertext manipulation that a
later step could "correct" by adding `b` back.

**Detection : correction test (T_CF).** The induced divergence is a clean,
secret-dependent additive offset `(y1 − y2) mod q = α`, and here `α` equals the
dropped addend itself:

```
// loadStoreSkip/pqcrystals_kyber768_ref_poly_add_line7_mem/correction_smt_result.txt
// (identical witness for binOpFault/..._line8_opA)
[i] 256 secret value(s) of b[0] x every public background p (symbolic)
pos 0: 255/256 secret values with (y1 - y2) mod 3329 = alpha (alpha != 0) for all p
    s=13, alpha=13
    s=26, alpha=26
    ...
[RESULT] correction test: SATISFIED at pos 0 (s=13, alpha=13: (y1 - y2) mod 3329 = alpha for every p)
```

- `α = s` for 255/256 swept values ⇒ the correction amount **is** the secret
addend `b`; a correct-and-observe primitive on `v` therefore leaks it.
- Only dropping the **clean addend `b`** gives a constant `α`. Dropping the
running accumulator (`line5_mem`, i.e. `r = b`) or skipping the store
(`line10_mem`) is proven **not satisfied** — `Δ` then tracks the public
background, not a fixed correction.

**Why this is the Hermelink analog.** Hermelink needs a *controlled additive
perturbation of the ciphertext that can be corrected*, with the FO verdict as
the secret oracle. The paper realizes it as a bit-flip + a correcting fault;
here the correction test proves `poly_add` admits a **fixed, secret-dependent
additive correction `α` on the ciphertext coefficient `v`** — the same primitive
through a different fault model (operand drop, not bit-flip). Like the paper's
attack, it is tied to the ciphertext arithmetic rather than one precise skipped
instruction, and the fault window spans both encryption and FO re-encryption.

---

## Target Function. PRF `= SHAKE256(noiseseed ‖ nonce)`: the noise sampler

In `indcpa_keypair_derand` the secret and error polynomials are drawn as

```
s[i] = CBD_η( PRF(noiseseed, nonce = i)     )   for i = 0..k−1
e[i] = CBD_η( PRF(noiseseed, nonce = k+i)   )   for i = 0..k−1
```

The **nonce** is the only thing that makes the `2k` draws differ. The PRF is
the Keccak sponge: absorb `noiseseed ‖ nonce` (`keccak_absorb_once`),
permute (`KeccakF1600_StatePermute`), squeeze (`keccak_squeeze`).

### Ravi, et al., *Number "Not Used" Once* :

- **Freeze / drop the nonce inside the PRF so every draw uses the same
keystream.** A fault that makes the sponge state independent of the
absorbed nonce byte — e.g.

```
keccak_absorb_once_line38_mem   // skip the store that mixes in the nonce byte
KeccakF1600_StatePermute_line8_mem   // skip permutation so output ignores the input
keccak_squeeze_line27_mem       // squeeze the same state for every nonce
```

makes `PRF(seed, i)` identical for all `i`, so **all `2k` polynomials
collapse onto each other**: `s[0] = s[1] = … = e[k−1]`.

**Detection : nonce-reuse distribution test.** Sample the `2k = 6`
polynomials over many seeds and compare:

```
// nonce_reuse_dist_report.json  (comparison)
correct_equal_frac : 0.273     // ~coincidental CBD agreement
faulty_equal_frac  : 1.0       // every pair of polys is identical
nonce_reuse        : true
faulty_poly_entropy: [2.04, 2.04, 2.04, 2.04, 2.04, 2.04]   // still ~log2(5) bits
low_entropy        : false
```

- `faulty_equal_frac → 1.0` with **entropy preserved (~2.0 bits)** is the
signature of genuine reuse: the polynomials are still random *per seed*,
they have simply stopped depending on the nonce, so `s` and `e` are now the
**same samples** — catastrophic, the key falls out directly.
- Contrast with a **collapse** (`poly_cbd_eta1` skip `cbd2` → every output 0):
there `faulty_equal_frac = 1.0` too, but `faulty_poly_entropy = 0` and
`low_entropy = true` — the independent entropy test flags that case instead.
- Contrast with a **missing poly** (`indcpa_keypair_derand` skip one
`poly_getnoise_eta1` call): one poly has entropy `0`, flagged by the
entropy test, `nonce_reuse = false`.