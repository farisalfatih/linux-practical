#!/usr/bin/env bash
# ============================================
# CRYPTO DATA ENGINEERING LAB — PROJECT GENERATOR (REVAMP)
# Fokus: latihan cat, head, tail, less, more
# Data dibuat cukup BESAR agar relevan
# ============================================

set -euo pipefail

BASE_DIR="/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project"

# -------- STRUCTURE --------
mkdir -p \
  "$BASE_DIR/data/raw" \
  "$BASE_DIR/data/staging" \
  "$BASE_DIR/data/logs" \
  "$BASE_DIR/docs"

# -------- FUNCTION: GENERATE CSV --------
generate_crypto_csv () {
  local file="$1"
  local start_price="$2"

  echo "date,open,high,low,close,volume" > "$file"

  for i in $(seq 1 300); do
    day=$(printf "2024-01-%02d" $(( (i-1)%28 + 1 )))
    open=$((start_price + RANDOM % 500))
    high=$((open + RANDOM % 300))
    low=$((open - RANDOM % 300))
    close=$((low + RANDOM % (high-low+1)))
    volume=$((RANDOM % 90000 + 1000))

    echo "$day,$open,$high,$low,$close,$volume" >> "$file"

    # sengaja sisipkan baris kosong (buat latihan cat -b / -s)
    if (( i % 77 == 0 )); then
      echo "" >> "$file"
    fi
  done
}

# -------- RAW DATA (300 BARIS / FILE) --------
generate_crypto_csv "$BASE_DIR/data/raw/btc_usd.csv" 42000
generate_crypto_csv "$BASE_DIR/data/raw/eth_usd.csv" 2200
generate_crypto_csv "$BASE_DIR/data/raw/sol_usd.csv" 95

# -------- STAGING DATA (GABUNGAN ~900 BARIS) --------
echo "asset,date,open,high,low,close,volume" > "$BASE_DIR/data/staging/merged_crypto.csv"

tail -n +2 "$BASE_DIR/data/raw/btc_usd.csv" | sed 's/^/BTC,/' >> "$BASE_DIR/data/staging/merged_crypto.csv"
tail -n +2 "$BASE_DIR/data/raw/eth_usd.csv" | sed 's/^/ETH,/' >> "$BASE_DIR/data/staging/merged_crypto.csv"
tail -n +2 "$BASE_DIR/data/raw/sol_usd.csv" | sed 's/^/SOL,/' >> "$BASE_DIR/data/staging/merged_crypto.csv"

# -------- LOG FILES (REALISTIS BUAT tail / less +F) --------
for i in $(seq 1 500); do
  case $((RANDOM % 5)) in
    0) level="INFO" ;;
    1) level="INFO" ;;
    2) level="WARN" ;;
    3) level="INFO" ;;
    4) level="ERROR" ;;
  esac
  echo "[$level] 2024-01-01 10:$i ingestion step $i" >> "$BASE_DIR/data/logs/ingest.log"
done

for i in $(seq 1 200); do
  echo "[PIPELINE] step=$i status=ok" >> "$BASE_DIR/data/logs/pipeline.log"
done

# -------- DOCS (TARGET cat -A, hidden char) --------
cat <<'EOF' > "$BASE_DIR/docs/schema.txt"
TABLE: crypto_price

- asset   : STRING
- date    : DATE
- open    : FLOAT
- high    : FLOAT
- low     : FLOAT
- close   : FLOAT
- volume  : BIGINT


NOTE:
Delimiter is comma
Hidden tab here -> 	
Trailing space here ->     
EOF

# -------- README --------
cat <<'EOF' > "$BASE_DIR/README.md"
Crypto Data Engineering Lab

Tujuan:
- Latihan membaca file kecil vs besar
- Bedakan kapan pakai cat, head, tail, less, more
- Inspect data mentah, staging, dan log

Larangan:
- Jangan bikin script tambahan
- Jangan edit data

Fokus:
- command line skill
- observasi, bukan coding
EOF

echo "Project generated successfully at:"
echo "$BASE_DIR"
