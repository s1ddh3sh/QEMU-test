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

### **Target function.** `poly_add(r, a, b)` :

- computes `r[i] = a[i] + b[i]`.
- In `indcpa_enc`  encryption function, the second ciphertext component `v` is built by two of these

```c
poly_add(&v, &v, &epp);                          // v = tᵀr + e2 (epp = e2)
poly_add(&v, &v, &k);                            // v = tᵀr + e2 + decomp(m)
poly_reduce(&v);
pack_ciphertext(c, &b, &v);                   // v Is packed into the ciphertext
```

### Hermelink, Pessl, Poppelmann, *Fault-Enabled Chosen-Ciphertext Attacks on Kyber* :

The paper flips **one** **bit** of a valid ciphertext and lets a fault **"correct"**
that ciphertext again during decapsulation. We do not inject bit faults,
so the match is **not the same location or primitive,** but flags the same *correctable output of the ciphertext* through the **correction test (T_CF)** on `poly_add`.

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

# DONE TILL HERE

---

## Target Function. `indcpa_keypair_derand` : keygen for kyber

In `indcpa_keypair_derand` the secret and error polynomials are drawn as

```

  for (i = 0; i < KYBER_K; i++)
    poly_getnoise_eta1(&skpv[i], noiseseed, nonce++);
  for (i = 0; i < KYBER_K; i++)
    poly_getnoise_eta1(&e[i], noiseseed, nonce++);
```

The **nonce** is the only thing that makes the `2k` draws differ. The PRF is
the Keccak sponge: absorb `noiseseed ‖ nonce` (`keccak_absorb_once`),
permute (`KeccakF1600_StatePermute`), squeeze (`keccak_squeeze`).

### Ravi, et al., *Number "Not Used" Once* :

**Detection : $T_{\mathrm{DIST}}$ (`project.tex`).** The test captures the
`2k = 6` sampled polynomials over `N` random seeds and flags a leak if either
part fires:

```
φ_ENT ≡ ∃ i :  H_i^ref − H_i > τ            // some poly loses > τ (≈1 bit) of entropy
φ_CMP ≡ (ē ≥ ē_ref + τ_e)  ∨  (ft sampled fewer polynomials than f)
φ_DIST = φ_ENT ∨ φ_CMP
```

where `H_i` is the per-coefficient entropy of polynomial `i` and `ē` is the mean
equal-fraction `eq(s_i, e_i)` over the pairs. Correct draws agree only by chance
(`ē_ref ≈ 0.27` for `CBD(η=2)`); a frozen nonce drives `ē → 1`.

The **genuine NNUO leak** is the nonce-reuse branch of `φ_CMP`: `ē` jumps to
`1.0` **while entropy stays ~2.0 bits** (`φ_ENT` does *not* fire) — the
polynomials are still random per seed, they have just stopped depending on the
nonce, so `s_i = e_i`. The 20 flagged faults fall into three groups by which
clause fires:

#### Group 1 — `φ_CMP` nonce reuse, entropy intact (the real NNUO) — 14 faults

The PRF sponge is made **independent of the absorbed nonce**, so every
`PRF(seed, i)` returns the same stream and all 6 polys become identical
(`ē = 1.0`) yet still vary per seed (`H_i ≈ 2.0`). `φ_CMP` fires, `φ_ENT` does not.

```
keccak_absorb_once : line38_mem, line59_mem, line61_mem   // skip the stores that fold the
                     line43_{zero,opB,undef}              //   nonce byte + rate words into
                     line47_{zero,opA,undef}              //   the sponge state
                     line60_{zero,opB}
KeccakF1600_StatePermute : line8_mem                      // skip the permutation → squeezed
                                                          //   stream ignores the absorbed nonce
keccak_squeeze     : line27_mem, line25_undef             // squeeze the same state for every nonce
```

```
// e.g. keccak_absorb_once_line38_mem / KeccakF1600_StatePermute_line8_mem
ē_ref (correct) : 0.273          ē (faulty) : 1.0        → φ_CMP fires
H_i (faulty)    : [2.02 … 2.04]  (≈ full log2(5) bits)   → φ_ENT does NOT fire
```

These are catastrophic: `s` and `e` are now the **same samples**, the key falls
out directly.

#### Group 2 — `φ_CMP` ∧ `φ_ENT` (reuse by collapse to a constant) — 4 faults

The sampler output is forced to a **constant**, so the polys are trivially equal
(`ē = 1.0`) *and* carry no entropy (`H_i = 0`). Both clauses fire; here `φ_ENT`
is the honest flag (reuse only in the degenerate sense `s = e = 0`).

```
keccak_squeeze : line21_mem, line25_zero, line25_opB   // zero the squeezed output
poly_cbd_eta1  : fnSkip_cbd2_line0                     // skip cbd2 → every coefficient 0
```
```
ē (faulty) : 1.0    H_i (faulty) : [0, 0, …, 0]   → φ_CMP ∧ φ_ENT
```

#### Group 3 — `φ_CMP` fewer-polynomials ∧ `φ_ENT` (missing poly) — 2 faults

Skipping one sampler call means one of the 6 polynomials is **never drawn** and
stays zero. The equal-fraction does not rise (`ē ≈ 0.18`, no reuse), but the
*fewer-polynomials* branch of `φ_CMP` fires and that zero polynomial trips
`φ_ENT`.

```
indcpa_keypair_derand : fnSkip_poly_getnoise_eta1_line18, _line27
```
```
ē (faulty) : 0.18 (no reuse)   H_i (faulty) : [2.0, 2.0, 2.0, 2.0, 2.0, 0.0]
→ φ_CMP (fewer polys) ∧ φ_ENT (the 6th poly)
```