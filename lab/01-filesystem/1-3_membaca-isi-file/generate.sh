#!/usr/bin/env bash
# ============================================
# CRYPTO DATA ENGINEERING LAB — PROJECT GENERATOR
# Fokus: latihan membaca file (cat, head, tail, less, more)
# TANPA logika latihan, TANPA ETL, TANPA sok pintar
# ============================================

set -euo pipefail

BASE_DIR="/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project"

# -------- STRUCTURE --------
mkdir -p \
  "$BASE_DIR/data/raw" \
  "$BASE_DIR/data/staging" \
  "$BASE_DIR/data/logs" \
  "$BASE_DIR/docs"

# -------- RAW DATA (SIMULASI YAHOO FINANCE BATCH) --------
cat <<'EOF' > "$BASE_DIR/data/raw/btc_usd.csv"
date,open,high,low,close,volume
2024-01-01,42000,43000,41800,42500,12345

2024-01-02,42500,44000,42000,43800,18200
2024-01-03,43800,45000,43500,44800,21000
EOF

cat <<'EOF' > "$BASE_DIR/data/raw/eth_usd.csv"
date,open,high,low,close,volume
2024-01-01,2200,2250,2150,2230,33000
2024-01-02,2230,2300,2200,2280,41000
EOF

cat <<'EOF' > "$BASE_DIR/data/raw/sol_usd.csv"
date,open,high,low,close,volume
2024-01-01,95,102,93,100,88000
EOF

# -------- STAGING DATA (DUMMY HASIL PIPELINE) --------
cat <<'EOF' > "$BASE_DIR/data/staging/merged_crypto.csv"
asset,date,open,high,low,close,volume
BTC,2024-01-01,42000,43000,41800,42500,12345
BTC,2024-01-02,42500,44000,42000,43800,18200
ETH,2024-01-01,2200,2250,2150,2230,33000
SOL,2024-01-01,95,102,93,100,88000
EOF

# -------- LOG FILES (TARGET tail / less +F) --------
cat <<'EOF' > "$BASE_DIR/data/logs/ingest.log"
[INFO] 2024-01-01 10:00:01 start ingestion
[INFO] reading btc_usd.csv
[INFO] reading eth_usd.csv

[WARN] empty line detected
[INFO] ingestion finished
EOF

cat <<'EOF' > "$BASE_DIR/data/logs/pipeline.log"
[PIPELINE] init
[PIPELINE] extract
[PIPELINE] transform
[PIPELINE] load
[PIPELINE] done
EOF

# -------- DOCS (TARGET cat -A, less, encoding debug) --------
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
EOF

# -------- README --------
cat <<'EOF' > "$BASE_DIR/README.md"
Crypto Data Engineering Lab

Tujuan:
- Latihan membaca file
- Debug data mentah
- Inspect staging output
- Monitor log pipeline

Command target:
cat, head, tail, less, more

JANGAN TAMBAH SCRIPT.
LATIH COMMAND-NYA.
EOF

echo "Project generated: $BASE_DIR"
