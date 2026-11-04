# Secret-dependence distribution tests (MAYO / Kyber / Dilithium)

This note describes two closely related simulation tests that run a *correct*
gated ELF and a *faulty* gated ELF of a post-quantum scheme side by side, and
compare how the scheme's secret-derived randomness behaves. Both answer the
same kind of question — *"did the fault strip the secret out of a value that is
supposed to depend on it?"* — but measure it with the statistic that fits each
scheme:

| Test | Scheme(s) | Entry observed | Statistic | File |
|------|-----------|----------------|-----------|------|
| **Vinegar entropy test** | MAYO | `mayo_sign_signature` | per-nibble secret-sweep entropy of the vinegar | `dist_tests/mayo/vinegar_dist_mayo.py` |
| **Secret-vector distribution test** | Kyber, Dilithium | keypair / sign | value distribution **+** coordinate-equality of the sampled secret polynomials | `dist_tests/common/secret_vector_dist.py` |

Both are driven per function by a bash runner that sweeps every faulty gated
ELF against the one correct gated ELF:

- `dist_tests/mayo/run_vinegar_dist_mayo.sh [<func>]`
- `dist_tests/kyber/run_nonce_reuse_dist.sh [<func>]`
- `dist_tests/dilithium/run_nonce_reuse_dist.sh [<func>]`

With no `<func>`, each runner iterates every function key in the scheme's
`<scheme>.json` and tests them one after another.

---

## 1. Why a *distribution* test, and not a value test

All of these schemes expand a short secret seed through a XOF (SHAKE) into
randomness that *looks uniform*:

- MAYO's **vinegar** vector `V = SHAKE256(digest ‖ R ‖ csk_seed ‖ …)` is uniform
  over GF(16).
- Kyber's secret/error polynomials `s, e` are centered-binomial (CBD) samples.
- Dilithium's signing **mask** `y` is uniform over `(-γ1, γ1]`.

A fault that removes the secret from one of these values does **not** change its
*marginal* distribution — a vinegar computed without the private seed is still
uniform GF(16); a mask computed with a frozen nonce is still uniform. So a
frequency / chi-square goodness-of-fit test on the value histogram cannot see
the fault: both the honest and the faulty value pass as "uniform".

What the fault changes is the **conditional** behaviour of the value with
respect to the secret:

- honest: as the secret seed varies, the value varies;
- faulty: as the secret seed varies, the value is frozen (or two values that
  should be independent become identical).

Both tests therefore sweep the secret and measure a *conditional* statistic,
comparing the correct and faulty builds. Everything else (message, salt, and the
emulator's deterministic `randombytes`) is held fixed via a snapshot taken
before the swept call, so the only varying input is the secret.

---

## 2. MAYO — the vinegar entropy test

### What it observes

In MAYO signing (Algorithm 8, `mayo_sign_signature`) the vinegar block

```
V = SHAKE256( digest ‖ R ‖ csk_seed ‖ … )     # 430 bytes for MAYO_1
```

is keyed by the 24-byte compact private seed `csk`. The vinegar must depend on
the secret: it is what hides the oil subspace in each signature. If a fault
stops the secret from entering this SHAKE, the vinegar becomes
**attacker-recomputable from public data**, which breaks the scheme's
unforgeability.

### The statistic: per-position secret-sweep entropy

1. Sweep `N` random private seeds (default 64), holding everything else fixed.
2. For each seed, capture the 430-byte vinegar `V` in both builds. `V` is
   identified robustly as the `shake256` call whose output length is
   `VINEGAR_LEN = 430` (unique among sign's SHAKE calls: digest 32, salt 24,
   t-enc 39).
3. Split every byte into two GF(16) nibbles. For each nibble position `p`,
   compute the empirical Shannon entropy `H[p]` (bits, max 4) over the `N`
   captured values.

Classify each position against the max observable entropy
`Hmax = min(log2 16, log2 N)`:

- *live in correct*: `H_correct[p] ≥ 0.50·Hmax` (the secret reaches it);
- *collapsed (leaked)*: live in correct **and** `H_faulty[p] ≤ 0.15·Hmax`
  (the secret no longer reaches it in the faulty build).

```
leak_fraction = #collapsed / #live_in_correct

 = 1   -> FULL collapse   : vinegar wholly secret-independent
0<·<1  -> PARTIAL collapse : a subset of the vinegar is frozen
 = 0   -> no collapse     : both builds are equally secret-keyed
```

The wide gap between the "live" (0.50) and "frozen" (0.15) thresholds makes the
verdict robust to finite-sample entropy bias. The nibble histogram and
collision rate are reported alongside as diagnostics — the histogram shows the
value distribution stays ≈ uniform, i.e. *why* a chi-square test is the wrong
instrument here.

### What it detected in practice

Sweeping all 36 faulty gated ELFs of `mayo_sign_signature` flagged exactly one:
`fnSkip_memcpy_line22` — the `memcpy` that copies the private `csk` seed into the
vinegar SHAKE input — produced a **FULL collapse** (every secret-dependent
nibble frozen). That is precisely the fault class the test is meant to catch.

---

## 3. Kyber / Dilithium — the secret-vector distribution test

MAYO reads one secret-keyed output (the vinegar). Kyber and Dilithium instead
sample **several** secret polynomials from one seed, told apart only by an
incrementing one-byte/half nonce (a domain separator). The relevant fault is
not "the value loses the secret" but "two values that must be *independent*
become *identical*". So the statistic is a per-coefficient value distribution
**plus** a coordinate-equality fraction between a configured pair of polynomials.

### Kyber (KEM) — keypair, `t = A·s + e`

Entry: `indcpa_keypair_derand(pk, sk, coins)`. The secret/error vectors are
sampled by `poly_getnoise_eta1` in source order:

```
s[0..2] = CBD(PRF(noiseseed, nonce = 0,1,2))
e[0..2] = CBD(PRF(noiseseed, nonce = 3,4,5))
```

The test sweeps `coins`, captures the 6 polynomials, groups them `s = {0,1,2}`,
`e = {3,4,5}`, and reports the fraction of coordinates where `s[i] == e[i]`
(pairs `(0,3),(1,4),(2,5)`).

- correct: `s` and `e` are independent CBD(η=2) → equal-coordinate fraction at
  the chance level, **≈ 0.27** (measured).
- nonce reuse (`s == e`): fraction → **≈ 1.0**.

### Dilithium (signature) — sign, the mask `y`

Entry: `signature_internal(…, rnd, sk)`. The per-signature mask
`y = (y[0..L-1])` is expanded by `L = 4` `poly_uniform_gamma1` calls from one
seed told apart by an incrementing nonce. The test sweeps `rnd`, captures the 4
`y` polynomials, and reports the equal-coordinate fraction over all pairs
`y[i] == y[j]`.

- correct: independent masks → fraction **≈ 0.000** (measured).
- nonce reuse (`y[i] == y[j]`): fraction → **≈ 1.0**. A repeated mask leaks the
  long-term secret `s1` via `z = y + c·s1`.

### Verdicts

```
NONCE-REUSE COLLAPSE : faulty pair-equality ≥ 0.90 and ≥ correct + 0.40
MISSING SECRET POLY  : faulty build sampled fewer polynomials than correct
                       (a sampler call was skipped -> part of the secret
                       vector is left unset)
NO COLLAPSE          : faulty build is no more equal than correct
```

Each captured polynomial is read at its sampler's **return** (an entry hook
records the destination, a return hook reads it immediately after it is
written), so an in-place NTT later in the call tree cannot corrupt the reading,
and the test does not depend on *where* in the call tree the fault sits.

