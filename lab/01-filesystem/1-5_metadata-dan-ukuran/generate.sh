#!/bin/bash
# =========================================================
# FILESYSTEM LAB — BELAJAR file / stat / du / df
# =========================================================
# TUJUAN:
# - Bikin project filesystem yang kelihatan kompleks
# - Supaya kamu BISA pakai file, stat, du, df dengan BENAR
# - Kalau setelah ini masih salah pakai df vs du, ya berarti bebal
# =========================================================

set -e

BASE_DIR="/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab"
DATA_DIR="$BASE_DIR/data"
META_DIR="$BASE_DIR/metadata"
LOG_DIR="$BASE_DIR/logs"
BIN_DIR="$BASE_DIR/bin"

echo "[+] Membuat struktur direktori"
mkdir -p "$DATA_DIR/raw" "$DATA_DIR/processed" "$META_DIR/schema" "$META_DIR/stat" "$LOG_DIR" "$BIN_DIR"

echo "[+] Membuat file data mentah"
echo "id,price,volume" > "$DATA_DIR/raw/crypto.csv"
for i in {1..1000}; do
  echo "$i,$RANDOM,$RANDOM" >> "$DATA_DIR/raw/crypto.csv"
done

echo "[+] Membuat file binary palsu"
dd if=/dev/urandom of="$DATA_DIR/raw/random.bin" bs=1K count=512 status=none

echo "[+] Membuat file kosong (edge case)"
touch "$DATA_DIR/raw/empty.txt"

echo "[+] Membuat symlink (biar otakmu kepakai)"
ln -s "$DATA_DIR/raw/crypto.csv" "$DATA_DIR/processed/latest.csv"

echo "[+] Membuat script executable"
cat << 'EOF' > "$BIN_DIR/process.sh"
#!/bin/bash
echo "processing crypto data..."
EOF
chmod +x "$BIN_DIR/process.sh"

echo "[+] Menyimpan metadata menggunakan stat"
stat "$DATA_DIR/raw/crypto.csv" > "$META_DIR/stat/crypto.stat"
stat "$DATA_DIR/raw/random.bin" > "$META_DIR/stat/random.stat"

echo "[+] Menyimpan tipe file menggunakan file"
file "$DATA_DIR/raw/"* > "$META_DIR/schema/file-types.txt"

echo "[+] Simulasi log besar (biar du terasa)"
for i in {1..20}; do
  dd if=/dev/zero of="$LOG_DIR/log_$i.log" bs=1M count=5 status=none
done

echo "[+] SELESAI"
echo
echo "LATIHAN WAJIB (JANGAN DILEWATI):"
echo "1. file $DATA_DIR/raw/*"
echo "2. stat $DATA_DIR/raw/crypto.csv"
echo "3. du -sh $BASE_DIR"
echo "4. du -sh $LOG_DIR"
echo "5. df -h"
echo
echo "Kalau kamu pakai df buat cari folder besar, STOP. Itu salah total."
