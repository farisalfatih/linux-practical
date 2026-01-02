LOG="/home/faris-al-fatih/linux-practical/LEARNLOG.md"

TS() {
  date '+%Y-%m-%d %H:%M:%S'
}

h1() { echo "# $(TS) - $1" >> "$LOG"; }
h2() { echo "## $(TS) - $1" >> "$LOG"; }
h3() { echo "### $(TS) - $1" >> "$LOG"; }
h4() { echo "#### $(TS) - $1" >> "$LOG"; }

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
  echo "**📝 $(TS) - Notes**" >> "$LOG"

  echo "Masukkan notes (bullet). Tekan ENTER kosong untuk selesai."
  while true; do
    read -p "> " item
    [[ -z "$item" ]] && break   
    echo "- $item" >> "$LOG"
  done
}

flows() {
  echo "" >> "$LOG"
  echo "**🔄 $(TS) - Flows**" >> "$LOG"

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
  echo "**🎯 $(TS) - Objective:** $*" >> "$LOG"
}

context() {
  echo "**📋 $(TS) - Context**" >> "$LOG"
  echo "- User: $(whoami)" >> "$LOG"
  echo "- Dir: $(pwd)" >> "$LOG"
  echo "- Shell: $SHELL" >> "$LOG"
  echo "- Tree:" >> "$LOG"
  echo '```text' >> "$LOG"
  tree >> "$LOG"
  echo '```' >> "$LOG"
}

expected() {
  echo "**📌 $(TS) - Expected:** $*" >> "$LOG"
}


# Commend complex gunakan: run bash -c
run() {
  echo "**💻 $(TS) - Command**" >> "$LOG"
  echo '```bash' >> "$LOG"
  printf '%q ' "$@" >> "$LOG"
  echo >> "$LOG"
  echo '```' >> "$LOG"

  OUT=$("$@" 2>&1)
  RC=$?

  # Tampilkan output hanya jika ada
  if [ -n "$OUT" ]; then
    echo "**🖥️ $(TS) - Output (ringkas)**" >> "$LOG"
    echo '```text' >> "$LOG"
    echo "$OUT" | head -n 10 >> "$LOG"
    [ "$(echo "$OUT" | wc -l)" -gt 10 ] && echo "(output dipotong)" >> "$LOG"
    echo '```' >> "$LOG"
  fi

  # Tampilkan exit code hanya jika RC != 0
  if [ "$RC" -ne 0 ]; then
    echo '```text' >> "$LOG"
    echo "exit code: $RC ❌" >> "$LOG"
    echo '```' >> "$LOG"
  fi
}

result() {
  local choice

  echo "Pilih hasil eksekusi:"
  echo "1) SUCCESS (tanpa analisis)"
  echo "2) FAILURE (tulis analysis)"
  read -p "> " choice

  case "$choice" in
    1)
      echo "**$(TS) - Status:** SUCCESS" >> "$LOG"
      ;;
    2)
      read -p "Analysis: " msg
      echo "**$(TS) - Analysis:** $msg" >> "$LOG"
      ;;
    *)
      echo "Input ngawur. Pilih 1 atau 2."
      return 1
      ;;
  esac
}

tags() {
  echo "---" >> "$LOG"
  echo "**🏷️ $(TS) - Tags:** $*" >> "$LOG"
  echo "---" >> "$LOG"
}

command-usage() {
  cat >> "$LOG" <<HTML
<div style="background-color:#1e1e1e; color:#ffffff; padding:10px; border-radius:12px; max-width:700px; margin:auto; font-family:monospace; line-height:1.5; box-shadow:0 4px 12px rgba(0,0,0,0.5);">
  <h3 style="padding:5px; margin:0;color:#569cd6; text-align:center; margin-bottom:15px;">Command Usage</h3>
  <div style="background-color:#2d2d2d; color:#dcdcaa; border-radius:8px; font-size:16px; white-space:pre-wrap; padding:10px;">
HTML

  # masukkan setiap baris $* ke box
  while IFS= read -r line; do
    echo "    $line" >> "$LOG"
  done <<< "$*"

  cat >> "$LOG" <<HTML
  </div>
</div>
HTML
  echo -e "\n" >> "$LOG"
}

add_markdown_link() {
    echo "Masukkan NAMA link (contoh: LATIHAN NAVIGASI FILESYSTEM):"
    read -r LINK_NAME

    echo "Masukkan PATH tujuan (contoh: 01-filesystem/commad-dasar/navigasi.md):"
    read -r LINK_PATH

    MARKDOWN_LINK="👉 **[📂 ${LINK_NAME}](${LINK_PATH})**"

    echo "" >> "$LOG"
    echo "$MARKDOWN_LINK" >> "$LOG"

    echo "✔ Link berhasil ditambahkan ke $LOG"
}