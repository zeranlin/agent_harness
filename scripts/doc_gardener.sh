#!/usr/bin/env sh
set -eu

root="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

# Flag TODO/TBD and stale docs (older than 180 days)
find "$root/docs" -type f \( -name "*.md" -o -name "*.txt" \) -print0 | while IFS= read -r -d '' f; do
  if rg -n "\b(TODO|TBD)\b" "$f" >/dev/null 2>&1; then
    echo "needs attention (TODO/TBD): $f"
  fi
  if [ "$(find "$f" -mtime +180 -print | wc -l | tr -d ' ')" != "0" ]; then
    echo "stale doc (>180d): $f"
  fi
done

