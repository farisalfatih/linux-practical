# Learning Log

Started: 2026-01-08

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/02-pencarian-dan-filtering/2-1_pencarian-file
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd -P
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem
```
✅ Exit code: 0


---

## 📚 2026-01-08 19:35:04 - Exercise: find (cari file berdasarkan kriteria)

**🎯 Objective:** mengetahui apa itu opsi, expression, dan aksi pada find serta mengetahui apa yang sering digunakan sebagai data engenering


### 2026-01-08 19:39:32 - option
**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/02-pencarian-dan-filtering/2-1_pencarian-file/chaos-data-lake
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/02-pencarian-dan-filtering/2-1_pencarian-file/chaos-data-lake/processed
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
find . -name *1* -type f
```

**🖥️ Output:**
```
./bitcoin/v2/data/btc_clean_1.csv
./bitcoin/v3/data/btc_clean_1.csv
./bitcoin/v1/data/btc_clean_1.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
find -L . -name *1* -type f
```

**🖥️ Output:**
```
./bitcoin/latest/data/btc_clean_1.csv
./bitcoin/v2/data/btc_clean_1.csv
./bitcoin/v3/data/btc_clean_1.csv
./bitcoin/v1/data/btc_clean_1.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
ln -sv /bitcoin/v2 bitcoin/latest-2
```

**🖥️ Output:**
```
'bitcoin/latest-2' -> '/bitcoin/v2'
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
    ├── latest-2 -> /bitcoin/v2
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

9 directories, 16 files
```
✅ Exit code: 0

**💻 Command:**
```bash
rm -v bitcoin/latest-2
```

**🖥️ Output:**
```
removed 'bitcoin/latest-2'
```
✅ Exit code: 0

**💻 Command:**
```bash
realpath bitcoin/v2/
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v2
```
✅ Exit code: 0

**💻 Command:**
```bash
ln -sv /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v2 bitcoin/latest2
```

**🖥️ Output:**
```
'bitcoin/latest2' -> '/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v2'
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
    ├── latest2 -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v2
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

10 directories, 15 files
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -name *1* -type f
```

**🖥️ Output:**
```
./bitcoin/v2/data/btc_clean_1.csv
./bitcoin/v3/data/btc_clean_1.csv
./bitcoin/v1/data/btc_clean_1.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
find -L . -name *1* -type f
```

**🖥️ Output:**
```
./bitcoin/latest2/data/btc_clean_1.csv
./bitcoin/latest/data/btc_clean_1.csv
./bitcoin/v2/data/btc_clean_1.csv
./bitcoin/v3/data/btc_clean_1.csv
./bitcoin/v1/data/btc_clean_1.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
find -H bitcoin/latest . -name *1* -type f
```

**🖥️ Output:**
```
bitcoin/latest/data/btc_clean_1.csv
./bitcoin/v2/data/btc_clean_1.csv
./bitcoin/v3/data/btc_clean_1.csv
./bitcoin/v1/data/btc_clean_1.csv
```
✅ Exit code: 0

**✅ 2026-01-08 20:00:09 - Status:** COMPLETED

**✨ What I learned:**
- -P adalah default untuk find yang artinya jangan pernah ikuti simbolic link
- -L digunakan untuk mengikuti simbolic link
- -H digunakan untuk hanya mengikuti simbolic link yang sudah disebutkan dalam command


### 2026-01-08 20:04:01 - expression
**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/02-pencarian-dan-filtering/2-1_pencarian-file/chaos-data-lake
```
✅ Exit code: 0

**📂 Context:**

- Skenario ini dijalankan pada direktori:
  ```
  /home/faris-al-fatih/linux-practical/lab/02-pencarian-dan-filtering/2-1_pencarian-file/chaos-data-lake
  ```
- Catatan:
  - Tidak ada perintah `cd` yang dijalankan.
  - Semua command menggunakan working directory aktif saat ini.
  - Perubahan direktori **tidak otomatis tercatat** kecuali kamu eksplisit menjalankan `cd`.

**💻 Command:**
```bash
stat raw/
```

**🖥️ Output:**
```
  File: raw/
  Size: 4096      	Blocks: 8          IO Block: 4096   directory
