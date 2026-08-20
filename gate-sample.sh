#!/bin/bash
# gate-sample.sh — a minimal content gate. Exit 0 = pass, exit 1 = blocked.
# Free sample from https://pathobrain.gumroad.com — edit patterns to match
# the failures YOUR pipeline actually produces.
set -uo pipefail
FILE="${1:?usage: gate-sample.sh <script.md>}"
FAIL=0

# 1. Absolute claims — the words most likely to be wrong
ABS='\b(never|always|first ever|no one|nobody|impossible|only [a-z]+ in the world)\b'
if grep -nEi "$ABS" "$FILE"; then
  echo "BLOCK: absolute claim(s) above — soften or add an ironclad source"; FAIL=1
fi

# 2. On-screen text (TEXT: lines) must not carry superlatives
if grep -nEi '^TEXT:.*\b(best|greatest|most|largest|tallest|first)\b' "$FILE"; then
  echo "BLOCK: superlative in on-screen text — captions get screenshotted"; FAIL=1
fi

# 3. Factual sections need a source line
if ! grep -qEi '^(source|sources|ref):' "$FILE"; then
  echo "BLOCK: no source line found — add 'Sources:' with at least one entry"; FAIL=1
fi

[ "$FAIL" -eq 0 ] && echo "Gate passed: $FILE"
exit $FAIL
