#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="$ROOT/dist"
OUT="$DIST/thalean-relational-saturation-overleaf.zip"
HASH="$OUT.sha256"

mkdir -p "$DIST"

rm -f "$OUT" "$HASH"

cd "$ROOT"

zip -rq "$OUT" \
    paper \
    sections \
    refs \
    README.md \
    .gitignore \
    -x \
    'paper/*.aux' \
    'paper/*.bbl' \
    'paper/*.blg' \
    'paper/*.fdb_latexmk' \
    'paper/*.fls' \
    'paper/*.log' \
    'paper/*.out' \
    'paper/*.pdf' \
    'paper/*.synctex.gz' \
    'paper/*.toc'

sha256sum "$OUT" > "$HASH"

printf '%s\n' \
    '== PAPER 14 OVERLEAF PACKAGE ==' \
    "ZIP: $OUT" \
    "SHA256: $HASH"

cat "$HASH"