Device: 8,48	Inode: 88257       Links: 6
Access: (0755/drwxr-xr-x)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-08 15:32:33.529059931 +0700
Modify: 2026-01-05 12:15:41.160805193 +0700
Change: 2026-01-05 12:15:41.160805193 +0700
 Birth: 2026-01-05 12:15:31.935092149 +0700
```
✅ Exit code: 0

**💻 Command:**
```bash
stat processed/bitcoin/v3/data/btc_clean_1.csv
```

**🖥️ Output:**
```
  File: processed/bitcoin/v3/data/btc_clean_1.csv
  Size: 13        	Blocks: 8          IO Block: 4096   regular file
Device: 8,48	Inode: 137486      Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-08 12:31:24.954514421 +0700
Modify: 2026-01-05 12:15:44.379377813 +0700
Change: 2026-01-05 12:15:44.379377813 +0700
 Birth: 2026-01-05 12:15:44.379377813 +0700
```
✅ Exit code: 0

**📂 Context:**

- Skenario ini dijalankan pada direktori:
  ```
  /home/faris-al-fatih/linux-practical/lab/02-pencarian-dan-filtering/2-1_pencarian-file/chaos-data-lake
  ```
- Catatan:
  - Tidak ada perintah `cd` yang dijalankan.
  - Semua command menggunakan working directory aktif saat ini.
  - Perubahan direktori **tidak otomatis tercatat** kecuali kamu eksplisit menjalankan `cd`.

**💻 Command:**
```bash
find -name btc* -type f -mtime -1 -size +10
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
find -name btc* -type f -mtime -1 -size +10K
```

**🖥️ Output:**
```
find: invalid -size type `K'
```
❌ Exit code: 1

**💻 Command:**
```bash
find -name btc* -type f -mtime -7
```

**🖥️ Output:**
```
./processed/bitcoin/v2/data/btc_clean_3.csv
./processed/bitcoin/v2/data/btc_clean_4.csv
./processed/bitcoin/v2/data/btc_clean_5.csv
./processed/bitcoin/v2/data/btc_clean_2.csv
./processed/bitcoin/v2/data/btc_clean_1.csv
./processed/bitcoin/v3/data/btc_clean_3.csv
./processed/bitcoin/v3/data/btc_clean_4.csv
./processed/bitcoin/v3/data/btc_clean_5.csv
./processed/bitcoin/v3/data/btc_clean_2.csv
./processed/bitcoin/v3/data/btc_clean_1.csv
./processed/bitcoin/v1/data/btc_clean_3.csv
./processed/bitcoin/v1/data/btc_clean_4.csv
./processed/bitcoin/v1/data/btc_clean_5.csv
./processed/bitcoin/v1/data/btc_clean_2.csv
./processed/bitcoin/v1/data/btc_clean_1.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
find -name btc* -type f -mtime -7
```

**🖥️ Output:**
```
./processed/bitcoin/v2/data/btc_clean_3.csv
./processed/bitcoin/v2/data/btc_clean_4.csv
./processed/bitcoin/v2/data/btc_clean_5.csv
./processed/bitcoin/v2/data/btc_clean_2.csv
./processed/bitcoin/v2/data/btc_clean_1.csv
./processed/bitcoin/v3/data/btc_clean_3.csv
./processed/bitcoin/v3/data/btc_clean_4.csv
./processed/bitcoin/v3/data/btc_clean_5.csv
./processed/bitcoin/v3/data/btc_clean_2.csv
./processed/bitcoin/v3/data/btc_clean_1.csv
./processed/bitcoin/v1/data/btc_clean_3.csv
./processed/bitcoin/v1/data/btc_clean_4.csv
./processed/bitcoin/v1/data/btc_clean_5.csv
./processed/bitcoin/v1/data/btc_clean_2.csv
./processed/bitcoin/v1/data/btc_clean_1.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c find -name "btc*" -type f -mtime -7 | sort
```

