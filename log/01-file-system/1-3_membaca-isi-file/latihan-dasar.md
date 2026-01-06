# Learning Log

Started: 2026-01-06


**💻 Command:**
```bash
tree -h
```

**🖥️ Output:**
```
[4.0K]  .
├── [ 281]  README.md
├── [4.0K]  data
│   ├── [4.0K]  logs
│   │   ├── [ 22K]  ingest.log
│   │   └── [5.8K]  pipeline.log
│   ├── [4.0K]  raw
│   │   ├── [ 12K]  btc_usd.csv
│   │   ├── [ 11K]  eth_usd.csv
│   │   └── [9.6K]  sol_usd.csv
│   └── [4.0K]  staging
│       └── [ 36K]  merged_crypto.csv
└── [4.0K]  docs
    └── [ 224]  schema.txt

6 directories, 8 files
```
✅ Exit code: 0


---

## 📚 2026-01-06 12:47:10 - Exercise: cat (concatenate & print)

**📂 Context:**

- Skenario ini dijalankan pada direktori:
  ```
  /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project
  ```
- Catatan:
  - Tidak ada perintah `cd` yang dijalankan.
  - Semua command menggunakan working directory aktif saat ini.
  - Perubahan direktori **tidak otomatis tercatat** kecuali kamu eksplisit menjalankan `cd`.

**🎯 Objective:** mengetahui kapan cat cocok digunakan untuk melihat file, dan mengetahui opsi apa saja yang ada dalam cat yang sering digunakan

**💻 Command:**
```bash
cat README.md
```

**🖥️ Output:**
```
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
```
✅ Exit code: 0

**💻 Command:**
```bash
cat -n
```

**🖥️ Output:**
```
**❌ 2026-01-06 13:38:01 - Status:** FAILED
**Reason:** lupa filenya

**💻 Command:**
```bash
cat -n README.md
```

**🖥️ Output:**
```
     1	Crypto Data Engineering Lab
     2	
     3	Tujuan:
     4	- Latihan membaca file kecil vs besar
     5	- Bedakan kapan pakai cat, head, tail, less, more
     6	- Inspect data mentah, staging, dan log
     7	
     8	Larangan:
     9	- Jangan bikin script tambahan
    10	- Jangan edit data
    11	
    12	Fokus:
    13	- command line skill
    14	- observasi, bukan coding
```
✅ Exit code: 0

- 📝 opsi n digunakan untuk menambahkan nomor kedalam setiap baris termasuk baris yang kosong
**💻 Command:**
```bash
cat -b
```

**🖥️ Output:**
```
**❌ 2026-01-06 13:39:27 - Status:** FAILED
**Reason:** lupa filenya

**💻 Command:**
```bash
cat -b README.md
```

**🖥️ Output:**
```
     1	Crypto Data Engineering Lab

     2	Tujuan:
     3	- Latihan membaca file kecil vs besar
     4	- Bedakan kapan pakai cat, head, tail, less, more
     5	- Inspect data mentah, staging, dan log

     6	Larangan:
     7	- Jangan bikin script tambahan
     8	- Jangan edit data

     9	Fokus:
    10	- command line skill
    11	- observasi, bukan coding
```
✅ Exit code: 0

- 📝 obsi -b digunakan untuk memberikan nomor ke baris yang ada isinya
**💻 Command:**
```bash
cat -s README.md
```

**🖥️ Output:**
```
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
```
✅ Exit code: 0

- 📝 opsi -s digunakan untuk meringkas baris kosong yang banyak menjadi 1 baris
**💻 Command:**
```bash
cat -A../generate.sh
```

**🖥️ Output:**
```
cat: invalid option -- '.'
Try 'cat --help' for more information.
```
❌ Exit code: 1

**❌ 2026-01-06 13:52:43 - Status:** FAILED
**Reason:** typo supa spasi

**💻 Command:**
```bash
cat -A.. /generate.sh
```

