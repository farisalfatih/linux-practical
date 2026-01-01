LOG="$HOME/linux-practical/LEARNLOG.md"

TS() {
  date '+%Y-%m-%d %H:%M:%S'
}

h1() { echo "# $1 - $(TS)" >> "$LOG"; }
h2() { echo "## $1 - $(TS)" >> "$LOG"; }
h3() { echo "### $1 - $(TS)" >> "$LOG"; }
h4() { echo "#### $1 - $(TS)" >> "$LOG"; }

create_table() {
    read -p "Jumlah kolom: " col_count
    headers=()
    for (( i=1; i<=col_count; i++ )); do
        read -p "Header kolom ke-$i: " h
        headers+=("$h")
    done

    echo ""
    echo "Masukkan baris data (pisahkan kolom dengan |). Tekan ENTER kosong untuk selesai."
    rows=()
    while true; do
        read -p "> " line
        [[ -z "$line" ]] && break
        rows+=("$line")
    done

    # Hitung panjang tiap kolom (maks dari header & semua baris)
    col_widths=()
    for i in "${!headers[@]}"; do
        col_widths[i]=${#headers[i]}
    done
    for row in "${rows[@]}"; do
        IFS='|' read -ra cols <<< "$row"
        for i in "${!cols[@]}"; do
            if [ ${#cols[i]} -gt ${col_widths[i]} ]; then
                col_widths[i]=${#cols[i]}
            fi
        done
    done

    # Buat header & separator
    header_line="|"
    sep_line="|"
    for i in "${!headers[@]}"; do
        printf -v padded "%-${col_widths[i]}s" "${headers[i]}"
        header_line+="$padded|"
        dashes=$(printf '%*s' "${col_widths[i]}" '' | tr ' ' '-')
        sep_line+="$dashes|"
    done

    # Tulis ke file
    echo "$header_line" >> "$LOG"
    echo "$sep_line" >> "$LOG"
    for row in "${rows[@]}"; do
        IFS='|' read -ra cols <<< "$row"
        line_out="|"
        for i in "${!cols[@]}"; do
            printf -v padded "%-${col_widths[i]}s" "${cols[i]}"
            line_out+="$padded|"
        done
        echo "$line_out" >> "$LOG"
    done

    echo "Tabel berhasil ditambahkan ke $LOG"
}

notes() {
  echo "" >> "$LOG"
  echo "**📝 Notes - $(TS)**" >> "$LOG"

  echo "Masukkan notes (bullet). Ketik ':end' untuk selesai."
  while true; do
    read -p "> " item
    [[ "$item" == ":end" ]] && break
    echo "- $item" >> "$LOG"
  done
}

flows() {
  echo "" >> "$LOG"
  echo "**🔄 Flows - $(TS)**" >> "$LOG"

  echo "Masukkan langkah satu per satu. Ketik ':end' untuk selesai."
  count=1
  while true; do
    read -p "$count> " step
    [[ "$step" == ":end" ]] && break
    echo "$count. $step" >> "$LOG"
    ((count++))
  done
}

objective() {
  echo "**🎯 Objective:** $* - $(TS)" >> "$LOG"
}

context() {
  echo "**📋 Context** - $(TS)" >> "$LOG"
  echo "- User: $(whoami)" >> "$LOG"
  echo "- Dir: $(pwd)" >> "$LOG"
  echo "- Shell: $SHELL" >> "$LOG"
}

expected() {
  echo "**📌 Expected:** $* - $(TS)" >> "$LOG"
}


# Commend complex gunakan: run bash -c
run() {
  echo "**💻 Command** - $(TS)" >> "$LOG"
  echo '```bash' >> "$LOG"
  printf '%q ' "$@" >> "$LOG"
  echo >> "$LOG"
  echo '```' >> "$LOG"

  OUT=$("$@" 2>&1)
  RC=$?

  echo "**🖥️ Output (ringkas)** - $(TS)" >> "$LOG"
  echo '```text' >> "$LOG"
  if [ -z "$OUT" ]; then
    echo "(no output)" >> "$LOG"
  else
    echo "$OUT" | head -n 10 >> "$LOG"
    [ "$(echo "$OUT" | wc -l)" -gt 10 ] && echo "(output dipotong)" >> "$LOG"
  fi
  echo '```' >> "$LOG"

  echo '```text' >> "$LOG"
  if [ "$RC" -eq 0 ]; then
    echo "exit code: $RC ✅" >> "$LOG"
  else
    echo "exit code: $RC ❌" >> "$LOG"
  fi
  echo '```' >> "$LOG"
}

result() {
  local choice

  echo "Pilih hasil eksekusi:"
  echo "1) SUCCESS (tanpa analisis)"
  echo "2) FAILURE (tulis analysis)"
  read -p "> " choice

  case "$choice" in
    1)
      echo "**Status:** SUCCESS - $(TS)" >> "$LOG"
      ;;
    2)
      read -p "Analysis: " msg
      echo "**Analysis:** $msg - $(TS)" >> "$LOG"
      ;;
    *)
      echo "Input ngawur. Pilih 1 atau 2."
      return 1
      ;;
  esac
}

tags() {
  echo "---" >> "$LOG"
  echo "**🏷️ Tags:** $* - $(TS)" >> "$LOG"
  echo "---" >> "$LOG"
}