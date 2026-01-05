# Learning Log

Started: 2026-01-05



---

## 📚 2026-01-05 13:19:55 - Exercise: List (ls)

**📂 Context:**

- Skenario ini dijalankan pada direktori:
  ```
  /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake
  ```
- Catatan:
  - Tidak ada perintah `cd` yang dijalankan.
  - Semua command menggunakan working directory aktif saat ini.
  - Perubahan direktori **tidak otomatis tercatat** kecuali kamu eksplisit menjalankan `cd`.

**🎯 Objective:** Mengetahui apa saja opsi ls yang biasanya digunakan untuk data engenering dan bisa membaca hasil dari opsi tersebut

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

- 📝 ls tanpa opsi akan memunculkan list level pertama sebuah direktori
**💻 Command:**
```bash
ls -l
```

**🖥️ Output:**
```
total 16
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4096 Jan  5 12:15 logs
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4096 Jan  5 12:15 metadata
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4096 Jan  5 12:15 processed
drwxr-xr-x 6 faris-al-fatih faris-al-fatih 4096 Jan  5 12:15 raw
```
✅ Exit code: 0

**✨ What I learned:**
- total dibagian atas menujukan jumlah block disk yang dipakai semua entry di direktori
- kolom 1 menujukan permisiion dan tipe file, tipe file ada di awal(-d adalah direktori - adalah file), urutannya adalah karakter 2-4 user atau woner, 3-7 adalah grup, 8-10 adalah other, permission umum adalah r(read), w(wraite), dan x(execute)
- kolom 2 menunjukan owner dari folder atau file
- kolom 3 menunjukan group dari folder atau file
- kolom 4 menunjukan ukuran file atau direktori
- kolom 5 menunjukan waktu kapan dimodifikasi
- kolom 6 menunjukan nama file atau folder

**💻 Command:**
```bash
ls -lh
```

**🖥️ Output:**
```
total 16K
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4.0K Jan  5 12:15 logs
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4.0K Jan  5 12:15 metadata
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4.0K Jan  5 12:15 processed
drwxr-xr-x 6 faris-al-fatih faris-al-fatih 4.0K Jan  5 12:15 raw
```
✅ Exit code: 0

- 📝 dengan opsi h akan memudahkan manusia untuk membaca informasi karena h digunakan agar human bisa membaca lebih mudah
**💻 Command:**
```bash
ls -lht
```

**🖥️ Output:**
```
total 16K
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4.0K Jan  5 12:15 processed
drwxr-xr-x 6 faris-al-fatih faris-al-fatih 4.0K Jan  5 12:15 raw
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4.0K Jan  5 12:15 metadata
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4.0K Jan  5 12:15 logs
```
✅ Exit code: 0

- 📝 opsi t digunakan agar untuk mengurutkan fole/folder berdasarkan waktu dimodifikasi
**💻 Command:**
```bash
ls -ltr
```

**🖥️ Output:**
```
total 16
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4096 Jan  5 12:15 logs
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4096 Jan  5 12:15 metadata
drwxr-xr-x 6 faris-al-fatih faris-al-fatih 4096 Jan  5 12:15 raw
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4096 Jan  5 12:15 processed
```
✅ Exit code: 0

- 📝 opsi r(reverse) digunakan untuk membalik urutan saat melakukan ls, misal ls -t defaultnya adalah urutkan list dari yang terbaru ke yang terlama dengan opsi -r akan membuat file lama yang tampil di awal
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

- 📝 a(all) digunakan untuk melihat secara keseluruhan jadi berguna jika ingin melihat seluruh file baik itu tipenya hiden atau tidak
**💻 Command:**
```bash
ls -Shl
```

**🖥️ Output:**
```
total 16K
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4.0K Jan  5 12:15 logs
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4.0K Jan  5 12:15 metadata
drwxr-xr-x 3 faris-al-fatih faris-al-fatih 4.0K Jan  5 12:15 processed
drwxr-xr-x 6 faris-al-fatih faris-al-fatih 4.0K Jan  5 12:15 raw
```
✅ Exit code: 0

- 📝 ternyata di kolom 4 itu yang tampil bukan ukuran total dari folder tapi ukuran folder itu sendiri jika ingin melihat ukuran total file menggunakan du, option S digunakan untuk mengurutkan berdasarkan ukuran
**✅ 2026-01-05 14:20:24 - Status:** COMPLETED

**💻 Command:**
```bash
ls -R metadata
```

**🖥️ Output:**
```
metadata:
schemas

metadata/schemas:
```
✅ Exit code: 0

- 📝 upsi R (recursive) digunakan untuk melihat keseluruhan isi pada sebuah folder
**💻 Command:**
```bash
ls -d ra
```

**🖥️ Output:**
```
ls: cannot access 'ra': No such file or directory
```
❌ Exit code: 2

