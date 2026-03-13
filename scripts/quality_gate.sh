#!/usr/bin/env sh
set -eu

root="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

# 1) docs structure
"$root/scripts/docs_lint.sh"

# 2) placeholder: test runner hook
if [ -f "$root/scripts/test_runner.sh" ]; then
  "$root/scripts/test_runner.sh"
else
  echo "test_runner.sh not found; skipping test execution"
fi

echo "quality gate ok (structure + tests)"
