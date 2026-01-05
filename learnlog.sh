#!/bin/bash
# =========================================================
# Learning Log System — Strict Mode (LOG wajib diset dulu)
# =========================================================

# ---------------------------------------------------------
# Configuration
# ---------------------------------------------------------
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && __SAFE_LOG_SOURCED=1 || __SAFE_LOG_SOURCED=0

# ---------------------------------------------------------
# Guard: wajib set LOG
# ---------------------------------------------------------
require_log() {
  if [[ -z "$LOG" ]]; then
    echo "❌ ERROR: LOG belum diset."
    echo "➡️  Jalankan terlebih dahulu:"
    echo "    set_log /path/ke/file.log"
    echo ""
    echo "Contoh:"
    echo "    set_log \$HOME/learnlog/filesystem/day1.md"
    return 1
  fi
}

# ---------------------------------------------------------
# Utility
# ---------------------------------------------------------
TS() {
  date '+%Y-%m-%d %H:%M:%S'
}

# ---------------------------------------------------------
# Header helpers
# ---------------------------------------------------------
h1() { require_log || return 1; echo -e "\n# $(TS) - $*" >> "$LOG"; }
h2() { require_log || return 1; echo -e "\n## $(TS) - $*" >> "$LOG"; }
h3() { require_log || return 1; echo -e "\n### $(TS) - $*" >> "$LOG"; }

# ---------------------------------------------------------
# Exercise lifecycle
# ---------------------------------------------------------
exercise() {
  require_log || return 1
  echo -e "\n---\n" >> "$LOG"
  echo "## 📚 $(TS) - Exercise: $*" >> "$LOG"
  echo "" >> "$LOG"
}

objective() {
  require_log || return 1
  echo "**🎯 Objective:** $*" >> "$LOG"
  echo "" >> "$LOG"
}

note() {
  require_log || return 1
  echo "- 📝 $*" >> "$LOG"
}

# ---------------------------------------------------------
# Run command and capture output
# ---------------------------------------------------------
run() {
  require_log || return 1

  echo "**💻 Command:**" >> "$LOG"
  echo '```bash' >> "$LOG"
  echo "$*" >> "$LOG"
  echo '```' >> "$LOG"
  echo "" >> "$LOG"

  echo "**🖥️ Output:**" >> "$LOG"
  echo '```' >> "$LOG"

  local OUTPUT
  OUTPUT=$("$@" 2>&1)
  local RC=$?

  # tampil di terminal
  echo "$OUTPUT"

  # simpan ke log (maks 50 baris)
  if [[ -n "$OUTPUT" ]]; then
    echo "$OUTPUT" | head -n 50 >> "$LOG"
    local LINE_COUNT
    LINE_COUNT=$(echo "$OUTPUT" | wc -l)
    [[ $LINE_COUNT -gt 50 ]] && echo "... (${LINE_COUNT} lines, showing first 50)" >> "$LOG"
  fi

  echo '```' >> "$LOG"

  if [[ $RC -eq 0 ]]; then
    echo "✅ Exit code: 0" >> "$LOG"
  else
    echo "❌ Exit code: $RC" >> "$LOG"
  fi
  echo "" >> "$LOG"

  return $RC
}

# ---------------------------------------------------------
# Code solution
# ---------------------------------------------------------
solution() {
  require_log || return 1
  echo "**💡 Solution:**" >> "$LOG"
  echo '```bash' >> "$LOG"
  cat >> "$LOG"
  echo '```' >> "$LOG"
  echo "" >> "$LOG"
}

# ---------------------------------------------------------
# Learning reflection
# ---------------------------------------------------------
learned() {
  require_log || return 1
  echo "**✨ What I learned:**" >> "$LOG"
  echo "Masukkan poin (ENTER kosong untuk selesai):"
  while IFS= read -r line; do
    [[ -z "$line" ]] && break
    echo "- $line" >> "$LOG"
  done
  echo "" >> "$LOG"
}

# ---------------------------------------------------------
# Status
# ---------------------------------------------------------
completed() {
  require_log || return 1
  echo "**✅ $(TS) - Status:** COMPLETED" >> "$LOG"
  echo "" >> "$LOG"
}
z
failed() {
  require_log || return 1
  echo "**❌ $(TS) - Status:** FAILED" >> "$LOG"
  [[ -n "$*" ]] && echo "**Reason:** $*" >> "$LOG"
  echo "" >> "$LOG"
}