**🖥️ Output:**
```
./processed/bitcoin/v1/data/btc_clean_1.csv
./processed/bitcoin/v1/data/btc_clean_2.csv
./processed/bitcoin/v1/data/btc_clean_3.csv
./processed/bitcoin/v1/data/btc_clean_4.csv
./processed/bitcoin/v1/data/btc_clean_5.csv
./processed/bitcoin/v2/data/btc_clean_1.csv
./processed/bitcoin/v2/data/btc_clean_2.csv
./processed/bitcoin/v2/data/btc_clean_3.csv
./processed/bitcoin/v2/data/btc_clean_4.csv
./processed/bitcoin/v2/data/btc_clean_5.csv
./processed/bitcoin/v3/data/btc_clean_1.csv
./processed/bitcoin/v3/data/btc_clean_2.csv
./processed/bitcoin/v3/data/btc_clean_3.csv
./processed/bitcoin/v3/data/btc_clean_4.csv
./processed/bitcoin/v3/data/btc_clean_5.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -size +7
```

**🖥️ Output:**
```
.
./raw
./raw/ethereum
./raw/ethereum/binance
./raw/ethereum/binance/2024
./raw/ethereum/binance/2024/05
./raw/ethereum/binance/2024/06
./raw/ethereum/binance/2024/03
./raw/ethereum/binance/2024/01
./raw/ethereum/binance/2024/04
./raw/ethereum/binance/2024/02
./raw/ethereum/binance/2022
./raw/ethereum/binance/2022/05
./raw/ethereum/binance/2022/06
./raw/ethereum/binance/2022/03
./raw/ethereum/binance/2022/01
./raw/ethereum/binance/2022/04
./raw/ethereum/binance/2022/02
./raw/ethereum/binance/2023
./raw/ethereum/binance/2023/05
./raw/ethereum/binance/2023/06
./raw/ethereum/binance/2023/03
./raw/ethereum/binance/2023/01
./raw/ethereum/binance/2023/04
./raw/ethereum/binance/2023/02
./raw/ethereum/kraken
./raw/ethereum/kraken/2024
./raw/ethereum/kraken/2024/05
./raw/ethereum/kraken/2024/06
./raw/ethereum/kraken/2024/03
./raw/ethereum/kraken/2024/01
./raw/ethereum/kraken/2024/04
./raw/ethereum/kraken/2024/02
./raw/ethereum/kraken/2022
./raw/ethereum/kraken/2022/05
./raw/ethereum/kraken/2022/06
./raw/ethereum/kraken/2022/03
./raw/ethereum/kraken/2022/01
./raw/ethereum/kraken/2022/04
./raw/ethereum/kraken/2022/02
./raw/ethereum/kraken/2023
./raw/ethereum/kraken/2023/05
./raw/ethereum/kraken/2023/06
./raw/ethereum/kraken/2023/03
./raw/ethereum/kraken/2023/01
./raw/ethereum/kraken/2023/04
./raw/ethereum/kraken/2023/02
./raw/ethereum/coinbase
./raw/ethereum/coinbase/2024
./raw/ethereum/coinbase/2024/05
... (282 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -empty
```

**🖥️ Output:**
```
./logs/ingestion
./metadata/schemas
```
✅ Exit code: 0

**💻 Command:**
```bash
mkdir oke
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
mkdir -v josjis
```

**🖥️ Output:**
```
mkdir: created directory 'josjis'
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -newer oke
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -newer oke/
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -newer -type -d oke/
```

**🖥️ Output:**
```
find: ‘-type’: No such file or directory
```
❌ Exit code: 1

**💻 Command:**
```bash
rmdir -v oke/ josjis/
```

