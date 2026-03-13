#!/usr/bin/env sh
set -eu

root="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

required_files="AGENTS.md ARCHITECTURE.md features.json incremental.md docs/DESIGN.md docs/PLANS.md docs/PRODUCT_SENSE.md docs/QUALITY_SCORE.md docs/RELIABILITY.md docs/SECURITY.md"
required_dirs="docs/design-docs docs/exec-plans docs/generated docs/product-specs docs/references"

fail=0

for f in $required_files; do
  if [ ! -f "$root/$f" ]; then
    echo "missing file: $f" >&2
    fail=1
  fi
done

for d in $required_dirs; do
  if [ ! -d "$root/$d" ]; then
    echo "missing dir: $d" >&2
    fail=1
  fi
done

if [ $fail -ne 0 ]; then
  echo "docs lint failed" >&2
  exit 1
fi

echo "docs lint ok"
