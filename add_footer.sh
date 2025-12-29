#!/bin/bash
set -euo pipefail

target=${1:-}   # contoh: docs/04-prosess
[ -n "$target" ] || { echo "Usage: $0 docs/NN-name"; exit 1; }
readme="$target/README.md"
[ -f "$readme" ] || { echo "No README at $readme"; exit 1; }

# get module number (from folder name or header)
base=$(basename "$target")
num=$(echo "$base" | grep -oE '^[0-9]+' || true)
if [ -z "$num" ]; then
  num=$(sed -n "1s/^# *[Mm]odul *0*\([0-9]\+\).*/\1/p" "$readme")
fi
num=$((10#$num))                    # ensure decimal
printf -v cur "%02d" "$num"
prev=$((num-1)); next=$((num+1))
printf -v prev2 "%02d" "$prev"
printf -v next2 "%02d" "$next"

# find dirs
prev_dir=$(ls -d docs/${prev2}-* 2>/dev/null | head -n1 || true)
next_dir=$(ls -d docs/${next2}-* 2>/dev/null | head -n1 || true)

# get titles (fallback to generic if missing)
if [ -n "$prev_dir" ] && [ -f "$prev_dir/README.md" ]; then
  prev_title=$(sed -n '1p' "$prev_dir/README.md" | sed -E 's/^# *//')
  prev_link="../$(basename "$prev_dir")/README.md"
else
  prev_title="Modul ${prev2}"
  prev_link="#"
fi

if [ -n "$next_dir" ] && [ -f "$next_dir/README.md" ]; then
  next_title=$(sed -n '1p' "$next_dir/README.md" | sed -E 's/^# *//')
  next_link="../$(basename "$next_dir")/README.md"
else
  next_title="Modul ${next2}"
  next_link="#"
fi

# Append footer (avoid duplicate by checking last lines)
if tail -n 20 "$readme" | grep -q "Sebelumnya: \\|Selanjutnya:"; then
  echo "Footer already present in $readme — skipping."
  exit 0
fi

cat >> "$readme" <<EOF

---

**Sebelumnya:** [$prev_title]($prev_link)  
**Selanjutnya:** [$next_title]($next_link)

---
EOF

echo "Footer appended to $readme"