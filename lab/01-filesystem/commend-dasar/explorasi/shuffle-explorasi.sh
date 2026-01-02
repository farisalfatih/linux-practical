#!/bin/bash

echo "=== Shuffling project structure for ls exploration ==="

# 1. Buat struktur direktori bertingkat
# Kenapa: agar latihan 'ls -R' relevan, Data Engineer sering bekerja dengan nested folder
mkdir -p data/{raw,processed,temp}
mkdir -p logs/{2023,2024}
mkdir -p src/{api,model,utils}
mkdir -p .config .cache  # hidden dirs, untuk ls -a

# 2. Buat file dengan ukuran berbeda
# Kenapa: agar latihan 'ls -h', 'ls -S', 'ls -lhS' relevan (besar, kecil, sedang)
dd if=/dev/zero of=data/raw/big_data.csv bs=1M count=5 &>/dev/null
dd if=/dev/zero of=data/raw/small_data.csv bs=1K count=20 &>/dev/null
dd if=/dev/zero of=logs/2024/app.log bs=512K count=2 &>/dev/null
dd if=/dev/zero of=src/model/model.bin bs=2M count=1 &>/dev/null

# 3. File teks biasa
# Kenapa: agar 'ls -l' menampilkan permission, owner, size, timestamp
touch README.md
touch src/api/server.py
touch src/utils/helpers.py
touch data/processed/result.json

# 4. File tersembunyi
# Kenapa: agar 'ls -a' relevan, banyak file config/project biasanya hidden
touch .env .gitignore .config/settings.yml .cache/tmp.cache

# 5. Acak timestamp
# Kenapa: agar 'ls -t' dan 'ls -lt' masuk akal untuk analisis file terbaru
touch -t 202401011200 README.md
touch -t 202312251030 data/raw/big_data.csv
touch -t 202402151845 logs/2024/app.log
touch -t 202311101000 src/api/server.py
touch -t 202305050505 .env

# 6. Permission acak
# Kenapa: agar 'ls -l' dan 'ls -n' punya variasi, mirip real project
chmod 777 src/api/server.py
chmod 644 README.md
chmod 600 .env
chmod 755 src/model

# 7. Symbolic link
# Kenapa: agar 'ls --color=auto' menunjukkan link dan membedakan jenis file
ln -s data/raw latest_raw_data

# 8. Banyak file kecil
# Kenapa: agar 'ls -1' dan pipe ke command lain (wc, grep) masuk akal
for i in {1..15}; do
  echo "log line $i" > logs/2023/log_$i.txt
done

echo "=== Project shuffled successfully ==="
