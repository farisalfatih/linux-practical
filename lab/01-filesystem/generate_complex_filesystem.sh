#!/bin/bash

BASE_DIR="/home/faris-al-fatih/linux-practical/lab/01-filesystem/chaos-data-lake"
CRYPTO=("bitcoin" "ethereum" "solana" "cardano")
SOURCES=("binance" "coinbase" "kraken")
YEARS=("2022" "2023" "2024")
MONTHS=("01" "02" "03" "04" "05" "06")
DAYS=$(seq -w 01 15)

echo "🚀 Creating complex filesystem at: $BASE_DIR"
mkdir -p "$BASE_DIR"

# =====================================================
# 1. CORE DATA LAKE STRUCTURE
# =====================================================
mkdir -p \
"$BASE_DIR"/{raw,staging,processed,archive,tmp,error,logs,metadata,external} \
"$BASE_DIR"/logs/{ingestion,etl,validation,consumer} \
"$BASE_DIR"/metadata/{schemas,stats,lineage}

# =====================================================
# 2. RAW DATA (EXTREMELY NESTED)
# =====================================================
for crypto in "${CRYPTO[@]}"; do
  for source in "${SOURCES[@]}"; do
    for year in "${YEARS[@]}"; do
      for month in "${MONTHS[@]}"; do
        mkdir -p "$BASE_DIR/raw/$crypto/$source/$year/$month"
        for day in $DAYS; do
          FILE="$BASE_DIR/raw/$crypto/$source/$year/$month/${day}.csv"
          echo "timestamp,open,high,low,close,volume" > "$FILE"
          echo "$(date),100,120,90,110,99999" >> "$FILE"
        done
      done
    done
  done
done

# =====================================================
# 3. STAGING (TEMP + BROKEN DATA)
# =====================================================
mkdir -p "$BASE_DIR/staging"/{bitcoin_tmp,ethereum_tmp}
touch "$BASE_DIR/staging/bitcoin_tmp/.IN_PROGRESS"
touch "$BASE_DIR/staging/ethereum_tmp/.LOCK"

# Corrupted files
echo "%%%%BROKEN%%%%" > "$BASE_DIR/staging/bitcoin_tmp/corrupt_01.csv"
truncate -s 0 "$BASE_DIR/staging/bitcoin_tmp/empty.csv"

# =====================================================
# 4. PROCESSED DATA (VERSIONED)
# =====================================================
for v in v1 v2 v3; do
  mkdir -p "$BASE_DIR/processed/bitcoin/$v/data"
  for i in {1..5}; do
    echo "clean,data,$i" > "$BASE_DIR/processed/bitcoin/$v/data/btc_clean_$i.csv"
  done
done

# latest symlink
ln -sfn "$BASE_DIR/processed/bitcoin/v3" "$BASE_DIR/processed/bitcoin/latest"

# =====================================================
# 5. ARCHIVE (DATE-BASED SNAPSHOT)
# =====================================================
for year in "${YEARS[@]}"; do
  mkdir -p "$BASE_DIR/archive/$year"
  tar -cf "$BASE_DIR/archive/$year/raw_backup.tar" "$BASE_DIR/raw" 2>/dev/null
done

# =====================================================
# 6. LOGS (SIMULATED PIPELINE ACTIVITY)
# =====================================================
for log in ingestion etl validation consumer; do
  for i in {1..10}; do
    echo "$(date) [$log] step $i OK" >> "$BASE_DIR/logs/$log/${log}.log"
  done
done

# =====================================================
# 7. METADATA
# =====================================================
echo '{ "dataset": "bitcoin", "schema": "OHLCV" }' > "$BASE_DIR/metadata/schemas/bitcoin.json"
echo "row_count=999999" > "$BASE_DIR/metadata/stats/bitcoin.stats"
echo "raw -> staging -> processed" > "$BASE_DIR/metadata/lineage/bitcoin.lineage"

# =====================================================
# 8. EXTERNAL & TMP CHAOS
# =====================================================
mkdir -p "$BASE_DIR/external"/{api_dump,manual_upload}
dd if=/dev/zero of="$BASE_DIR/tmp/big_dummy_file.bin" bs=1M count=50 2>/dev/null
touch "$BASE_DIR/tmp/.temp_hidden"

# =====================================================
# 9. ERROR SCENARIOS
# =====================================================
mkdir -p "$BASE_DIR/error/permission_denied"
touch "$BASE_DIR/error/permission_denied/secret.csv"
chmod 000 "$BASE_DIR/error/permission_denied"

# =====================================================
# DONE
# =====================================================
echo "✅ Complex filesystem generated successfully!"
echo "📂 Root directory: $BASE_DIR"