**💻 Command:**
```bash
ls -d raw
```

**🖥️ Output:**
```
raw
```
✅ Exit code: 0

- 📝 opsi -d digunakan untuk melihat sitektori itu sendiri bukan isinya
**✅ 2026-01-05 14:23:27 - Status:** COMPLETED



---

## 📚 2026-01-05 14:25:21 - Exercise: tree

**🎯 Objective:** tree digunakan untuk memahami struktur project dengan tampilan pohon, tujuan dari sesi ini adalah memahami opsi apa saja yang bisa dipakai untuk memahami project dengan tree

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

- 📝 opsi -L digunakan untuk memberi limit kedalaman sebanyak n level
**💻 Command:**
```bash
tree -d
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
│       │   └── data
│       ├── v2
│       │   └── data
│       └── v3
│           └── data
└── raw
    ├── bitcoin
    │   ├── binance
    │   │   ├── 2022
    │   │   │   ├── 01
    │   │   │   ├── 02
    │   │   │   ├── 03
    │   │   │   ├── 04
    │   │   │   ├── 05
    │   │   │   └── 06
    │   │   ├── 2023
    │   │   │   ├── 01
    │   │   │   ├── 02
    │   │   │   ├── 03
    │   │   │   ├── 04
    │   │   │   ├── 05
    │   │   │   └── 06
    │   │   └── 2024
    │   │       ├── 01
    │   │       ├── 02
    │   │       ├── 03
    │   │       ├── 04
    │   │       ├── 05
    │   │       └── 06
    │   ├── coinbase
    │   │   ├── 2022
    │   │   │   ├── 01
    │   │   │   ├── 02
    │   │   │   ├── 03
    │   │   │   ├── 04
    │   │   │   ├── 05
    │   │   │   └── 06
    │   │   ├── 2023
    │   │   │   ├── 01
    │   │   │   ├── 02
    │   │   │   ├── 03
... (285 lines, showing first 50)
```
✅ Exit code: 0

- 📝 opsi -d hanya menampilkan direktori saja
**💻 Command:**
```bash
tree -L 2 -h
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
└── [4.0K]  raw
    ├── [4.0K]  bitcoin
    ├── [4.0K]  cardano
    ├── [4.0K]  ethereum
    └── [4.0K]  solana

12 directories, 0 files
```
✅ Exit code: 0

- 📝 opsi -h digunakan untuk melihat ukuran direktori tspi tidak untuk isinya, penggunaannya sama seperti ls
**💻 Command:**
```bash
tree -L 2 -D
```

**🖥️ Output:**
```
[Jan  5 12:15]  .
├── [Jan  5 12:15]  logs
│   └── [Jan  5 12:15]  ingestion
├── [Jan  5 12:15]  metadata
│   └── [Jan  5 12:15]  schemas
├── [Jan  5 12:15]  processed
│   └── [Jan  5 12:15]  bitcoin
└── [Jan  5 12:15]  raw
    ├── [Jan  5 12:15]  bitcoin
    ├── [Jan  5 12:15]  cardano
    ├── [Jan  5 12:15]  ethereum
    └── [Jan  5 12:15]  solana

12 directories, 0 files
```
✅ Exit code: 0

- 📝 opsi -d menampilkan kapan folder itu diubah/dibuat BUKAN ISI DIDALAMNYA
**💻 Command:**
```bash
tree -L 2 -P
```

**🖥️ Output:**
```
tree: Missing argument to -P option.
```
❌ Exit code: 1

**💻 Command:**
```bash
tree -LP 2
```

**🖥️ Output:**
```
tree: Missing argument to -P option.
```
❌ Exit code: 1

**💻 Command:**
```bash
tree -Lp 2
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
└── [drwxr-xr-x]  raw
    ├── [drwxr-xr-x]  bitcoin
    ├── [drwxr-xr-x]  cardano
    ├── [drwxr-xr-x]  ethereum
    └── [drwxr-xr-x]  solana

12 directories, 0 files
```
✅ Exit code: 0

- 📝 yang benar p kecil bukan P besar, opsi -p digunakan untuk melihat permission/izin
**💻 Command:**
```bash
tree -L 3 -I raw
```

**🖥️ Output:**
```
.
├── logs
│   └── ingestion
├── metadata
│   └── schemas
└── processed
    └── bitcoin
        ├── latest -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3
        ├── v1
        ├── v2
        └── v3

11 directories, 0 files
```
✅ Exit code: 0

- 📝 opsi -I (ignore) digunakan untuk melihat struktur tapi ingin mengabaikan folder tertentu tujuannya agaran agar tampilan cleen
**✅ 2026-01-05 14:57:52 - Status:** COMPLETED


---

## 📊 2026-01-05 14:58:00 - Session Summary

- **Total exercises:** 2
- **Completed:** 3
- **Failed:** 0
