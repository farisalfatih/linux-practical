# Learning Log

Started: 2026-01-05


---

## 📚 2026-01-05 15:35:32 - Exercise: OBSERVASI


### 2026-01-05 15:38:07 - konteks project ini dijilankan pada direktori :
**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake
```
✅ Exit code: 0


### 2026-01-05 15:39:18 - Struktur direktori ini adalah:

#### 2026-01-05 16:27:32 - Struktur Utama:
**💻 Command:**
```bash
tree -L 3
```

**🖥️ Output:**
```
.
├── logs
│   └── ingestion
├── metadata
│   └── schemas
├── processed
│   └── bitcoin
│       ├── latest -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3
│       ├── v1
│       ├── v2
│       └── v3
└── raw
    ├── bitcoin
    │   ├── binance
    │   ├── coinbase
    │   └── kraken
    ├── cardano
    │   ├── binance
    │   ├── coinbase
    │   └── kraken
    ├── ethereum
    │   ├── binance
    │   ├── coinbase
    │   └── kraken
    └── solana
        ├── binance
        ├── coinbase
        └── kraken

28 directories, 0 files
```
✅ Exit code: 0

**✨ What I learned:**
- struktur terdiri dari 4 folder utama
- data raw yang ada adalah data kripto dari masing masing exchange


#### 2026-01-05 16:32:20 - Struktur data raw :
**💻 Command:**
```bash
tree -L 3 raw
```

**🖥️ Output:**
```
raw
├── bitcoin
│   ├── binance
│   │   ├── 2022
│   │   ├── 2023
│   │   └── 2024
│   ├── coinbase
│   │   ├── 2022
│   │   ├── 2023
│   │   └── 2024
│   └── kraken
│       ├── 2022
│       ├── 2023
│       └── 2024
├── cardano
│   ├── binance
│   │   ├── 2022
│   │   ├── 2023
│   │   └── 2024
│   ├── coinbase
│   │   ├── 2022
│   │   ├── 2023
│   │   └── 2024
│   └── kraken
│       ├── 2022
│       ├── 2023
│       └── 2024
├── ethereum
│   ├── binance
│   │   ├── 2022
│   │   ├── 2023
│   │   └── 2024
│   ├── coinbase
│   │   ├── 2022
│   │   ├── 2023
│   │   └── 2024
│   └── kraken
│       ├── 2022
│       ├── 2023
│       └── 2024
└── solana
    ├── binance
    │   ├── 2022
    │   ├── 2023
    │   └── 2024
    ├── coinbase
    │   ├── 2022
    │   ├── 2023
    │   └── 2024
    └── kraken
... (55 lines, showing first 50)
```
✅ Exit code: 0

- 📝 struktur raw data memiliki 3 level kedalaman yaitu asset, nama exchange, tahun

#### 2026-01-05 16:41:10 - Sruktur data yang sudah di procces:
**💻 Command:**
```bash
tree -L 4 processed
```

**🖥️ Output:**
```
processed
└── bitcoin
    ├── latest -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3
    ├── v1
    │   └── data
    │       ├── btc_clean_1.csv
    │       ├── btc_clean_2.csv
    │       ├── btc_clean_3.csv
    │       ├── btc_clean_4.csv
    │       └── btc_clean_5.csv
    ├── v2
    │   └── data
    │       ├── btc_clean_1.csv
    │       ├── btc_clean_2.csv
    │       ├── btc_clean_3.csv
    │       ├── btc_clean_4.csv
    │       └── btc_clean_5.csv
    └── v3
        └── data
            ├── btc_clean_1.csv
            ├── btc_clean_2.csv
            ├── btc_clean_3.csv
            ├── btc_clean_4.csv
            └── btc_clean_5.csv

9 directories, 15 files
```
✅ Exit code: 0


### 2026-01-05 16:44:23 - Tipe file yang digunakan adalah:
**💻 Command:**
```bash
ls -R raw/
```

**🖥️ Output:**
```
raw/:
bitcoin
cardano
ethereum
solana

