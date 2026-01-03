#!/bin/bash
# Learning Log System - Simplified for Practice

# Configuration - Ubah ini sesuai topik yang sedang dipelajari
LOG="/home/faris-al-fatih/linux-practical/logs/01-filesystem/commad-dasar/explorasi.md"

# Utility functions
TS() {
  date '+%Y-%m-%d %H:%M:%S'
}

# Header functions
h1() { echo -e "\n# $(TS) - $*" >> "$LOG"; }
h2() { echo -e "\n## $(TS) - $*" >> "$LOG"; }
h3() { echo -e "\n### $(TS) - $*" >> "$LOG"; }

# Start new exercise/case
exercise() {
  echo -e "\n---\n" >> "$LOG"
  echo "## 📚 $(TS) - Exercise: $*" >> "$LOG"
  echo "" >> "$LOG"
}

# Define objective
objective() {
  echo "**🎯 Objective:** $*" >> "$LOG"
  echo "" >> "$LOG"
}

# Quick notes (simple bullets)
note() {
  echo "- 📝 $*" >> "$LOG"
}

# Run command and capture output
run() {
  echo "**💻 Command:**" >> "$LOG"
  echo '```bash' >> "$LOG"
  echo "$*" >> "$LOG"
  echo '```' >> "$LOG"
  
  echo "" >> "$LOG"
  echo "**🖥️ Output:**" >> "$LOG"
  echo '```' >> "$LOG"
  
  # Execute and capture (show in terminal + save to file)
  local OUTPUT
  OUTPUT=$("$@" 2>&1)
  local RC=$?
  
  # Show output in terminal
  echo "$OUTPUT"
  
  # Save to log (limit to 50 lines for efficiency)
  if [[ -n "$OUTPUT" ]]; then
    echo "$OUTPUT" | head -n 50 >> "$LOG"
    local LINE_COUNT=$(echo "$OUTPUT" | wc -l)
    [[ $LINE_COUNT -gt 50 ]] && echo "... (${LINE_COUNT} lines, showing first 50)" >> "$LOG"
  fi
  
  echo '```' >> "$LOG"
  
  # Show exit code
  if [[ $RC -eq 0 ]]; then
    echo "✅ Exit code: 0" >> "$LOG"
  else
    echo "❌ Exit code: $RC" >> "$LOG"
  fi
  echo "" >> "$LOG"
  
  return $RC
}

# Code solution/snippet
solution() {
  echo "**💡 Solution:**" >> "$LOG"
  echo '```bash' >> "$LOG"
  cat >> "$LOG"  # Read from stdin until Ctrl+D
  echo '```' >> "$LOG"
  echo "" >> "$LOG"
}

# Learning points
learned() {
  echo "**✨ What I learned:**" >> "$LOG"
  echo "Masukkan poin-poin pembelajaran (tekan ENTER kosong untuk selesai):"
  while IFS= read -r line; do
    [[ -z "$line" ]] && break
    echo "- $line" >> "$LOG"
  done
  echo "" >> "$LOG"
}

# Mark as completed
complete() {
  echo "**✅ $(TS) - Status:** COMPLETED" >> "$LOG"
  echo "" >> "$LOG"
}

# Mark as failed with reason
failed() {
  echo "**❌ $(TS) - Status:** FAILED" >> "$LOG"
  [[ -n "$*" ]] && echo "**Reason:** $*" >> "$LOG"
  echo "" >> "$LOG"
}

# Quick reference link
ref() {
  echo "📖 **Reference:** $*" >> "$LOG"
  echo "" >> "$LOG"
}

# Session summary
summary() {
  echo -e "\n---\n" >> "$LOG"
  echo "## 📊 $(TS) - Session Summary" >> "$LOG"
  echo "" >> "$LOG"
  
  # Check if log file exists
  [[ ! -f "$LOG" ]] && { echo "Log file not found"; return 1; }
  
  # Count exercises (single pass for efficiency)
  local TOTAL=0 COMPLETED=0 FAILED=0
  
  while IFS= read -r line; do
    [[ "$line" =~ ^##\ 📚 ]] && ((TOTAL++))
    [[ "$line" =~ ✅.*COMPLETED ]] && ((COMPLETED++))
    [[ "$line" =~ ❌.*FAILED ]] && ((FAILED++))
  done < "$LOG"
  
  echo "- **Total exercises:** $TOTAL" >> "$LOG"
  echo "- **Completed:** $COMPLETED" >> "$LOG"
  echo "- **Failed:** $FAILED" >> "$LOG"
  echo "" >> "$LOG"
  
  # Show summary in terminal too
  echo "📊 Session Summary: $COMPLETED/$TOTAL completed, $FAILED failed"
}

# Help/Usage
usage() {
  cat <<EOF
📝 Learning Log Functions:

Structure:
  exercise "title"       - Start new exercise
  objective "goal"       - Set exercise goal
  
Execution:
  run "command"          - Run command and log output
  note "text"            - Quick note
  
Code:
  solution << 'EOF'      - Add multi-line code solution
  ... code ...
  EOF
  
Results:
  learned                - What you learned (interactive)
  complete               - Mark as completed
  failed "reason"        - Mark as failed
  
Organization:
  h1/h2/h3 "heading"     - Headers
  ref "link/note"        - Reference
  summary                - End session summary

Current log: $LOG
EOF
}