**🖥️ Output:**
```
rmdir: removing directory, 'oke/'
rmdir: removing directory, 'josjis/'
```
✅ Exit code: 0

**💻 Command:**
```bash
touch oke.json
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
touch josjis.json
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -newer oke.json
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -newer raw/
```

**🖥️ Output:**
```
.
./oke.json
./raw/ethereum/kraken/2024
./raw/ethereum/kraken/2024/05
./raw/ethereum/kraken/2024/05/02.csv
./raw/ethereum/kraken/2024/05/08.csv
./raw/ethereum/kraken/2024/05/11.csv
./raw/ethereum/kraken/2024/05/09.csv
./raw/ethereum/kraken/2024/05/15.csv
./raw/ethereum/kraken/2024/05/01.csv
./raw/ethereum/kraken/2024/05/06.csv
./raw/ethereum/kraken/2024/05/12.csv
./raw/ethereum/kraken/2024/05/07.csv
./raw/ethereum/kraken/2024/05/04.csv
./raw/ethereum/kraken/2024/05/13.csv
./raw/ethereum/kraken/2024/05/05.csv
./raw/ethereum/kraken/2024/05/03.csv
./raw/ethereum/kraken/2024/05/10.csv
./raw/ethereum/kraken/2024/05/14.csv
./raw/ethereum/kraken/2024/06
./raw/ethereum/kraken/2024/06/02.csv
./raw/ethereum/kraken/2024/06/08.csv
./raw/ethereum/kraken/2024/06/11.csv
./raw/ethereum/kraken/2024/06/09.csv
./raw/ethereum/kraken/2024/06/15.csv
./raw/ethereum/kraken/2024/06/01.csv
./raw/ethereum/kraken/2024/06/06.csv
./raw/ethereum/kraken/2024/06/12.csv
./raw/ethereum/kraken/2024/06/07.csv
./raw/ethereum/kraken/2024/06/04.csv
./raw/ethereum/kraken/2024/06/13.csv
./raw/ethereum/kraken/2024/06/05.csv
./raw/ethereum/kraken/2024/06/03.csv
./raw/ethereum/kraken/2024/06/10.csv
./raw/ethereum/kraken/2024/06/14.csv
./raw/ethereum/kraken/2024/03
./raw/ethereum/kraken/2024/03/11.csv
./raw/ethereum/kraken/2024/03/15.csv
./raw/ethereum/kraken/2024/03/12.csv
./raw/ethereum/kraken/2024/03/13.csv
./raw/ethereum/kraken/2024/03/14.csv
./raw/ethereum/kraken/2024/04
./raw/ethereum/kraken/2024/04/02.csv
./raw/ethereum/kraken/2024/04/08.csv
./raw/ethereum/kraken/2024/04/11.csv
./raw/ethereum/kraken/2024/04/09.csv
./raw/ethereum/kraken/2024/04/15.csv
./raw/ethereum/kraken/2024/04/01.csv
./raw/ethereum/kraken/2024/04/06.csv
./raw/ethereum/kraken/2024/04/12.csv
... (1028 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -newer oke.json
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
stat oke.json n josjis.json
```

**🖥️ Output:**
```
  File: oke.json
  Size: 0         	Blocks: 0          IO Block: 4096   regular empty file
Device: 8,48	Inode: 51858       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-08 20:21:03.438112403 +0700
Modify: 2026-01-08 20:21:03.438112403 +0700
Change: 2026-01-08 20:21:03.438112403 +0700
 Birth: 2026-01-08 20:21:03.438112403 +0700
stat: cannot statx 'n': No such file or directory
  File: josjis.json
  Size: 0         	Blocks: 0          IO Block: 4096   regular empty file
Device: 8,48	Inode: 64359       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-08 20:20:59.668649203 +0700
Modify: 2026-01-08 20:20:59.668649203 +0700
Change: 2026-01-08 20:20:59.668649203 +0700
 Birth: 2026-01-08 20:20:59.668649203 +0700
```
❌ Exit code: 1

