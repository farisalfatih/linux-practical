#!/bin/bash
# =====================================================
# CHAOS DATA LAKE GENERATOR — DISCIPLIN VERSION
# =====================================================

set -euo pipefail

BASE_DIR="${BASE_DIR:-$HOMElab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake}"
MODE="${1:-minimal}"
LOG_FILE="/tmp/chaos-data-lake-generator.log"

CRYPTO=(bitcoin ethereum solana cardano)
SOURCES=(binance coinbase kraken)
YEARS=(2022 2023 2024)
MONTHS=(01 02 03 04 05 06)
DAYS=$(seq -w 01 15)

log() { echo "$(date '+%F %T') | $1" | tee -a "$LOG_FILE"; }
safe_mkdir() { mkdir -p "$1"; }
safe_file() { [ -f "$1" ] || echo "$2" > "$1"; }

log "MODE=$MODE"
log "BASE_DIR=$BASE_DIR"
safe_mkdir "$BASE_DIR"

safe_mkdir "$BASE_DIR"/{raw,staging,processed,archive,tmp,error,logs,metadata,external}
safe_mkdir "$BASE_DIR"/logs/{ingestion,etl,validation,consumer}
safe_mkdir "$BASE_DIR"/metadata/{schemas,stats,lineage}

if [[ "$MODE" != "error-only" ]]; then
  for c in "${CRYPTO[@]}"; do
    for s in "${SOURCES[@]}"; do
      for y in "${YEARS[@]}"; do
        for m in "${MONTHS[@]}"; do
          DIR="$BASE_DIR/raw/$c/$s/$y/$m"
          safe_mkdir "$DIR"
          for d in $DAYS; do
            FILE="$DIR/$d.csv"
            [ -f "$FILE" ] || {
              echo "timestamp,open,high,low,close,volume" > "$FILE"
              echo "$(date),100,120,90,110,99999" >> "$FILE"
            }
          done
        done
      done
    done
  done
fi

if [[ "$MODE" == "chaos" ]]; then
  safe_mkdir "$BASE_DIR/staging"/{bitcoin_tmp,ethereum_tmp}
  safe_file "$BASE_DIR/staging/bitcoin_tmp/.IN_PROGRESS" ""
  safe_file "$BASE_DIR/staging/ethereum_tmp/.LOCK" ""
  safe_file "$BASE_DIR/staging/bitcoin_tmp/corrupt_01.csv" "%%%%BROKEN%%%%"
  : > "$BASE_DIR/staging/bitcoin_tmp/empty.csv"
fi

if [[ "$MODE" != "error-only" ]]; then
  for v in v1 v2 v3; do
    DIR="$BASE_DIR/processed/bitcoin/$v/data"
    safe_mkdir "$DIR"
    for i in {1..5}; do
      safe_file "$DIR/btc_clean_$i.csv" "clean,data,$i"
    done
  done
  ln -sfn "$BASE_DIR/processed/bitcoin/v3" "$BASE_DIR/processed/bitcoin/latest"
fi

if [[ "$MODE" == "chaos" || "$MODE" == "error-only" ]]; then
  safe_mkdir "$BASE_DIR/error/permission_denied"
  safe_file "$BASE_DIR/error/permission_denied/secret.csv" "TOP_SECRET"
  chmod 000 "$BASE_DIR/error/permission_denied" || true
fi

if [[ "$MODE" == "chaos" ]]; then
  safe_mkdir "$BASE_DIR/external"/{api_dump,manual_upload}
  dd if=/dev/zero of="$BASE_DIR/tmp/big_dummy_file.bin" bs=1M count=50 2>/dev/null || true
  safe_file "$BASE_DIR/tmp/.temp_hidden" ""
fi

log "DONE"
log "Generator log: $LOG_FILE"