### What it detected in practice

On the gated Kyber keypair sweep (10 faulty ELFs), the two `poly_getnoise_eta1`
skips were flagged as **MISSING SECRET POLY** (5 of 6 polynomials sampled); the
rest showed NO COLLAPSE. On the gated Dilithium sign, the correct baseline is
0.000 and an NTT/pack skip shows NO COLLAPSE (it does not touch the mask
sampling). The nonce-reuse path fires when a fault drives `s == e` / `y[i]==y[j]`
to ≈ 1.

---

## 4. What these tests detect, and the papers behind them

Both tests target the **nonce / domain-separator misuse** fault family on
lattice- and MQ-based schemes: faults that make a secret-derived value stop
depending on the secret, or make two independently-nonced values collide.

- **Ravi, Roy, Bhasin, Chattopadhyay, Mukhopadhyay —
  *"Number 'Not Used' Once — Practical Fault Attack on pqm4 Implementations of
  NIST Candidates"* (COSADE 2019).**
  Shows that a single instruction-skip on the nonce used as a domain separator
  makes two sampled secrets identical (e.g. `s == e`), collapsing the LWE
  instance `t = A·s + e` to a trivially solvable system, and the analogous
  effect in Kyber, NewHope, Frodo and Dilithium key generation.
  → This is exactly the **Kyber / Dilithium secret-vector test**: it measures
  the `s[i] == e[i]` (and `y[i] == y[j]`) coordinate-equality that this attack
  produces, and also flags the related "a secret polynomial was never sampled"
  case.

- The same domain-separator weakness, viewed as *"the secret seed never enters
  the PRG that produces this secret-keyed value"*, is what the **MAYO vinegar
  entropy test** detects: a fault on the copy/absorb of the private seed leaves
  the vinegar a public function of non-secret inputs. This is the MQ-signature
  analogue of the above (vinegar in MAYO plays the role the nonced noise plays
  in LWE), and of the ineffective/secret-independence fault analyses on
  lattice KEMs such as **Pessl & Prokop, *"Fault Attacks on CCA-secure Lattice
  KEMs"* (TCHES 2021)**, which likewise reason about whether a faulted
  intermediate still carries the secret.

In both cases the test is a **distribution-level detector**: it does not need to
know the exact faulted instruction, only that the fault's *effect* is to remove
the secret's influence on a value that should carry it — which the marginal
value distribution hides but the conditional (secret-swept) statistic exposes.

---

## 5. Running the tests

```
# MAYO: one function, or all mayo.json keys
./dist_tests/mayo/run_vinegar_dist_mayo.sh pqmayo_MAYO_1_ref_mayo_sign_signature
./dist_tests/mayo/run_vinegar_dist_mayo.sh                 # all functions

# Kyber / Dilithium: one function, or all keys
./dist_tests/kyber/run_nonce_reuse_dist.sh pqcrystals_kyber768_ref_indcpa_keypair_derand
./dist_tests/dilithium/run_nonce_reuse_dist.sh pqcrystals_dilithium2_ref_signature_internal
./dist_tests/kyber/run_nonce_reuse_dist.sh                 # all functions
```

Each runner builds the gated ELFs on demand (`<scheme>_build.sh`) if they are
missing, tests the correct gated ELF against every faulty gated ELF, writes a
per-ELF `*_result.txt` and `*_report.json`, and prints a final tally of how many
ELFs were flagged.

### Note on the gated harness

The gated whole-program `main` of Kyber/Dilithium runs the scheme's full KAT
self-test, which in the bare-metal emulator does not yield a single clean,
hookable keygen/sign. The secret-vector test therefore **calls the observation
entry directly** with its own argument buffers in the MPS2 `scratch` RAM region,
sweeping the secret buffer itself — so it works on the gated ELFs without any
change to the fuseback pipeline. MAYO's gated `main` is a minimal single
sign driver, so the vinegar test observes it through the normal boot.