raw/bitcoin:
binance
coinbase
kraken

raw/bitcoin/binance:
2022
2023
2024

raw/bitcoin/binance/2022:
01
02
03
04
05
06

raw/bitcoin/binance/2022/01:
01.csv
02.csv
03.csv
04.csv
05.csv
06.csv
07.csv
08.csv
09.csv
10.csv
11.csv
12.csv
13.csv
14.csv
15.csv

raw/bitcoin/binance/2022/02:
01.csv
02.csv
03.csv
04.csv
05.csv
06.csv
07.csv
08.csv
... (4045 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -R processed
```

**🖥️ Output:**
```
processed:
bitcoin

processed/bitcoin:
latest
v1
v2
v3

processed/bitcoin/v1:
data

processed/bitcoin/v1/data:
btc_clean_1.csv
btc_clean_2.csv
btc_clean_3.csv
btc_clean_4.csv
btc_clean_5.csv

processed/bitcoin/v2:
data

processed/bitcoin/v2/data:
btc_clean_1.csv
btc_clean_2.csv
btc_clean_3.csv
btc_clean_4.csv
btc_clean_5.csv

processed/bitcoin/v3:
data

processed/bitcoin/v3/data:
btc_clean_1.csv
btc_clean_2.csv
btc_clean_3.csv
btc_clean_4.csv
btc_clean_5.csv
```
✅ Exit code: 0

- 📝 keseluruhan data di project ini adalah format csv
**💻 Command:**
```bash
ls -a
```

**🖥️ Output:**
```
.
..
logs
metadata
processed
raw
```
✅ Exit code: 0

- 📝 tidak ada hidden file, sudah saya jek dengan recrusive, saya menampilkan ls -a saja supaya tidak panjang outputnya

#### 2026-01-05 17:01:20 - symlink
**💻 Command:**
```bash
tree processed
```

**🖥️ Output:**
```
processed
└── bitcoin
    ├── latest -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3
    ├── v1
    │   └── data
    │       ├── btc_clean_1.csv
    │       ├── btc_clean_2.csv
    │       ├── btc_clean_3.csv
    │       ├── btc_clean_4.csv
    │       └── btc_clean_5.csv
    ├── v2
    │   └── data
    │       ├── btc_clean_1.csv
    │       ├── btc_clean_2.csv
    │       ├── btc_clean_3.csv
    │       ├── btc_clean_4.csv
    │       └── btc_clean_5.csv
    └── v3
        └── data
            ├── btc_clean_1.csv
            ├── btc_clean_2.csv
            ├── btc_clean_3.csv
            ├── btc_clean_4.csv
            └── btc_clean_5.csv

9 directories, 15 files
```
✅ Exit code: 0

- 📝 link hanya ada pada processed/bitcoin/latest
**💻 Command:**
```bash
tree -dap
```

**🖥️ Output:**
```
[drwxr-xr-x]  .
├── [drwxr-xr-x]  logs
│   └── [drwxr-xr-x]  ingestion
├── [drwxr-xr-x]  metadata
│   └── [drwxr-xr-x]  schemas
├── [drwxr-xr-x]  processed
│   └── [drwxr-xr-x]  bitcoin
│       ├── [lrwxrwxrwx]  latest -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3
│       ├── [drwxr-xr-x]  v1
│       │   └── [drwxr-xr-x]  data
│       ├── [drwxr-xr-x]  v2
│       │   └── [drwxr-xr-x]  data
│       └── [drwxr-xr-x]  v3
│           └── [drwxr-xr-x]  data
└── [drwxr-xr-x]  raw
    ├── [drwxr-xr-x]  bitcoin
    │   ├── [drwxr-xr-x]  binance
    │   │   ├── [drwxr-xr-x]  2022
    │   │   │   ├── [drwxr-xr-x]  01
    │   │   │   ├── [drwxr-xr-x]  02
    │   │   │   ├── [drwxr-xr-x]  03
    │   │   │   ├── [drwxr-xr-x]  04
    │   │   │   ├── [drwxr-xr-x]  05
    │   │   │   └── [drwxr-xr-x]  06
    │   │   ├── [drwxr-xr-x]  2023
    │   │   │   ├── [drwxr-xr-x]  01
    │   │   │   ├── [drwxr-xr-x]  02
    │   │   │   ├── [drwxr-xr-x]  03
    │   │   │   ├── [drwxr-xr-x]  04
    │   │   │   ├── [drwxr-xr-x]  05
    │   │   │   └── [drwxr-xr-x]  06
    │   │   └── [drwxr-xr-x]  2024
    │   │       ├── [drwxr-xr-x]  01
    │   │       ├── [drwxr-xr-x]  02
    │   │       ├── [drwxr-xr-x]  03
    │   │       ├── [drwxr-xr-x]  04
    │   │       ├── [drwxr-xr-x]  05
    │   │       └── [drwxr-xr-x]  06
    │   ├── [drwxr-xr-x]  coinbase
    │   │   ├── [drwxr-xr-x]  2022
    │   │   │   ├── [drwxr-xr-x]  01
    │   │   │   ├── [drwxr-xr-x]  02
    │   │   │   ├── [drwxr-xr-x]  03
    │   │   │   ├── [drwxr-xr-x]  04
    │   │   │   ├── [drwxr-xr-x]  05
    │   │   │   └── [drwxr-xr-x]  06
    │   │   ├── [drwxr-xr-x]  2023
    │   │   │   ├── [drwxr-xr-x]  01
    │   │   │   ├── [drwxr-xr-x]  02
    │   │   │   ├── [drwxr-xr-x]  03
... (285 lines, showing first 50)
```
✅ Exit code: 0

- 📝 permission untuk user/orner bisa semua

#### 2026-01-05 17:05:01 - Ukuran File
**💻 Command:**
```bash
tree -h
```

**🖥️ Output:**
```
[4.0K]  .
├── [4.0K]  logs
│   └── [4.0K]  ingestion
├── [4.0K]  metadata
│   └── [4.0K]  schemas
├── [4.0K]  processed
│   └── [4.0K]  bitcoin
│       ├── [ 117]  latest -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3
│       ├── [4.0K]  v1
│       │   └── [4.0K]  data
│       │       ├── [  13]  btc_clean_1.csv
│       │       ├── [  13]  btc_clean_2.csv
│       │       ├── [  13]  btc_clean_3.csv
│       │       ├── [  13]  btc_clean_4.csv
│       │       └── [  13]  btc_clean_5.csv
│       ├── [4.0K]  v2
│       │   └── [4.0K]  data
│       │       ├── [  13]  btc_clean_1.csv
│       │       ├── [  13]  btc_clean_2.csv
│       │       ├── [  13]  btc_clean_3.csv
│       │       ├── [  13]  btc_clean_4.csv
│       │       └── [  13]  btc_clean_5.csv
│       └── [4.0K]  v3
│           └── [4.0K]  data
│               ├── [  13]  btc_clean_1.csv
│               ├── [  13]  btc_clean_2.csv
│               ├── [  13]  btc_clean_3.csv
│               ├── [  13]  btc_clean_4.csv
│               └── [  13]  btc_clean_5.csv
└── [4.0K]  raw
    ├── [4.0K]  bitcoin
    │   ├── [4.0K]  binance
    │   │   ├── [4.0K]  2022
    │   │   │   ├── [4.0K]  01
    │   │   │   │   ├── [  87]  01.csv
    │   │   │   │   ├── [  87]  02.csv
    │   │   │   │   ├── [  87]  03.csv
    │   │   │   │   ├── [  87]  04.csv
    │   │   │   │   ├── [  87]  05.csv
    │   │   │   │   ├── [  87]  06.csv
    │   │   │   │   ├── [  87]  07.csv
    │   │   │   │   ├── [  87]  08.csv
    │   │   │   │   ├── [  87]  09.csv
    │   │   │   │   ├── [  87]  10.csv
    │   │   │   │   ├── [  87]  11.csv
    │   │   │   │   ├── [  87]  12.csv
    │   │   │   │   ├── [  87]  13.csv
    │   │   │   │   ├── [  87]  14.csv
    │   │   │   │   └── [  87]  15.csv
    │   │   │   ├── [4.0K]  02
... (3540 lines, showing first 50)
```
✅ Exit code: 0

- 📝 ukuran file rata rata 84 kb



---

## 📚 2026-01-06 05:02:05 - Exercise: REPORT


### 2026-01-06 05:03:20 - Gambaran Umum Struktur Direktori
**💻 Command:**
```bash
tree -L 3
```

**🖥️ Output:**
```
.
├── logs
│   └── ingestion
├── metadata
│   └── schemas
├── processed
│   └── bitcoin
│       ├── latest -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3
│       ├── v1
│       ├── v2
│       └── v3
└── raw
    ├── bitcoin
    │   ├── binance
    │   ├── coinbase
    │   └── kraken
    ├── cardano
    │   ├── binance
    │   ├── coinbase
    │   └── kraken
    ├── ethereum
    │   ├── binance
    │   ├── coinbase
    │   └── kraken
    └── solana
        ├── binance
        ├── coinbase
        └── kraken

28 directories, 0 files
```
✅ Exit code: 0

**💻 Command:**
```bash
tree processed raw --filelimit 7
```

**🖥️ Output:**
```
processed
└── bitcoin
    ├── latest -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3
    ├── v1
    │   └── data
    │       ├── btc_clean_1.csv
    │       ├── btc_clean_2.csv
    │       ├── btc_clean_3.csv
    │       ├── btc_clean_4.csv
    │       └── btc_clean_5.csv
    ├── v2
    │   └── data
    │       ├── btc_clean_1.csv
    │       ├── btc_clean_2.csv
    │       ├── btc_clean_3.csv
    │       ├── btc_clean_4.csv
    │       └── btc_clean_5.csv
    └── v3
        └── data
            ├── btc_clean_1.csv
            ├── btc_clean_2.csv
            ├── btc_clean_3.csv
            ├── btc_clean_4.csv
            └── btc_clean_5.csv
raw
├── bitcoin
│   ├── binance
│   │   ├── 2022
│   │   │   ├── 01  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 02  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 03  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 04  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 05  [15 entries exceeds filelimit, not opening dir]
│   │   │   └── 06  [15 entries exceeds filelimit, not opening dir]
│   │   ├── 2023
│   │   │   ├── 01  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 02  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 03  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 04  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 05  [15 entries exceeds filelimit, not opening dir]
│   │   │   └── 06  [15 entries exceeds filelimit, not opening dir]
│   │   └── 2024
│   │       ├── 01  [15 entries exceeds filelimit, not opening dir]
│   │       ├── 02  [15 entries exceeds filelimit, not opening dir]
│   │       ├── 03  [15 entries exceeds filelimit, not opening dir]
│   │       ├── 04  [15 entries exceeds filelimit, not opening dir]
│   │       ├── 05  [15 entries exceeds filelimit, not opening dir]
│   │       └── 06  [15 entries exceeds filelimit, not opening dir]
│   ├── coinbase
│   │   ├── 2022
... (295 lines, showing first 50)
```
❌ Exit code: 2


**❌ 2026-01-06 05:17:07 - Status:** FAILED
**Reason:** Argumen pemanggilan salah(double)

**💻 Command:**
```bash
bash -c tree processed; tree raw --filelimit 6
```

**🖥️ Output:**
```
processed
└── bitcoin
    ├── latest -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3
    ├── v1
    │   └── data
    │       ├── btc_clean_1.csv
    │       ├── btc_clean_2.csv
    │       ├── btc_clean_3.csv
    │       ├── btc_clean_4.csv
    │       └── btc_clean_5.csv
    ├── v2
    │   └── data
    │       ├── btc_clean_1.csv
    │       ├── btc_clean_2.csv
    │       ├── btc_clean_3.csv
    │       ├── btc_clean_4.csv
    │       └── btc_clean_5.csv
    └── v3
        └── data
            ├── btc_clean_1.csv
            ├── btc_clean_2.csv
            ├── btc_clean_3.csv
            ├── btc_clean_4.csv
            └── btc_clean_5.csv

9 directories, 15 files
raw
├── bitcoin
│   ├── binance
│   │   ├── 2022
│   │   │   ├── 01  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 02  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 03  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 04  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 05  [15 entries exceeds filelimit, not opening dir]
│   │   │   └── 06  [15 entries exceeds filelimit, not opening dir]
│   │   ├── 2023
│   │   │   ├── 01  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 02  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 03  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 04  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 05  [15 entries exceeds filelimit, not opening dir]
│   │   │   └── 06  [15 entries exceeds filelimit, not opening dir]
│   │   └── 2024
│   │       ├── 01  [15 entries exceeds filelimit, not opening dir]
│   │       ├── 02  [15 entries exceeds filelimit, not opening dir]
│   │       ├── 03  [15 entries exceeds filelimit, not opening dir]
│   │       ├── 04  [15 entries exceeds filelimit, not opening dir]
│   │       ├── 05  [15 entries exceeds filelimit, not opening dir]
│   │       └── 06  [15 entries exceeds filelimit, not opening dir]
... (297 lines, showing first 50)
```
❌ Exit code: 2

**❌ 2026-01-06 05:24:15 - Status:** FAILED
**Reason:** error disebabkan karena komputer gagal membuka folder secara lengkap

**💻 Command:**
```bash
bash -c tree processed; tree raw --filelimit 6 || true
```

**🖥️ Output:**
```
processed
└── bitcoin
    ├── latest -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3
    ├── v1
    │   └── data
    │       ├── btc_clean_1.csv
    │       ├── btc_clean_2.csv
    │       ├── btc_clean_3.csv
    │       ├── btc_clean_4.csv
    │       └── btc_clean_5.csv
    ├── v2
    │   └── data
    │       ├── btc_clean_1.csv
    │       ├── btc_clean_2.csv
    │       ├── btc_clean_3.csv
    │       ├── btc_clean_4.csv
    │       └── btc_clean_5.csv
    └── v3
        └── data
            ├── btc_clean_1.csv
            ├── btc_clean_2.csv
            ├── btc_clean_3.csv
            ├── btc_clean_4.csv
            └── btc_clean_5.csv

9 directories, 15 files
raw
├── bitcoin
│   ├── binance
│   │   ├── 2022
│   │   │   ├── 01  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 02  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 03  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 04  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 05  [15 entries exceeds filelimit, not opening dir]
│   │   │   └── 06  [15 entries exceeds filelimit, not opening dir]
│   │   ├── 2023
│   │   │   ├── 01  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 02  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 03  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 04  [15 entries exceeds filelimit, not opening dir]
│   │   │   ├── 05  [15 entries exceeds filelimit, not opening dir]
│   │   │   └── 06  [15 entries exceeds filelimit, not opening dir]
│   │   └── 2024
│   │       ├── 01  [15 entries exceeds filelimit, not opening dir]
│   │       ├── 02  [15 entries exceeds filelimit, not opening dir]
│   │       ├── 03  [15 entries exceeds filelimit, not opening dir]
│   │       ├── 04  [15 entries exceeds filelimit, not opening dir]
│   │       ├── 05  [15 entries exceeds filelimit, not opening dir]
│   │       └── 06  [15 entries exceeds filelimit, not opening dir]
... (297 lines, showing first 50)
```
✅ Exit code: 0


### 2026-01-06 05:26:36 - Data di project ini keseluruhan menggunakan csv

---

## 📚 2026-01-06 05:28:18 - Exercise: VALIDASI & AUDIT DIRI

**🎯 Objective:** Membuktikan bahwa struktur REPORT diatas benar

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake
```
✅ Exit code: 0

**💻 Command:**
```bash
ls
```

**🖥️ Output:**
```
logs
metadata
processed
raw
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -a
```

**🖥️ Output:**
```
.
..
logs
metadata
processed
raw
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/logs
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -aR
```

**🖥️ Output:**
```
.:
.
..
ingestion

./ingestion:
.
..
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/metadata
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -aR
```

**🖥️ Output:**
```
.:
.
..
schemas

./schemas:
.
..
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -aR
```

**🖥️ Output:**
```
.:
.
..
bitcoin

./bitcoin:
.
..
latest
v1
v2
v3

./bitcoin/v1:
.
..
data

./bitcoin/v1/data:
.
..
btc_clean_1.csv
btc_clean_2.csv
btc_clean_3.csv
btc_clean_4.csv
btc_clean_5.csv

./bitcoin/v2:
.
..
data

./bitcoin/v2/data:
.
..
btc_clean_1.csv
btc_clean_2.csv
btc_clean_3.csv
btc_clean_4.csv
btc_clean_5.csv

./bitcoin/v3:
.
..
data

./bitcoin/v3/data:
.
..
btc_clean_1.csv
... (54 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/raw
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -a
```

**🖥️ Output:**
```
.
..
bitcoin
cardano
ethereum
solana
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/raw/bitcoin
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -aR
```

**🖥️ Output:**
```
.:
.
..
binance
coinbase
kraken

./binance:
.
..
2022
2023
2024

./binance/2022:
.
..
01
02
03
04
05
06

./binance/2022/01:
.
..
01.csv
02.csv
03.csv
04.csv
05.csv
06.csv
07.csv
08.csv
09.csv
10.csv
11.csv
12.csv
13.csv
14.csv
15.csv

./binance/2022/02:
.
..
01.csv
02.csv
03.csv
04.csv
... (1143 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/raw/cardano
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -aR
```

**🖥️ Output:**
```
.:
.
..
binance
coinbase
kraken

./binance:
.
..
2022
2023
2024

./binance/2022:
.
..
01
02
03
04
05
06

./binance/2022/01:
.
..
01.csv
02.csv
03.csv
04.csv
05.csv
06.csv
07.csv
08.csv
09.csv
10.csv
11.csv
12.csv
13.csv
14.csv
15.csv

./binance/2022/02:
.
..
01.csv
02.csv
03.csv
04.csv
... (1143 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -aR
```

**🖥️ Output:**
```
.:
.
..
binance
coinbase
kraken

./binance:
.
..
2022
2023
2024

./binance/2022:
.
..
01
02
03
04
05
06

./binance/2022/01:
.
..
01.csv
02.csv
03.csv
04.csv
05.csv
06.csv
07.csv
08.csv
09.csv
10.csv
11.csv
12.csv
13.csv
14.csv
15.csv

./binance/2022/02:
.
..
01.csv
02.csv
03.csv
04.csv
... (1143 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/raw/solana
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -aR
```

**🖥️ Output:**
```
.:
.
..
binance
coinbase
kraken

./binance:
.
..
2022
2023
2024

./binance/2022:
.
..
01
02
03
04
05
06

./binance/2022/01:
.
..
01.csv
02.csv
03.csv
04.csv
05.csv
06.csv
07.csv
08.csv
09.csv
10.csv
11.csv
12.csv
13.csv
14.csv
15.csv

./binance/2022/02:
.
..
01.csv
02.csv
03.csv
04.csv
... (1143 lines, showing first 50)
```
✅ Exit code: 0


---

## 📊 2026-01-06 05:36:07 - Session Summary

- **Total exercises:** 3
- **Completed:** 0
- **Failed:** 2