**💻 Command:**
```bash
rm -v oke.json josjis.json
```

**🖥️ Output:**
```
removed 'oke.json'
removed 'josjis.json'
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -mindepth 1 -maxdept 3
```

**🖥️ Output:**
```
find: unknown predicate `-maxdept'
```
❌ Exit code: 1

**💻 Command:**
```bash
find . -mindepth 1 -maxdepth 3
```

**🖥️ Output:**
```
./raw
./raw/ethereum
./raw/ethereum/binance
./raw/ethereum/kraken
./raw/ethereum/coinbase
./raw/solana
./raw/solana/binance
./raw/solana/kraken
./raw/solana/coinbase
./raw/cardano
./raw/cardano/binance
./raw/cardano/kraken
./raw/cardano/coinbase
./raw/bitcoin
./raw/bitcoin/binance
./raw/bitcoin/kraken
./raw/bitcoin/coinbase
./logs
./logs/ingestion
./metadata
./metadata/schemas
./processed
./processed/bitcoin
./processed/bitcoin/latest2
./processed/bitcoin/latest
./processed/bitcoin/v2
./processed/bitcoin/v3
./processed/bitcoin/v1
```
✅ Exit code: 0

**✅ 2026-01-08 20:25:43 - Status:** COMPLETED

**✨ What I learned:**
- dalam linux semua adalah file
- semua expression dapat digabungkan sesuai kebutuhan
- espression yang sering digunakan sudah jelas ada di README.md


### 2026-01-08 20:27:20 - action
**💻 Command:**
```bash
find . -name raw -exec du -h {} /
```

**🖥️ Output:**
```
find: missing argument to `-exec'
```
❌ Exit code: 1

**💻 Command:**
```bash
find . -name raw -exec du -h {} ;
```

**🖥️ Output:**
```
64K	./raw/ethereum/binance/2024/05
64K	./raw/ethereum/binance/2024/06
64K	./raw/ethereum/binance/2024/03
64K	./raw/ethereum/binance/2024/01
64K	./raw/ethereum/binance/2024/04
64K	./raw/ethereum/binance/2024/02
388K	./raw/ethereum/binance/2024
64K	./raw/ethereum/binance/2022/05
64K	./raw/ethereum/binance/2022/06
64K	./raw/ethereum/binance/2022/03
64K	./raw/ethereum/binance/2022/01
64K	./raw/ethereum/binance/2022/04
64K	./raw/ethereum/binance/2022/02
388K	./raw/ethereum/binance/2022
64K	./raw/ethereum/binance/2023/05
64K	./raw/ethereum/binance/2023/06
64K	./raw/ethereum/binance/2023/03
64K	./raw/ethereum/binance/2023/01
64K	./raw/ethereum/binance/2023/04
64K	./raw/ethereum/binance/2023/02
388K	./raw/ethereum/binance/2023
1.2M	./raw/ethereum/binance
64K	./raw/ethereum/kraken/2024/05
64K	./raw/ethereum/kraken/2024/06
64K	./raw/ethereum/kraken/2024/03
64K	./raw/ethereum/kraken/2024/01
64K	./raw/ethereum/kraken/2024/04
64K	./raw/ethereum/kraken/2024/02
388K	./raw/ethereum/kraken/2024
64K	./raw/ethereum/kraken/2022/05
64K	./raw/ethereum/kraken/2022/06
64K	./raw/ethereum/kraken/2022/03
64K	./raw/ethereum/kraken/2022/01
64K	./raw/ethereum/kraken/2022/04
64K	./raw/ethereum/kraken/2022/02
388K	./raw/ethereum/kraken/2022
64K	./raw/ethereum/kraken/2023/05
64K	./raw/ethereum/kraken/2023/06
64K	./raw/ethereum/kraken/2023/03
64K	./raw/ethereum/kraken/2023/01
64K	./raw/ethereum/kraken/2023/04
64K	./raw/ethereum/kraken/2023/02
388K	./raw/ethereum/kraken/2023
1.2M	./raw/ethereum/kraken
64K	./raw/ethereum/coinbase/2024/05
64K	./raw/ethereum/coinbase/2024/06
64K	./raw/ethereum/coinbase/2024/03
64K	./raw/ethereum/coinbase/2024/01
64K	./raw/ethereum/coinbase/2024/04
64K	./raw/ethereum/coinbase/2024/02
... (269 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -name raw -exec du -h --max-depth=1 {} ;
```