**🖥️ Output:**
```
cat: invalid option -- '.'
Try 'cat --help' for more information.
```
❌ Exit code: 1

**❌ 2026-01-06 13:53:26 - Status:** FAILED
**Reason:** typo salah spasi

**💻 Command:**
```bash
cat -A ../generate.sh
```

**🖥️ Output:**
```
#!/usr/bin/env bash$
# ============================================$
# CRYPTO DATA ENGINEERING LAB M-bM-^@M-^T PROJECT GENERATOR (REVAMP)$
# Fokus: latihan cat, head, tail, less, more$
# Data dibuat cukup BESAR agar relevan$
# ============================================$
$
set -euo pipefail$
$
BASE_DIR="/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project"$
$
# -------- STRUCTURE --------$
mkdir -p \$
  "$BASE_DIR/data/raw" \$
  "$BASE_DIR/data/staging" \$
  "$BASE_DIR/data/logs" \$
  "$BASE_DIR/docs"$
$
# -------- FUNCTION: GENERATE CSV --------$
generate_crypto_csv () {$
  local file="$1"$
  local start_price="$2"$
$
  echo "date,open,high,low,close,volume" > "$file"$
$
  for i in $(seq 1 300); do$
    day=$(printf "2024-01-%02d" $(( (i-1)%28 + 1 )))$
    open=$((start_price + RANDOM % 500))$
    high=$((open + RANDOM % 300))$
    low=$((open - RANDOM % 300))$
    close=$((low + RANDOM % (high-low+1)))$
    volume=$((RANDOM % 90000 + 1000))$
$
    echo "$day,$open,$high,$low,$close,$volume" >> "$file"$
$
    # sengaja sisipkan baris kosong (buat latihan cat -b / -s)$
    if (( i % 77 == 0 )); then$
      echo "" >> "$file"$
    fi$
  done$
}$
$
# -------- RAW DATA (300 BARIS / FILE) --------$
generate_crypto_csv "$BASE_DIR/data/raw/btc_usd.csv" 42000$
generate_crypto_csv "$BASE_DIR/data/raw/eth_usd.csv" 2200$
generate_crypto_csv "$BASE_DIR/data/raw/sol_usd.csv" 95$
$
# -------- STAGING DATA (GABUNGAN ~900 BARIS) --------$
echo "asset,date,open,high,low,close,volume" > "$BASE_DIR/data/staging/merged_crypto.csv"$
$
... (109 lines, showing first 50)
```
✅ Exit code: 0

- 📝 nantinya opsi -A(show all) ini yang nantinya akan sering digunakan di debuging, saya menambahkan karakter yang biasanya sering digunakan di README.md
**✨ What I learned:**
- cat digunakan untuk tampilan jika file adalah file kecil agar tidak memberatkan ram
- jika ingin debuging menggunakan cat gunakan konsep strem dengan mengirimkan output sedikit demi sedikit ke file (ini nanti akan dipelajari spada bab wildcard dan globling)
- cat juga biasanya digunakan untuk menggabungkan file
- opsi karakter yang biasanya ada saat debuging sebagai data engenering dengan opsi -A sudah saya taruh di README.md


---

## 📚 2026-01-06 14:01:17 - Exercise: head (lihat awal file)

**📂 Context:**

- Skenario ini dijalankan pada direktori:
  ```
  /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project
  ```
- Catatan:
  - Tidak ada perintah `cd` yang dijalankan.
  - Semua command menggunakan working directory aktif saat ini.
  - Perubahan direktori **tidak otomatis tercatat** kecuali kamu eksplisit menjalankan `cd`.

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── README.md
├── data
│   ├── logs
│   │   ├── ingest.log
│   │   └── pipeline.log
│   ├── raw
│   │   ├── btc_usd.csv
│   │   ├── eth_usd.csv
│   │   └── sol_usd.csv
│   └── staging
│       └── merged_crypto.csv
└── docs
    └── schema.txt

