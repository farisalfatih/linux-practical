# Learning Log

Started: 2026-01-08

**🎯 Objective:** mengetahui kapan find digunakan dan kapan locate digunakan, serta mengetahui perbedaannya


---

## 📚 2026-01-08 12:27:39 - Exercise: menyiapkan lingkungan agar lebih memahami find untuk latihan find nanti

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem
```
✅ Exit code: 0

**💻 Command:**
```bash
du -hc
```

**🖥️ Output:**
```
4.0K	./1-4_manajemen-file-dan-directory/data/curated
40K	./1-4_manajemen-file-dan-directory/data/staging/v2
40K	./1-4_manajemen-file-dan-directory/data/staging/v3
40K	./1-4_manajemen-file-dan-directory/data/staging/v1
124K	./1-4_manajemen-file-dan-directory/data/staging
16K	./1-4_manajemen-file-dan-directory/data/raw
148K	./1-4_manajemen-file-dan-directory/data
4.0K	./1-4_manajemen-file-dan-directory/logs
4.0K	./1-4_manajemen-file-dan-directory/scripts/transform
4.0K	./1-4_manajemen-file-dan-directory/scripts/load
4.0K	./1-4_manajemen-file-dan-directory/scripts/extract
16K	./1-4_manajemen-file-dan-directory/scripts
16K	./1-4_manajemen-file-dan-directory/backup/raw/backup_2026-01-06-22_12_34
20K	./1-4_manajemen-file-dan-directory/backup/raw
24K	./1-4_manajemen-file-dan-directory/backup
196K	./1-4_manajemen-file-dan-directory
8.0K	./1-3_membaca-isi-file/project/docs
40K	./1-3_membaca-isi-file/project/data/staging
40K	./1-3_membaca-isi-file/project/data/raw
36K	./1-3_membaca-isi-file/project/data/logs
120K	./1-3_membaca-isi-file/project/data
136K	./1-3_membaca-isi-file/project
144K	./1-3_membaca-isi-file
532K	./1-5_metadata-dan-ukuran/fs-lab/data/raw
8.0K	./1-5_metadata-dan-ukuran/fs-lab/data/processed
544K	./1-5_metadata-dan-ukuran/fs-lab/data
4.0K	./1-5_metadata-dan-ukuran/fs-lab/logs
8.0K	./1-5_metadata-dan-ukuran/fs-lab/metadata/schema
12K	./1-5_metadata-dan-ukuran/fs-lab/metadata/stat
24K	./1-5_metadata-dan-ukuran/fs-lab/metadata
8.0K	./1-5_metadata-dan-ukuran/fs-lab/bin
584K	./1-5_metadata-dan-ukuran/fs-lab
592K	./1-5_metadata-dan-ukuran
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2024/05
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2024/06
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2024/03
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2024/01
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2024/04
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2024/02
388K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2024
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2022/05
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2022/06
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2022/03
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2022/01
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2022/04
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2022/02
388K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2022
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2023/05
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2023/06
64K	./1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/binance/2023/03
... (318 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
du -hs
```

**🖥️ Output:**
```
15M	.
```
✅ Exit code: 0

**💻 Command:**
```bash
du -h --max-depth=1
```

**🖥️ Output:**
```
196K	./1-4_manajemen-file-dan-directory
144K	./1-3_membaca-isi-file
592K	./1-5_metadata-dan-ukuran
14M	./1-2_eksplorasi-filesystem
15M	.
```
✅ Exit code: 0

**💻 Command:**
```bash
cp 1-2_eksplorasi-filesystem/chaos-data-lake 1-2_eksplorasi-filesystem/generate-project.sh /home/faris-al-fatih/linux-practical/lab/02-pencarian-dan-filtering/1-1_pencarian-file/
```

**🖥️ Output:**
```
cp: -r not specified; omitting directory '1-2_eksplorasi-filesystem/chaos-data-lake'
```
❌ Exit code: 1

**💻 Command:**
```bash
cp -r 1-2_eksplorasi-filesystem/chaos-data-lake 1-2_eksplorasi-filesystem/generate-project.sh /home/faris-al-fatih/linux-practical/lab/02-pencarian-dan-filtering/1-1_pencarian-file/
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/02-pencarian-dan-filtering/1-1_pencarian-file
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -L 1
```

**🖥️ Output:**
```
.
├── chaos-data-lake
└── generate-project.sh

2 directories, 1 file
```
✅ Exit code: 0

**💻 Command:**
```bash
rm -v generate-project.sh
```

**🖥️ Output:**
```
removed 'generate-project.sh'
```
✅ Exit code: 0

**💻 Command:**
```bash
mv -vr chaos-data-lake/logs chaos-data-lake/metadata chaos-data-lake/processed chaos-data-lake/raw .
```

**🖥️ Output:**
```
mv: invalid option -- 'r'
Try 'mv --help' for more information.
```
❌ Exit code: 1

**💻 Command:**
```bash
mv -v chaos-data-lake/logs chaos-data-lake/metadata chaos-data-lake/processed chaos-data-lake/raw .
```

**🖥️ Output:**
```
renamed 'chaos-data-lake/logs' -> './logs'
renamed 'chaos-data-lake/metadata' -> './metadata'
renamed 'chaos-data-lake/processed' -> './processed'
renamed 'chaos-data-lake/raw' -> './raw'
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -L 2
```

**🖥️ Output:**
```
.
├── chaos-data-lake
├── logs
│   └── ingestion
├── metadata
│   └── schemas
├── processed
│   └── bitcoin
└── raw
    ├── bitcoin
    ├── cardano
    ├── ethereum
    └── solana

13 directories, 0 files
```
✅ Exit code: 0

**💻 Command:**
```bash
rmdir -v chaos-data-lake/
```

**🖥️ Output:**
```
rmdir: removing directory, 'chaos-data-lake/'
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -L 2
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
└── raw
    ├── bitcoin
    ├── cardano
    ├── ethereum
    └── solana

12 directories, 0 files
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -type f
```

**🖥️ Output:**
```
./raw/ethereum/binance/2024/05/02.csv
./raw/ethereum/binance/2024/05/08.csv
./raw/ethereum/binance/2024/05/11.csv
./raw/ethereum/binance/2024/05/09.csv
./raw/ethereum/binance/2024/05/15.csv
./raw/ethereum/binance/2024/05/01.csv
./raw/ethereum/binance/2024/05/06.csv
./raw/ethereum/binance/2024/05/12.csv
./raw/ethereum/binance/2024/05/07.csv
./raw/ethereum/binance/2024/05/04.csv
./raw/ethereum/binance/2024/05/13.csv
./raw/ethereum/binance/2024/05/05.csv
./raw/ethereum/binance/2024/05/03.csv
./raw/ethereum/binance/2024/05/10.csv
./raw/ethereum/binance/2024/05/14.csv
./raw/ethereum/binance/2024/06/02.csv
./raw/ethereum/binance/2024/06/08.csv
./raw/ethereum/binance/2024/06/11.csv
./raw/ethereum/binance/2024/06/09.csv
./raw/ethereum/binance/2024/06/15.csv
./raw/ethereum/binance/2024/06/01.csv
./raw/ethereum/binance/2024/06/06.csv
./raw/ethereum/binance/2024/06/12.csv
./raw/ethereum/binance/2024/06/07.csv
./raw/ethereum/binance/2024/06/04.csv
./raw/ethereum/binance/2024/06/13.csv
./raw/ethereum/binance/2024/06/05.csv
./raw/ethereum/binance/2024/06/03.csv
./raw/ethereum/binance/2024/06/10.csv
./raw/ethereum/binance/2024/06/14.csv
./raw/ethereum/binance/2024/03/02.csv
./raw/ethereum/binance/2024/03/08.csv
./raw/ethereum/binance/2024/03/11.csv
./raw/ethereum/binance/2024/03/09.csv
./raw/ethereum/binance/2024/03/15.csv
./raw/ethereum/binance/2024/03/01.csv
./raw/ethereum/binance/2024/03/06.csv
./raw/ethereum/binance/2024/03/12.csv
./raw/ethereum/binance/2024/03/07.csv
./raw/ethereum/binance/2024/03/04.csv
./raw/ethereum/binance/2024/03/13.csv
./raw/ethereum/binance/2024/03/05.csv
./raw/ethereum/binance/2024/03/03.csv
./raw/ethereum/binance/2024/03/10.csv
./raw/ethereum/binance/2024/03/14.csv
./raw/ethereum/binance/2024/01/02.csv
./raw/ethereum/binance/2024/01/08.csv
./raw/ethereum/binance/2024/01/11.csv
./raw/ethereum/binance/2024/01/09.csv
./raw/ethereum/binance/2024/01/15.csv
... (3256 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c cat -n total-file.txt | tail -n 1
```

**🖥️ Output:**
```
  3256	./total-file.txt
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c less total-file.txt; echo 'selesai melihat file dengan less'
```

**🖥️ Output:**
```
./raw/ethereum/binance/2024/05/02.csv
./raw/ethereum/binance/2024/05/08.csv
./raw/ethereum/binance/2024/05/11.csv
./raw/ethereum/binance/2024/05/09.csv
./raw/ethereum/binance/2024/05/15.csv
./raw/ethereum/binance/2024/05/01.csv
./raw/ethereum/binance/2024/05/06.csv
./raw/ethereum/binance/2024/05/12.csv
./raw/ethereum/binance/2024/05/07.csv
./raw/ethereum/binance/2024/05/04.csv
./raw/ethereum/binance/2024/05/13.csv
./raw/ethereum/binance/2024/05/05.csv
./raw/ethereum/binance/2024/05/03.csv
./raw/ethereum/binance/2024/05/10.csv
./raw/ethereum/binance/2024/05/14.csv
./raw/ethereum/binance/2024/06/02.csv
./raw/ethereum/binance/2024/06/08.csv
./raw/ethereum/binance/2024/06/11.csv
./raw/ethereum/binance/2024/06/09.csv
./raw/ethereum/binance/2024/06/15.csv
./raw/ethereum/binance/2024/06/01.csv
./raw/ethereum/binance/2024/06/06.csv
./raw/ethereum/binance/2024/06/12.csv
./raw/ethereum/binance/2024/06/07.csv
./raw/ethereum/binance/2024/06/04.csv
./raw/ethereum/binance/2024/06/13.csv
./raw/ethereum/binance/2024/06/05.csv
./raw/ethereum/binance/2024/06/03.csv
./raw/ethereum/binance/2024/06/10.csv
./raw/ethereum/binance/2024/06/14.csv
./raw/ethereum/binance/2024/03/02.csv
./raw/ethereum/binance/2024/03/08.csv
./raw/ethereum/binance/2024/03/11.csv
./raw/ethereum/binance/2024/03/09.csv
./raw/ethereum/binance/2024/03/15.csv
./raw/ethereum/binance/2024/03/01.csv
./raw/ethereum/binance/2024/03/06.csv
./raw/ethereum/binance/2024/03/12.csv
./raw/ethereum/binance/2024/03/07.csv
./raw/ethereum/binance/2024/03/04.csv
./raw/ethereum/binance/2024/03/13.csv
./raw/ethereum/binance/2024/03/05.csv
./raw/ethereum/binance/2024/03/03.csv
./raw/ethereum/binance/2024/03/10.csv
./raw/ethereum/binance/2024/03/14.csv
./raw/ethereum/binance/2024/01/02.csv
./raw/ethereum/binance/2024/01/08.csv
./raw/ethereum/binance/2024/01/11.csv
./raw/ethereum/binance/2024/01/09.csv
./raw/ethereum/binance/2024/01/15.csv
... (3257 lines, showing first 50)
```
✅ Exit code: 0

- 📝 memang benar project yang digenerate ai pada sub bab 1.2 kemarin memiliki jumlah file 3255
**💻 Command:**
```bash
find -name .csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c cat -n total-csv.txt | tail -n 2 total-csv.txt
```

**🖥️ Output:**
```
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
total-csv.txt
total-file.txt
```
✅ Exit code: 0

**❌ 2026-01-08 12:55:06 - Status:** FAILED
**Reason:** kesalahan karena membaca ulang file dengan tail harusnya tidak perlu panggil file lagi

**💻 Command:**
```bash
bash -c cat -n total-csv.txt | tail -n 2
```

**🖥️ Output:**
```
     1	
```
✅ Exit code: 0

**💻 Command:**
```bash
cat total-csv.txt
```

**🖥️ Output:**
```
```
✅ Exit code: 0

- 📝 kosong karena saat ambil tidak menyertakan find dengan ./awal pencarian
**💻 Command:**
```bash
find . -name .csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
tail total-csv.txt
```

**🖥️ Output:**
```
```
✅ Exit code: 0

- 📝 ahh lupa wildcardnya
**💻 Command:**
```bash
find . -name *.csv
```

**🖥️ Output:**
```
./raw/ethereum/binance/2024/05/02.csv
./raw/ethereum/binance/2024/05/08.csv
./raw/ethereum/binance/2024/05/11.csv
./raw/ethereum/binance/2024/05/09.csv
./raw/ethereum/binance/2024/05/15.csv
./raw/ethereum/binance/2024/05/01.csv
./raw/ethereum/binance/2024/05/06.csv
./raw/ethereum/binance/2024/05/12.csv
./raw/ethereum/binance/2024/05/07.csv
./raw/ethereum/binance/2024/05/04.csv
./raw/ethereum/binance/2024/05/13.csv
./raw/ethereum/binance/2024/05/05.csv
./raw/ethereum/binance/2024/05/03.csv
./raw/ethereum/binance/2024/05/10.csv
./raw/ethereum/binance/2024/05/14.csv
./raw/ethereum/binance/2024/06/02.csv
./raw/ethereum/binance/2024/06/08.csv
./raw/ethereum/binance/2024/06/11.csv
./raw/ethereum/binance/2024/06/09.csv
./raw/ethereum/binance/2024/06/15.csv
./raw/ethereum/binance/2024/06/01.csv
./raw/ethereum/binance/2024/06/06.csv
./raw/ethereum/binance/2024/06/12.csv
./raw/ethereum/binance/2024/06/07.csv
./raw/ethereum/binance/2024/06/04.csv
./raw/ethereum/binance/2024/06/13.csv
./raw/ethereum/binance/2024/06/05.csv
./raw/ethereum/binance/2024/06/03.csv
./raw/ethereum/binance/2024/06/10.csv
./raw/ethereum/binance/2024/06/14.csv
./raw/ethereum/binance/2024/03/02.csv
./raw/ethereum/binance/2024/03/08.csv
./raw/ethereum/binance/2024/03/11.csv
./raw/ethereum/binance/2024/03/09.csv
./raw/ethereum/binance/2024/03/15.csv
./raw/ethereum/binance/2024/03/01.csv
./raw/ethereum/binance/2024/03/06.csv
./raw/ethereum/binance/2024/03/12.csv
./raw/ethereum/binance/2024/03/07.csv
./raw/ethereum/binance/2024/03/04.csv
./raw/ethereum/binance/2024/03/13.csv
./raw/ethereum/binance/2024/03/05.csv
./raw/ethereum/binance/2024/03/03.csv
./raw/ethereum/binance/2024/03/10.csv
./raw/ethereum/binance/2024/03/14.csv
./raw/ethereum/binance/2024/01/02.csv
./raw/ethereum/binance/2024/01/08.csv
./raw/ethereum/binance/2024/01/11.csv
./raw/ethereum/binance/2024/01/09.csv
./raw/ethereum/binance/2024/01/15.csv
... (3255 lines, showing first 50)
```
✅ Exit code: 0

**✅ 2026-01-08 13:07:27 - Status:** COMPLETED

**💻 Command:**
```bash
bash -c cat -n total-csv.txt | tail
```

**🖥️ Output:**
```
  3246	./processed/bitcoin/v3/data/btc_clean_3.csv
  3247	./processed/bitcoin/v3/data/btc_clean_4.csv
  3248	./processed/bitcoin/v3/data/btc_clean_5.csv
  3249	./processed/bitcoin/v3/data/btc_clean_2.csv
  3250	./processed/bitcoin/v3/data/btc_clean_1.csv
  3251	./processed/bitcoin/v1/data/btc_clean_3.csv
  3252	./processed/bitcoin/v1/data/btc_clean_4.csv
  3253	./processed/bitcoin/v1/data/btc_clean_5.csv
  3254	./processed/bitcoin/v1/data/btc_clean_2.csv
  3255	./processed/bitcoin/v1/data/btc_clean_1.csv
```
✅ Exit code: 0

**✅ 2026-01-08 13:09:31 - Status:** COMPLETED

- 📝 untuk data csv total ada 3255
**💻 Command:**
```bash
bash -c cat -n total-file.txt | tail
```

**🖥️ Output:**
```
  3247	./processed/bitcoin/v3/data/btc_clean_4.csv
  3248	./processed/bitcoin/v3/data/btc_clean_5.csv
  3249	./processed/bitcoin/v3/data/btc_clean_2.csv
  3250	./processed/bitcoin/v3/data/btc_clean_1.csv
  3251	./processed/bitcoin/v1/data/btc_clean_3.csv
  3252	./processed/bitcoin/v1/data/btc_clean_4.csv
  3253	./processed/bitcoin/v1/data/btc_clean_5.csv
  3254	./processed/bitcoin/v1/data/btc_clean_2.csv
  3255	./processed/bitcoin/v1/data/btc_clean_1.csv
  3256	./total-file.txt
```
✅ Exit code: 0

**✅ 2026-01-08 13:12:06 - Status:** COMPLETED

- 📝 untuk total file selain csv ada 3256 termasuk file untuk perhitungan ini
**💻 Command:**
```bash
du --max-depth=1
```

**🖥️ Output:**
```
14036	./raw
8	./logs
8	./metadata
96	./processed
14392	.
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -type f -empty
```

**🖥️ Output:**
```
```
✅ Exit code: 0

- 📝 tidak ada file yang kosong
**💻 Command:**
```bash
find . -type d -empty
```

**🖥️ Output:**
```
./logs/ingestion
./metadata/schemas
```
✅ Exit code: 0

- 📝 ada directory yang kosong
**✅ 2026-01-08 13:18:40 - Status:** COMPLETED

**💻 Command:**
```bash
find . -type d -empty -exec rmdir -v {} ;
```

**🖥️ Output:**
```
rmdir: removing directory, './logs/ingestion'
find: ‘./logs/ingestion’: No such file or directory
rmdir: removing directory, './metadata/schemas'
find: ‘./metadata/schemas’: No such file or directory
```
❌ Exit code: 1

- 📝 tidak bisa rmdir karena masih ada folder dalam folder
**💻 Command:**
```bash
find . -type d -empty -exec rm -Rv {} ;
```

**🖥️ Output:**
```
removed directory './logs'
find: ‘./logs’: No such file or directory
removed directory './metadata'
find: ‘./metadata’: No such file or directory
```
❌ Exit code: 1

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── processed
│   └── bitcoin
│       ├── latest -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3
│       ├── v1
│       │   └── data
│       │       ├── btc_clean_1.csv
│       │       ├── btc_clean_2.csv
│       │       ├── btc_clean_3.csv
│       │       ├── btc_clean_4.csv
│       │       └── btc_clean_5.csv
│       ├── v2
│       │   └── data
│       │       ├── btc_clean_1.csv
│       │       ├── btc_clean_2.csv
│       │       ├── btc_clean_3.csv
│       │       ├── btc_clean_4.csv
│       │       └── btc_clean_5.csv
│       └── v3
│           └── data
│               ├── btc_clean_1.csv
│               ├── btc_clean_2.csv
│               ├── btc_clean_3.csv
│               ├── btc_clean_4.csv
│               └── btc_clean_5.csv
├── raw
│   ├── bitcoin
│   │   ├── binance
│   │   │   ├── 2022
│   │   │   │   ├── 01
│   │   │   │   │   ├── 01.csv
│   │   │   │   │   ├── 02.csv
│   │   │   │   │   ├── 03.csv
│   │   │   │   │   ├── 04.csv
│   │   │   │   │   ├── 05.csv
│   │   │   │   │   ├── 06.csv
│   │   │   │   │   ├── 07.csv
│   │   │   │   │   ├── 08.csv
│   │   │   │   │   ├── 09.csv
│   │   │   │   │   ├── 10.csv
│   │   │   │   │   ├── 11.csv
│   │   │   │   │   ├── 12.csv
│   │   │   │   │   ├── 13.csv
│   │   │   │   │   ├── 14.csv
│   │   │   │   │   └── 15.csv
│   │   │   │   ├── 02
│   │   │   │   │   ├── 01.csv
│   │   │   │   │   ├── 02.csv
│   │   │   │   │   ├── 03.csv
│   │   │   │   │   ├── 04.csv
... (3538 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -L 1
```

**🖥️ Output:**
```
.
├── processed
├── raw
├── total-csv.txt
└── total-file.txt

3 directories, 2 files
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
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

**💻 Command:**
```bash
-type l -exec ls -l {} ;
```

**🖥️ Output:**
```
Command '-type' not found, did you mean:
  command 'wtype' from deb wtype (0.4-3)
  command 'mtype' from deb mtools (4.0.43-1)
Try: sudo apt install <deb name>
```
❌ Exit code: 127

**💻 Command:**
```bash
find -type l -exec ls -l {} ;
```

**🖥️ Output:**
```
lrwxrwxrwx 1 faris-al-fatih faris-al-fatih 117 Jan  8 12:31 ./bitcoin/latest -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3
```
✅ Exit code: 0

**💻 Command:**
```bash
find -type l -exec rm {} ;
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
└── bitcoin
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

8 directories, 15 files
```
✅ Exit code: 0

**💻 Command:**
```bash
find -mindepth 1 -maxdepth 1
```

**🖥️ Output:**
```
./raw
./total-csv.txt
./processed
./total-file.txt
```
✅ Exit code: 0

**💻 Command:**
```bash
find -mindepth 1 -maxdepth 1 -name find -mindepth 1 -maxdepth 1raw
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
find -mindepth 1 -maxdepth 1 -name ! *raw
```

**🖥️ Output:**
```
find: paths must precede expression: `*raw'
```
❌ Exit code: 1

**💻 Command:**
```bash
find -mindepth 1 -maxdepth 1 -name ! raw
```

**🖥️ Output:**
```
find: paths must precede expression: `raw'
find: possible unquoted pattern after predicate `-name'?
```
❌ Exit code: 1

**💻 Command:**
```bash
find -mindepth 1 -maxdepth 1 ! -name raw
```

**🖥️ Output:**
```
./total-csv.txt
./processed
./total-file.txt
```
✅ Exit code: 0

**💻 Command:**
```bash
find -mindepth 1 -maxdepth 1 ! -name raw -exec rm -v {} ;
```

**🖥️ Output:**
```
removed './total-csv.txt'
rm: cannot remove './processed': Is a directory
removed './total-file.txt'
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── processed
│   └── bitcoin
│       ├── v1
│       │   └── data
│       │       ├── btc_clean_1.csv
│       │       ├── btc_clean_2.csv
│       │       ├── btc_clean_3.csv
│       │       ├── btc_clean_4.csv
│       │       └── btc_clean_5.csv
│       ├── v2
│       │   └── data
│       │       ├── btc_clean_1.csv
│       │       ├── btc_clean_2.csv
│       │       ├── btc_clean_3.csv
│       │       ├── btc_clean_4.csv
│       │       └── btc_clean_5.csv
│       └── v3
│           └── data
│               ├── btc_clean_1.csv
│               ├── btc_clean_2.csv
│               ├── btc_clean_3.csv
│               ├── btc_clean_4.csv
│               └── btc_clean_5.csv
└── raw
    ├── bitcoin
    │   ├── binance
    │   │   ├── 2022
    │   │   │   ├── 01
    │   │   │   │   ├── 01.csv
    │   │   │   │   ├── 02.csv
    │   │   │   │   ├── 03.csv
    │   │   │   │   ├── 04.csv
    │   │   │   │   ├── 05.csv
    │   │   │   │   ├── 06.csv
    │   │   │   │   ├── 07.csv
    │   │   │   │   ├── 08.csv
    │   │   │   │   ├── 09.csv
    │   │   │   │   ├── 10.csv
    │   │   │   │   ├── 11.csv
    │   │   │   │   ├── 12.csv
    │   │   │   │   ├── 13.csv
    │   │   │   │   ├── 14.csv
    │   │   │   │   └── 15.csv
    │   │   │   ├── 02
    │   │   │   │   ├── 01.csv
    │   │   │   │   ├── 02.csv
    │   │   │   │   ├── 03.csv
    │   │   │   │   ├── 04.csv
    │   │   │   │   ├── 05.csv
... (3535 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -L 1
```

**🖥️ Output:**
```
.
├── processed
└── raw

3 directories, 0 files
```
✅ Exit code: 0

**💻 Command:**
```bash
rm -v processed/
```

**🖥️ Output:**
```
rm: cannot remove 'processed/': Is a directory
```
❌ Exit code: 1

**💻 Command:**
```bash
rm -vR processed/
```

**🖥️ Output:**
```
removed 'processed/bitcoin/v2/data/btc_clean_3.csv'
removed 'processed/bitcoin/v2/data/btc_clean_4.csv'
removed 'processed/bitcoin/v2/data/btc_clean_5.csv'
removed 'processed/bitcoin/v2/data/btc_clean_2.csv'
removed 'processed/bitcoin/v2/data/btc_clean_1.csv'
removed directory 'processed/bitcoin/v2/data'
removed directory 'processed/bitcoin/v2'
removed 'processed/bitcoin/v3/data/btc_clean_3.csv'
removed 'processed/bitcoin/v3/data/btc_clean_4.csv'
removed 'processed/bitcoin/v3/data/btc_clean_5.csv'
removed 'processed/bitcoin/v3/data/btc_clean_2.csv'
removed 'processed/bitcoin/v3/data/btc_clean_1.csv'
removed directory 'processed/bitcoin/v3/data'
removed directory 'processed/bitcoin/v3'
removed 'processed/bitcoin/v1/data/btc_clean_3.csv'
removed 'processed/bitcoin/v1/data/btc_clean_4.csv'
removed 'processed/bitcoin/v1/data/btc_clean_5.csv'
removed 'processed/bitcoin/v1/data/btc_clean_2.csv'
removed 'processed/bitcoin/v1/data/btc_clean_1.csv'
removed directory 'processed/bitcoin/v1/data'
removed directory 'processed/bitcoin/v1'
removed directory 'processed/bitcoin'
removed directory 'processed/'
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -L 1
```

**🖥️ Output:**
```
.
└── raw

2 directories, 0 files
```
✅ Exit code: 0

- 📝 saya rasa untuk latihan mending ambil data dari raw saja deh
**💻 Command:**
```bash
completed
```

**🖥️ Output:**
```
**✅ 2026-01-08 13:57:40 - Status:** COMPLETED

```
✅ Exit code: 0

**✅ 2026-01-08 13:57:52 - Status:** COMPLETED

- 📝 mari kita hitung dan klasifikasi fulu yang ada
**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/02-pencarian-dan-filtering/1-1_pencarian-file/raw
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -L 4
```

**🖥️ Output:**
```
.
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
│   └── kraken
│       ├── 2022
│       │   ├── 01
│       │   ├── 02
... (271 lines, showing first 50)
```
✅ Exit code: 0

- 📝 disini kan projectnya generatif jadi datanya pasti sama, ini asumsinya angka ini adalah bulan
- 📝 data belum lengkap, tapi karena ini adalah latihan saya coba menggabungkan keseluruhan data langsung walaupun tidak lengkap
**💻 Command:**
```bash
find . -mindepth 4 -type d
```

**🖥️ Output:**
```
./ethereum/binance/2024/05
./ethereum/binance/2024/06
./ethereum/binance/2024/03
./ethereum/binance/2024/01
./ethereum/binance/2024/04
./ethereum/binance/2024/02
./ethereum/binance/2022/05
./ethereum/binance/2022/06
./ethereum/binance/2022/03
./ethereum/binance/2022/01
./ethereum/binance/2022/04
./ethereum/binance/2022/02
./ethereum/binance/2023/05
./ethereum/binance/2023/06
./ethereum/binance/2023/03
./ethereum/binance/2023/01
./ethereum/binance/2023/04
./ethereum/binance/2023/02
./ethereum/kraken/2024/05
./ethereum/kraken/2024/06
./ethereum/kraken/2024/03
./ethereum/kraken/2024/01
./ethereum/kraken/2024/04
./ethereum/kraken/2024/02
./ethereum/kraken/2022/05
./ethereum/kraken/2022/06
./ethereum/kraken/2022/03
./ethereum/kraken/2022/01
./ethereum/kraken/2022/04
./ethereum/kraken/2022/02
./ethereum/kraken/2023/05
./ethereum/kraken/2023/06
./ethereum/kraken/2023/03
./ethereum/kraken/2023/01
./ethereum/kraken/2023/04
./ethereum/kraken/2023/02
./ethereum/coinbase/2024/05
./ethereum/coinbase/2024/06
./ethereum/coinbase/2024/03
./ethereum/coinbase/2024/01
./ethereum/coinbase/2024/04
./ethereum/coinbase/2024/02
./ethereum/coinbase/2022/05
./ethereum/coinbase/2022/06
./ethereum/coinbase/2022/03
./ethereum/coinbase/2022/01
./ethereum/coinbase/2022/04
./ethereum/coinbase/2022/02
./ethereum/coinbase/2023/05
./ethereum/coinbase/2023/06
... (216 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -mindepth 5 -type d
```

**🖥️ Output:**
```
```
✅ Exit code: 0

- 📝 kedalaman folder adalah 4, file ada dikedalaman 5
**💻 Command:**
```bash
head -n 1 01/01.csv
```

**🖥️ Output:**
```
timestamp,open,high,low,close,volume
```
✅ Exit code: 0

**💻 Command:**
```bash
find -name *.csv ! -name 2022.csv
```

**🖥️ Output:**
```
./05/02.csv
./05/08.csv
./05/11.csv
./05/09.csv
./05/15.csv
./05/01.csv
./05/06.csv
./05/12.csv
./05/07.csv
./05/04.csv
./05/13.csv
./05/05.csv
./05/03.csv
./05/10.csv
./05/14.csv
./06/02.csv
./06/08.csv
./06/11.csv
./06/09.csv
./06/15.csv
./06/01.csv
./06/06.csv
./06/12.csv
./06/07.csv
./06/04.csv
./06/13.csv
./06/05.csv
./06/03.csv
./06/10.csv
./06/14.csv
./03/02.csv
./03/08.csv
./03/11.csv
./03/09.csv
./03/15.csv
./03/01.csv
./03/06.csv
./03/12.csv
./03/07.csv
./03/04.csv
./03/13.csv
./03/05.csv
./03/03.csv
./03/10.csv
./03/14.csv
./01/02.csv
./01/08.csv
./01/11.csv
./01/09.csv
./01/15.csv
... (90 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c find -name *.csv ! -name 2022.csv| sort | tail -n +2 >> 2022.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c find . -name *.csv ! -name 2022.csv| sort | tail -n +2 >> 2022.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c find . -name *.csv ! -name 2022.csv| sort | xargs tail -n +2 >> 2022.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c find . -name *.csv ! -name 2022.csv| sort
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c find  -name *.csv ! -name 2022.csv| sort
```

**🖥️ Output:**
```
```
✅ Exit code: 0

- 📝 fungsi run pada learnlog.sh yang menghalanginya kenapanya masih belum paham
**💻 Command:**
```bash
bash -c cat -n 2022.csv | tail
```

**🖥️ Output:**
```
   261	Mon Jan  5 12:15:32 WIB 2026,100,120,90,110,99999
   262	
   263	==> ./06/13.csv <==
   264	Mon Jan  5 12:15:32 WIB 2026,100,120,90,110,99999
   265	
   266	==> ./06/14.csv <==
   267	Mon Jan  5 12:15:32 WIB 2026,100,120,90,110,99999
   268	
   269	==> ./06/15.csv <==
   270	Mon Jan  5 12:15:32 WIB 2026,100,120,90,110,99999
```
✅ Exit code: 0

**💻 Command:**
```bash
cat 01/01.csv
```

**🖥️ Output:**
```
timestamp,open,high,low,close,volume
Mon Jan  5 12:15:31 WIB 2026,100,120,90,110,99999
```
✅ Exit code: 0

- 📝 lupa kasih -q agar namanya tidak ikut dipanggil
**💻 Command:**
```bash
01/01.csv
```

**🖥️ Output:**
```
-bash: 01/01.csv: Permission denied
```
❌ Exit code: 126

**💻 Command:**
```bash
head -n 1 01/01.csv
```

**🖥️ Output:**
```
timestamp,open,high,low,close,volume
```
✅ Exit code: 0

**💻 Command:**
```bash
cat 2022.csv
```

**🖥️ Output:**
```
timestamp,open,high,low,close,volume
```
✅ Exit code: 0

- 📝 data direset ulang
**💻 Command:**
```bash
bash -c find . -name *.csv ! -name 2022.csv| sort | xargs tail -n +2 -q >> 2022.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
head 2022.csv
```

**🖥️ Output:**
```
timestamp,open,high,low,close,volume
Mon Jan  5 12:15:31 WIB 2026,100,120,90,110,99999
Mon Jan  5 12:15:31 WIB 2026,100,120,90,110,99999
Mon Jan  5 12:15:31 WIB 2026,100,120,90,110,99999
Mon Jan  5 12:15:31 WIB 2026,100,120,90,110,99999
Mon Jan  5 12:15:31 WIB 2026,100,120,90,110,99999
Mon Jan  5 12:15:31 WIB 2026,100,120,90,110,99999
Mon Jan  5 12:15:31 WIB 2026,100,120,90,110,99999
Mon Jan  5 12:15:32 WIB 2026,100,120,90,110,99999
Mon Jan  5 12:15:32 WIB 2026,100,120,90,110,99999
```
✅ Exit code: 0

- 📝 karena datanya generate ai ya begitulah hasilnya sama semua, tp lumayan lah ya tau gimana cara gabungin data
**💻 Command:**
```bash
tree -L 2 ..
```

**🖥️ Output:**
```
..
├── 2022
│   ├── 01
│   ├── 02
│   ├── 03
│   ├── 04
│   ├── 05
│   ├── 06
│   └── 2022.csv
├── 2023
│   ├── 01
│   ├── 02
│   ├── 03
│   ├── 04
│   ├── 05
│   └── 06
└── 2024
    ├── 01
    ├── 02
    ├── 03
    ├── 04
    ├── 05
    └── 06

22 directories, 1 file
```
✅ Exit code: 0

**💻 Command:**
```bash
mv -r 2022.csv ..
```

**🖥️ Output:**
```
mv: invalid option -- 'r'
Try 'mv --help' for more information.
```
❌ Exit code: 1

**💻 Command:**
```bash
mv -v 2022.csv ..
```

**🖥️ Output:**
```
renamed '2022.csv' -> '../2022.csv'
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -L 2
```

**🖥️ Output:**
```
.
├── 2022
│   ├── 01
│   ├── 02
│   ├── 03
│   ├── 04
│   ├── 05
│   └── 06
├── 2022.csv
├── 2023
│   ├── 01
│   ├── 02
│   ├── 03
│   ├── 04
│   ├── 05
│   └── 06
└── 2024
    ├── 01
    ├── 02
    ├── 03
    ├── 04
    ├── 05
    └── 06

22 directories, 1 file
```
✅ Exit code: 0

**💻 Command:**
```bash
rm -Rv 2022
```

**🖥️ Output:**
```
removed '2022/05/02.csv'
removed '2022/05/08.csv'
removed '2022/05/11.csv'
removed '2022/05/09.csv'
removed '2022/05/15.csv'
removed '2022/05/01.csv'
removed '2022/05/06.csv'
removed '2022/05/12.csv'
removed '2022/05/07.csv'
removed '2022/05/04.csv'
removed '2022/05/13.csv'
removed '2022/05/05.csv'
removed '2022/05/03.csv'
removed '2022/05/10.csv'
removed '2022/05/14.csv'
removed directory '2022/05'
removed '2022/06/02.csv'
removed '2022/06/08.csv'
removed '2022/06/11.csv'
removed '2022/06/09.csv'
removed '2022/06/15.csv'
removed '2022/06/01.csv'
removed '2022/06/06.csv'
removed '2022/06/12.csv'
removed '2022/06/07.csv'
removed '2022/06/04.csv'
removed '2022/06/13.csv'
removed '2022/06/05.csv'
removed '2022/06/03.csv'
removed '2022/06/10.csv'
removed '2022/06/14.csv'
removed directory '2022/06'
removed '2022/03/02.csv'
removed '2022/03/08.csv'
removed '2022/03/11.csv'
removed '2022/03/09.csv'
removed '2022/03/15.csv'
removed '2022/03/01.csv'
removed '2022/03/06.csv'
removed '2022/03/12.csv'
removed '2022/03/07.csv'
removed '2022/03/04.csv'
removed '2022/03/13.csv'
removed '2022/03/05.csv'
removed '2022/03/03.csv'
removed '2022/03/10.csv'
removed '2022/03/14.csv'
removed directory '2022/03'
removed '2022/01/02.csv'
removed '2022/01/08.csv'
... (97 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -L 2
```

**🖥️ Output:**
```
.
├── 2022.csv
├── 2023
│   ├── 01
│   ├── 02
│   ├── 03
│   ├── 04
│   ├── 05
│   └── 06
└── 2024
    ├── 01
    ├── 02
    ├── 03
    ├── 04
    ├── 05
    └── 06

15 directories, 1 file
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c find . -name *.csv ! -name 2022.csv| sort
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c (find . -name *.csv ! -name 2022.csv| sort)
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c find . -name "*.csv" ! -name "2022.csv"| sort
```

**🖥️ Output:**
```
./2023/01/01.csv
./2023/01/02.csv
./2023/01/03.csv
./2023/01/04.csv
./2023/01/05.csv
./2023/01/06.csv
./2023/01/07.csv
./2023/01/08.csv
./2023/01/09.csv
./2023/01/10.csv
./2023/01/11.csv
./2023/01/12.csv
./2023/01/13.csv
./2023/01/14.csv
./2023/01/15.csv
./2023/02/01.csv
./2023/02/02.csv
./2023/02/03.csv
./2023/02/04.csv
./2023/02/05.csv
./2023/02/06.csv
./2023/02/07.csv
./2023/02/08.csv
./2023/02/09.csv
./2023/02/10.csv
./2023/02/11.csv
./2023/02/12.csv
./2023/02/13.csv
./2023/02/14.csv
./2023/02/15.csv
./2023/03/01.csv
./2023/03/02.csv
./2023/03/03.csv
./2023/03/04.csv
./2023/03/05.csv
./2023/03/06.csv
./2023/03/07.csv
./2023/03/08.csv
./2023/03/09.csv
./2023/03/10.csv
./2023/03/11.csv
./2023/03/12.csv
./2023/03/13.csv
./2023/03/14.csv
./2023/03/15.csv
./2023/04/01.csv
./2023/04/02.csv
./2023/04/03.csv
./2023/04/04.csv
./2023/04/05.csv
... (180 lines, showing first 50)
```
✅ Exit code: 0

- 📝 ohh jadi karena tanda petiknya bentrok mangkannya tidak bisa gunakan fungsi run
**💻 Command:**
```bash
head -n 1 2022.csv
```

**🖥️ Output:**
```
timestamp,open,high,low,close,volume
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c find . -name "*.csv" ! -name "2022.csv"| sort | xargs tail -n +2 -q >> 2023-2024.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

- 📝 nungkin karena >> bentrok ya
**💻 Command:**
```bash
tail -n +2 2022.csv
```

**🖥️ Output:**
```
- 📝 karena saya melakukan prmrosesan dan ini keluar dalam skup materi saya akan hentikan sampai disini karena untuk proccess belum masuk babnya, ini tadi saya coba dan hasilnya hancur terminal mendadak stop
**✨ What I learned:**

