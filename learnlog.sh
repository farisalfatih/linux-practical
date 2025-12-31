LOG="$HOME/linux-practical/LEARNLOG.md"

TS() {
  date '+%Y-%m-%d %H:%M:%S'
}

sep() {
  echo -e "---" >> "$LOG"
}

h1() { echo "# $1 - $(TS)" >> "$LOG"; }
h2() { echo "## $1 - $(TS)" >> "$LOG"; }
h3() { echo "### $1 - $(TS)" >> "$LOG"; }
h4() { echo "#### $1 - $(TS)" >> "$LOG"; }

objective() {
  echo "**Objective** - $(TS)" >> "$LOG"
  for o in "$@"; do echo "- $o" >> "$LOG"; done
}

context() {
  echo "**Context** - $(TS)" >> "$LOG"
  echo "- User: $(whoami)" >> "$LOG"
  echo "- Dir: $(pwd)" >> "$LOG"
  echo "- Shell: $SHELL" >> "$LOG"
}

expected() {
  echo "**Expected** - $(TS)" >> "$LOG"
  for e in "$@"; do echo "- $e" >> "$LOG"; done
}

run() {
  echo "**Command** - $(TS)" >> "$LOG"
  echo '```bash' >> "$LOG"
  echo "$*" >> "$LOG"
  echo '```' >> "$LOG"

  # Eksekusi
  OUT=$(eval "$*" 2>&1)
  RC=$?

  echo "**Output (ringkas)** - $(TS)" >> "$LOG"
  echo '```text' >> "$LOG"
  if [ -z "$OUT" ]; then
    echo "(no output)" >> "$LOG"
  else
    echo "$OUT" | head -n 10 >> "$LOG"
    [ "$(echo "$OUT" | wc -l)" -gt 10 ] && echo "(output dipotong)" >> "$LOG"
  fi
  echo '```' >> "$LOG"
}

actual() {
  echo "**Actual** - $(TS)" >> "$LOG"
  if [ "$LAST_RC" -eq 0 ]; then
    echo "- Hasil sesuai eksekusi (exit code 0)" >> "$LOG"
  else
    echo "- Eksekusi gagal (exit code $LAST_RC)" >> "$LOG"
  fi
}

error() {
  echo "**Error / Mistake** - $(TS)" >> "$LOG"
  for e in "$@"; do echo "- $e" >> "$LOG"; done
}

insight() {
  echo "**Insight** - $(TS)" >> "$LOG"
  for i in "$@"; do echo "- $i" >> "$LOG"; done
}

tags() {
  echo "**Tags**: $*" >> "$LOG"
}

enter() {
  echo -e "\n" >> "$LOG"
}