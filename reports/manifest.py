"""
manifest.py
-----------
Loads the {func: {"secret-buf": ..., "fixed-scalars": ...}} manifest and
answers the one question the rule engine needs: for a given function and a
given SSA value that has been resolved back to a *formal parameter name* of
that function, is that parameter the secret buffer, a fixed/public scalar,
or neither?

Important nuance handled here: the manifest's "secret-buf" name is a
*C-source-level* name. It matches the callee's own formal-parameter name for
most functions (e.g. add_f's secret-buf "b" IS add_f's second parameter).
But for a few functions the manifest names the variable as it appears at the
*call site* instead (e.g. mat_add's secret-buf is "Ox", which is not one of
mat_add's own parameter names {a,b,c,m,n} - "Ox" is the name of the local
variable the caller happens to pass in that slot). For those, direct name
matching fails and the caller must fall back to call-site resolution
(see resolve.py: resolve_secret_param_via_callsites).

This module only does the manifest lookup + bookkeeping; call-site scanning
lives in resolve.py because it needs the whole parsed module.
"""

import json


class Manifest:
    def __init__(self, path):
        with open(path) as f:
            self._raw = json.load(f)
        # cache: func -> resolved formal-parameter name that is secret
        # (filled in lazily by resolve.py once call-site fallback runs)
        self._resolved_secret_param = {}

    def has(self, func):
        return func in self._raw

    def secret_buf_name(self, func):
        """The manifest's raw (possibly call-site-only) name for the secret buffer."""
        entry = self._raw.get(func)
        if not entry:
            return None
        return entry.get('secret-buf')

    def fixed_scalar_names(self, func):
        entry = self._raw.get(func)
        if not entry:
            return set()
        raw = entry.get('fixed-scalars', '')
        return {x.strip() for x in raw.split(',') if x.strip()}

    def set_resolved_secret_param(self, func, param_name):
        """Cache the result of call-site resolution so we only search once."""
        self._resolved_secret_param[func] = param_name

    def resolved_secret_param(self, func):
        return self._resolved_secret_param.get(func)

    def classify_param(self, func, param_name, fn_param_names):
        """
        Classify a *formal parameter name* of `func` as 'secret' | 'fixed' | 'other'.
        fn_param_names: the ordered list of func's own parameter names, needed to
        decide whether direct manifest-name matching is even meaningful (a param
        list containing 'b' means the manifest's 'b' can match directly).
        """
        if param_name is None:
            return 'unknown'
        if param_name in self.fixed_scalar_names(func):
            return 'fixed'

        raw_secret = self.secret_buf_name(func)
        resolved = self.resolved_secret_param(func)

        if resolved is not None:
            return 'secret' if param_name == resolved else 'other'
        if raw_secret is not None and raw_secret in fn_param_names:
            # direct name match is meaningful (manifest name IS a formal param)
            return 'secret' if param_name == raw_secret else 'other'
        # manifest secret name doesn't match any formal param and no call-site
        # resolution has been performed/succeeded -> we cannot classify this
        # parameter with confidence.
        return 'unresolved-manifest'