# ---------------------------------------------------------
# Reference
# ---------------------------------------------------------
ref() {
  require_log || return 1
  echo "📖 **Reference:** $*" >> "$LOG"
  echo "" >> "$LOG"
}

# ---------------------------------------------------------
# Summary
# ---------------------------------------------------------
summary() {
  require_log || return 1

  echo -e "\n---\n" >> "$LOG"
  echo "## 📊 $(TS) - Session Summary" >> "$LOG"
  echo "" >> "$LOG"

  local TOTAL=0 COMPLETED=0 FAILED=0

  while IFS= read -r line; do
    [[ "$line" =~ ^##\ 📚 ]] && ((TOTAL++))
    [[ "$line" =~ COMPLETED ]] && ((COMPLETED++))
    [[ "$line" =~ FAILED ]] && ((FAILED++))
  done < "$LOG"

  echo "- **Total exercises:** $TOTAL" >> "$LOG"
  echo "- **Completed:** $COMPLETED" >> "$LOG"
  echo "- **Failed:** $FAILED" >> "$LOG"
  echo "" >> "$LOG"

  echo "📊 Summary: $COMPLETED/$TOTAL completed, $FAILED failed"
}

# ---------------------------------------------------------
# Log initialization
# ---------------------------------------------------------
init_log() {
  local LOG_FILE="$1"
  mkdir -p "$(dirname "$LOG_FILE")"
  echo "# Learning Log" > "$LOG_FILE"
  echo "" >> "$LOG_FILE"
  echo "Started: $(date '+%Y-%m-%d')" >> "$LOG_FILE"
  echo "" >> "$LOG_FILE"
}

# ---------------------------------------------------------
# Set log (WAJIB)
# ---------------------------------------------------------
set_log() {
  if [[ -z "$1" ]]; then
    echo "❌ Error: Masukkan path file log"
    return 1
  fi

  LOG="$1"
  [[ ! -f "$LOG" ]] && init_log "$LOG"
  echo "✅ LOG aktif: $LOG"
}

# ---------------------------------------------------------
# Help
# ---------------------------------------------------------
usage() {
  cat <<EOF
📝 Learning Log System (STRICT)

WAJIB:
  set_log /path/ke/file.log

Contoh:
  set_log \$HOME/learnlog/filesystem/day1.md

Alur yang DISARANKAN:
  exercise "judul exercise"
  context_dir
  objective "tujuan pembelajaran"
  run <command>
  note "catatan tambahan"
  learned
  complete | failed "alasan"
  summary

Fungsi utama:
  exercise   "judul exercise"
  context_dir        # menjelaskan direktori kerja (pwd), TANPA cd
  objective  "tujuan"
  run        <command>
  note       "catatan singkat"
  learned
  completed
  failed     "alasan"
  ref        "referensi"
  summary

Catatan penting:
- Sistem TIDAK menjalankan cd secara otomatis
- Semua command dieksekusi di working directory aktif
- Konteks direktori HARUS dicatat manual dengan context_dir

LOG aktif:
  $LOG
EOF
}

# ---------------------------------------------------------
# Context: Working Directory Explanation
# ---------------------------------------------------------
context_dir() {
  require_log || return 1

  local DIR
  DIR="$(pwd)"

  echo "**📂 Context:**" >> "$LOG"
  echo "" >> "$LOG"
  echo "- Skenario ini dijalankan pada direktori:" >> "$LOG"
  echo "  \`\`\`" >> "$LOG"
  echo "  $DIR" >> "$LOG"
  echo "  \`\`\`" >> "$LOG"
  echo "- Catatan:" >> "$LOG"
  echo "  - Tidak ada perintah \`cd\` yang dijalankan." >> "$LOG"
  echo "  - Semua command menggunakan working directory aktif saat ini." >> "$LOG"
  echo "  - Perubahan direktori **tidak otomatis tercatat** kecuali kamu eksplisit menjalankan \`cd\`." >> "$LOG"
  echo "" >> "$LOG"
}