6 directories, 8 files
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -h
```

**🖥️ Output:**
```
[4.0K]  .
├── [ 281]  README.md
├── [4.0K]  data
│   ├── [4.0K]  logs
│   │   ├── [ 22K]  ingest.log
│   │   └── [5.8K]  pipeline.log
│   ├── [4.0K]  raw
│   │   ├── [ 12K]  btc_usd.csv
│   │   ├── [ 11K]  eth_usd.csv
│   │   └── [9.6K]  sol_usd.csv
│   └── [4.0K]  staging
│       └── [ 36K]  merged_crypto.csv
└── [4.0K]  docs
    └── [ 224]  schema.txt

6 directories, 8 files
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project/data/logs
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── ingest.log
└── pipeline.log

1 directory, 2 files
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -h
```

**🖥️ Output:**
```
[4.0K]  .
├── [ 22K]  ingest.log
└── [5.8K]  pipeline.log

1 directory, 2 files
```
✅ Exit code: 0

**📂 Context:**

- Skenario ini dijalankan pada direktori:
  ```
  /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project/data/logs
  ```
- Catatan:
  - Tidak ada perintah `cd` yang dijalankan.
  - Semua command menggunakan working directory aktif saat ini.
  - Perubahan direktori **tidak otomatis tercatat** kecuali kamu eksplisit menjalankan `cd`.

**💻 Command:**
```bash
head ingest.log
```

**🖥️ Output:**
```
[INFO] 2024-01-01 10:00:01 start ingestion
[INFO] reading btc_usd.csv
[INFO] reading eth_usd.csv

[WARN] empty line detected
[INFO] ingestion finished
[INFO] 2024-01-01 10:1 ingestion step 1
[ERROR] 2024-01-01 10:2 ingestion step 2
[INFO] 2024-01-01 10:3 ingestion step 3
[INFO] 2024-01-01 10:4 ingestion step 4
```
✅ Exit code: 0

**💻 Command:**
```bash
head -n 10 ingest.log
```

**🖥️ Output:**
```
[INFO] 2024-01-01 10:00:01 start ingestion
[INFO] reading btc_usd.csv
[INFO] reading eth_usd.csv

[WARN] empty line detected
[INFO] ingestion finished
[INFO] 2024-01-01 10:1 ingestion step 1
[ERROR] 2024-01-01 10:2 ingestion step 2
[INFO] 2024-01-01 10:3 ingestion step 3
[INFO] 2024-01-01 10:4 ingestion step 4
```
✅ Exit code: 0

- 📝 opsi -n akan menampilkan jumlah baris pertama yang diminta
**💻 Command:**
```bash
head -c 100 ingest.log
```

**🖥️ Output:**
```
[INFO] 2024-01-01 10:00:01 start ingestion
[INFO] reading btc_usd.csv
[INFO] reading eth_usd.csv