**🖥️ Output:**
```
3.5M	./raw/ethereum
3.5M	./raw/solana
3.5M	./raw/cardano
3.5M	./raw/bitcoin
14M	./raw
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -name *2 -type l
```

**🖥️ Output:**
```
./processed/bitcoin/latest2
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -name *2 -type l -delete
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
tree processed/bitcoin/
```

**🖥️ Output:**
```
processed/bitcoin/
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

8 directories, 15 files
```
✅ Exit code: 0

**✅ 2026-01-08 20:32:54 - Status:** COMPLETED


---

## 📚 2026-01-08 20:33:20 - Exercise: locate (cari file dari database)

**🎯 Objective:** mengetahui opsi apa yang sering digunakan dengan locate dan mengetahui perbedaan locate dengan find

**💻 Command:**
```bash
locate -c csv
```

**🖥️ Output:**
```
3981
```
✅ Exit code: 0

**💻 Command:**
```bash
locate -l 10 -i 2-1_pencarian-file/chaos-data-LAKE
```

**🖥️ Output:**
```
```
❌ Exit code: 1

**💻 Command:**
```bash
locate -il 10 2-1_pencarian-file/chaos-data-LAKE
```

**🖥️ Output:**
```
```
❌ Exit code: 1

**💻 Command:**
```bash
locate -il 10 2-1_pencarian-file/chaos-data-LAKE
```

**🖥️ Output:**
```
```
❌ Exit code: 1

- 📝 database belum terupdate
**💻 Command:**
```bash
locate -il 10 2-1_pencarian-file/chaos-data-LAKE
```

**🖥️ Output:**
```
```
❌ Exit code: 1

**💻 Command:**
```bash
locate -il 10 /COINbase/2023/06/02.csv
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/raw/bitcoin/coinbase/2023/06/02.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/raw/cardano/coinbase/2023/06/02.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/raw/ethereum/coinbase/2023/06/02.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/raw/solana/coinbase/2023/06/02.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
locate -ilr 10 /COINbase/2023/06/[1-5].csv
```

**🖥️ Output:**
```
Error: limit must be a strictly positive number.
```
❌ Exit code: 1

**💻 Command:**
```bash
locate -r /coinbase/2023/06/[1-5].csv
```

**🖥️ Output:**
```
```
❌ Exit code: 1

**💻 Command:**
```bash
locate -r btc_clean_[1-3]*
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v1/data/btc_clean_1.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v1/data/btc_clean_2.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v1/data/btc_clean_3.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v1/data/btc_clean_4.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v1/data/btc_clean_5.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v2/data/btc_clean_1.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v2/data/btc_clean_2.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v2/data/btc_clean_3.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v2/data/btc_clean_4.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v2/data/btc_clean_5.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3/data/btc_clean_1.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3/data/btc_clean_2.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3/data/btc_clean_3.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3/data/btc_clean_4.csv
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3/data/btc_clean_5.csv
```
✅ Exit code: 0

**✅ 2026-01-08 20:56:10 - Status:** COMPLETED

**✨ What I learned:**
- locate lebih cepat dari find
- locate tidak sefleksibel find
- locate memerlukan update database
- locate dijalankan di pwd atau lokasi manapun akan sama karena ambil dari database


---

## 📊 2026-01-08 20:57:28 - Session Summary

- **Total exercises:** 2
- **Completed:** 4
- **Failed:** 0