[W
```
✅ Exit code: 0

- 📝 fungsi head -c menampilkan sejumlah byte pertama dari file untuk preview cek encoding bom atau sampling data, catatan untuk bab selanjutnya fokus belajar preview file biner cek magic number bom dan kombinasi dengan cat od xxd untuk debug data
**💻 Command:**
```bash
head -q ingest.log
```

**🖥️ Output:**
```
[INFO] 2024-01-01 10:00:01 start ingestion
[INFO] reading btc_usd.csv
[INFO] reading eth_usd.csv

[WARN] empty line detected
[INFO] ingestion finished
[INFO] 2024-01-01 10:1 ingestion step 1
[ERROR] 2024-01-01 10:2 ingestion step 2
[INFO] 2024-01-01 10:3 ingestion step 3
[INFO] 2024-01-01 10:4 ingestion step 4
```
✅ Exit code: 0

**📂 Context:**

- Skenario ini dijalankan pada direktori:
  ```
  /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project/data/raw
  ```
- Catatan:
  - Tidak ada perintah `cd` yang dijalankan.
  - Semua command menggunakan working directory aktif saat ini.
  - Perubahan direktori **tidak otomatis tercatat** kecuali kamu eksplisit menjalankan `cd`.

**💻 Command:**
```bash
tree -h
```

**🖥️ Output:**
```
[4.0K]  .
├── [ 12K]  btc_usd.csv
├── [ 11K]  eth_usd.csv
└── [9.6K]  sol_usd.csv

1 directory, 3 files
```
✅ Exit code: 0

**💻 Command:**
```bash
head -q btc_usd.csv eth_usd.csv
```

**🖥️ Output:**
```
date,open,high,low,close,volume
2024-01-01,42351,42515,42323,42498,32509
2024-01-02,42095,42217,41976,41984,20691
2024-01-03,42191,42217,42113,42193,13994
2024-01-04,42199,42445,42076,42165,28015
2024-01-05,42091,42321,41822,41846,2271
2024-01-06,42355,42625,42296,42362,9325
2024-01-07,42073,42303,41891,42281,5076
2024-01-08,42254,42257,42223,42236,5989
2024-01-09,42350,42549,42109,42298,33654
date,open,high,low,close,volume
2024-01-01,2605,2738,2597,2646,22955
2024-01-02,2475,2768,2292,2687,17575
2024-01-03,2525,2742,2488,2683,12202
2024-01-04,2495,2614,2436,2521,4118
2024-01-05,2672,2691,2545,2625,28422
2024-01-06,2408,2521,2114,2444,10193
2024-01-07,2365,2563,2216,2404,2799
2024-01-08,2287,2529,2127,2427,10242
2024-01-09,2327,2612,2211,2582,7246
```
✅ Exit code: 0

- 📝 opsi -q digunakan untuk supaya nama file tidak dicetak, baik untuk pipline yang rapi gabungkan dengan >> atau >
**✨ What I learned:**
- opsi head digunakan untuk cek kondisi awal sebuah data ada kolom apa saja
- opsi head juga bisa digunakan untuk membuat laporan kondisi data dengan -q agar rapi dan memasukannya kedalam target file 
- untuk penggunaan opsi -c saya belum begitu paham apa yang digunakan disitu sebagai data engenering


---

## 📚 2026-01-06 14:42:51 - Exercise: tail (lihat akhir file)

**🎯 Objective:** mengetahui kapan waktu penggunaan tail dan opsi apa yang digunakan

**📂 Context:**

- Skenario ini dijalankan pada direktori:
  ```
  /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project/data/logs
  ```
- Catatan:
  - Tidak ada perintah `cd` yang dijalankan.
  - Semua command menggunakan working directory aktif saat ini.
  - Perubahan direktori **tidak otomatis tercatat** kecuali kamu eksplisit menjalankan `cd`.

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── ingest.log
└── pipeline.log

1 directory, 2 files
```
✅ Exit code: 0

**💻 Command:**
```bash
tail ingest.log
```

**🖥️ Output:**
```
[INFO] 2024-01-01 10:491 ingestion step 491
[ERROR] 2024-01-01 10:492 ingestion step 492
[WARN] 2024-01-01 10:493 ingestion step 493
[WARN] 2024-01-01 10:494 ingestion step 494
[ERROR] 2024-01-01 10:495 ingestion step 495
[ERROR] 2024-01-01 10:496 ingestion step 496
[INFO] 2024-01-01 10:497 ingestion step 497
[INFO] 2024-01-01 10:498 ingestion step 498
[WARN] 2024-01-01 10:499 ingestion step 499
[ERROR] 2024-01-01 10:500 ingestion step 500
```
✅ Exit code: 0

- 📝 tail dapat digunakan untuk melihat error yang tercatat di log, pada kasus ini jika sistem chaos akan dapat melihat errornya apakah dari ingest/data masuk atau dari pipline/proccesnya
**💻 Command:**
```bash
tail -n ingest.log
```

**🖥️ Output:**
```
tail: invalid number of lines: ‘ingest.log’
```
❌ Exit code: 1

**💻 Command:**
```bash
tail -n 20 ingest.log
```

**🖥️ Output:**
```
[WARN] 2024-01-01 10:481 ingestion step 481
[WARN] 2024-01-01 10:482 ingestion step 482
[WARN] 2024-01-01 10:483 ingestion step 483
[WARN] 2024-01-01 10:484 ingestion step 484
[WARN] 2024-01-01 10:485 ingestion step 485
[ERROR] 2024-01-01 10:486 ingestion step 486
[INFO] 2024-01-01 10:487 ingestion step 487
[INFO] 2024-01-01 10:488 ingestion step 488
[WARN] 2024-01-01 10:489 ingestion step 489
[WARN] 2024-01-01 10:490 ingestion step 490
[INFO] 2024-01-01 10:491 ingestion step 491
[ERROR] 2024-01-01 10:492 ingestion step 492
[WARN] 2024-01-01 10:493 ingestion step 493
[WARN] 2024-01-01 10:494 ingestion step 494
[ERROR] 2024-01-01 10:495 ingestion step 495
[ERROR] 2024-01-01 10:496 ingestion step 496
[INFO] 2024-01-01 10:497 ingestion step 497
[INFO] 2024-01-01 10:498 ingestion step 498
[WARN] 2024-01-01 10:499 ingestion step 499
[ERROR] 2024-01-01 10:500 ingestion step 500
```
✅ Exit code: 0

- 📝 opsi n digunakan untuk menampilkan baris ke n pada file berfungsi untuk melihat baris agak panjang misal jika tail standar tidak mencukupi
**💻 Command:**
```bash
wc -l ingest.log
```

**🖥️ Output:**
```
506 ingest.log
```
✅ Exit code: 0

**💻 Command:**
```bash
tail -n +484
```

**🖥️ Output:**
```
**❌ 2026-01-06 15:09:05 - Status:** FAILED
**Reason:** lupa panggil file

**💻 Command:**
```bash
tail -n +484 ingest.log
```

**🖥️ Output:**
```
[INFO] 2024-01-01 10:478 ingestion step 478
[ERROR] 2024-01-01 10:479 ingestion step 479
[INFO] 2024-01-01 10:480 ingestion step 480
[WARN] 2024-01-01 10:481 ingestion step 481
[WARN] 2024-01-01 10:482 ingestion step 482
[WARN] 2024-01-01 10:483 ingestion step 483
[WARN] 2024-01-01 10:484 ingestion step 484
[WARN] 2024-01-01 10:485 ingestion step 485
[ERROR] 2024-01-01 10:486 ingestion step 486
[INFO] 2024-01-01 10:487 ingestion step 487
[INFO] 2024-01-01 10:488 ingestion step 488
[WARN] 2024-01-01 10:489 ingestion step 489
[WARN] 2024-01-01 10:490 ingestion step 490
[INFO] 2024-01-01 10:491 ingestion step 491
[ERROR] 2024-01-01 10:492 ingestion step 492
[WARN] 2024-01-01 10:493 ingestion step 493
[WARN] 2024-01-01 10:494 ingestion step 494
[ERROR] 2024-01-01 10:495 ingestion step 495
[ERROR] 2024-01-01 10:496 ingestion step 496
[INFO] 2024-01-01 10:497 ingestion step 497
[INFO] 2024-01-01 10:498 ingestion step 498
[WARN] 2024-01-01 10:499 ingestion step 499
[ERROR] 2024-01-01 10:500 ingestion step 500
```
✅ Exit code: 0

- 📝 opsi -n +N digunakan untuk melihat barus akhir mulai dari ke baris ke berapa, berguna jika opsi tail -n biasa terasa tidak cukup
**💻 Command:**
```bash
tail -n 15 -f ingest.log
```

**🖥️ Output:**
```
- 📝 opsi -f digunakan untuk follow perubahan yang ada pada suatu file, berguna untuk menampilkan error, misal dalam kasus komentar diatas saya mengambil 15 baris untuk ditampilkan secara realtime
**💻 Command:**
```bash
tail -F ingest.log
```

**🖥️ Output:**
```
- 📝 opsi -F juga digunakan untuk follow perubahan file tetapi dengan follow with retry bahkan jika nama file di rename akan tetap menampilkan perubahannya
**💻 Command:**
```bash
tail -c 100 ingest.log
```

**🖥️ Output:**
```
n step 498
[WARN] 2024-01-01 10:499 ingestion step 499
[ERROR] 2024-01-01 10:500 ingestion step 500
```
✅ Exit code: 0

- 📝 opsi -c N digunakan untuk melihat dalam byte
**✨ What I learned:**
- gunakan -n N juka baris tail default (10 baris) tidak cukup
- gunakan -n +N jika dirasa ingin menampilkan baris dari baris tertentu
- gunakan -f untuk monitoring realtime dan jika ingin aman hingga saat nama file tiubah tetap menampilkan perubahan gunakan opsi -F
- gunakan opsi -c untuk melihat binnary bukan baris


---

## 📚 2026-01-06 15:24:48 - Exercise: less (pager untuk file besar)

**🎯 Objective:** mengetahui kapan less digunakan dan opsi apa saja yang sering digunakan

**📂 Context:**

- Skenario ini dijalankan pada direktori:
  ```
  /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project
  ```
- Catatan:
  - Tidak ada perintah `cd` yang dijalankan.
  - Semua command menggunakan working directory aktif saat ini.
  - Perubahan direktori **tidak otomatis tercatat** kecuali kamu eksplisit menjalankan `cd`.

- 📝 karena less adalah commend-line tool yang tidak digunakan untuk mencetak output di termian dan hanya untuk priview maka hasil belajar saya akan saya masukan dan jelaskan dengan kata kata

### 2026-01-06 19:32:08 - opsi -N digunakan untuk memberi line number pada less

### 2026-01-06 19:36:19 - opsi -S digunakan untuk data yang memiliki baris yang panjang jika tidak menggunakan -S maka data akan tumpang tindih menjadi ke bawah dengan opsi -S data bisa digeser kanan kiri

### 2026-01-06 19:37:49 - opsi +F digunakan untuk follow perubahan pada baris terakhir seperti tail tetapi dengan fitur bisa scroll back

### 2026-01-06 19:40:52 - opsi -i digunakan untuk mencari kata tertentu atau pattern tertentu cara menggunakan ya adalah dengan ketik / lalu kata atau karakternya

### 2026-01-06 19:41:57 - opsi -X digunakan untuk mencetah hasil less sampai screel tertentu ke terminal setelah quit
**✨ What I learned:**
- less digunakan untuk menampilkan file dalam jumlah baris yang besar
- less digunakan untuk cari kata tertentu misal log untuk mengetahui error mana yang bermasalah dan yang fatal, nantinya akan dieksekusi oleh programer
- less tidak memakan ram karena dengan less tidak load ke memory


---

## 📚 2026-01-06 19:47:07 - Exercise: more (pager sederhana)

**🎯 Objective:** MORE DIGUNAKAN HANYA JIKA OPSI LESS TIDAK TERSEDIA, mengetahui apa saja opsi more yang digunakan untuk keadaan darurat jika less tidak tersedia


### 2026-01-06 19:54:30 - opsi -d digunakan untuk menampilkan help atau informasi, misal jika ingin keluar akan menampilkan help q untuk informasi jika ingin exit

### 2026-01-06 19:56:52 - opsi -f digunakan untuk follow perubahan pada baris terakhir seperti tail tetapi dengan fitur bisa scroll back, penggunaannya sama dengan less +F

### 2026-01-06 19:57:50 - opsi +n digunakan untuk langsung memulai more pada baris tertentu yaitu baris ke N

### 2026-01-06 19:58:08 - opsi -s digunakan untuk menampilkan baris kosong yang banyak hanya menjadi 1 baris kosong

---

