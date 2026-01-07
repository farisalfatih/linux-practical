# Learning Log

Started: 2026-01-07

**🎯 Objective:** mengetahui wildcard yang sering digunakan bagaimana cara penggunaannya

---

## 📚 2026-01-07 22:50:42 - Exercise: Asterisk (*)

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -L 5
```

**🖥️ Output:**
```
.
├── chaos-data-lake
│   ├── logs
│   │   └── ingestion
│   ├── metadata
│   │   └── schemas
│   ├── processed
│   │   └── bitcoin
│   │       ├── latest -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/processed/bitcoin/v3
│   │       ├── v1
│   │       │   └── data
│   │       ├── v2
│   │       │   └── data
│   │       └── v3
│   │           └── data
│   └── raw
│       ├── bitcoin
│       │   ├── binance
│       │   │   ├── 2022
│       │   │   ├── 2023
│       │   │   └── 2024
│       │   ├── coinbase
│       │   │   ├── 2022
│       │   │   ├── 2023
│       │   │   └── 2024
│       │   └── kraken
│       │       ├── 2022
│       │       ├── 2023
│       │       └── 2024
│       ├── cardano
│       │   ├── binance
│       │   │   ├── 2022
│       │   │   ├── 2023
│       │   │   └── 2024
│       │   ├── coinbase
│       │   │   ├── 2022
│       │   │   ├── 2023
│       │   │   └── 2024
│       │   └── kraken
│       │       ├── 2022
│       │       ├── 2023
│       │       └── 2024
│       ├── ethereum
│       │   ├── binance
│       │   │   ├── 2022
│       │   │   ├── 2023
│       │   │   └── 2024
│       │   ├── coinbase
│       │   │   ├── 2022
│       │   │   ├── 2023
... (71 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
tree chaos-data-lake/processed/bitcoin
```

**🖥️ Output:**
```
chaos-data-lake/processed/bitcoin
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

**💻 Command:**
```bash
tree chaos-data-lake/raw/bitcoin/binance/2022/01
```

**🖥️ Output:**
```
chaos-data-lake/raw/bitcoin/binance/2022/01
├── 01.csv
├── 02.csv
├── 03.csv
├── 04.csv
├── 05.csv
├── 06.csv
├── 07.csv
├── 08.csv
├── 09.csv
├── 10.csv
├── 11.csv
├── 12.csv
├── 13.csv
├── 14.csv
└── 15.csv

1 directory, 15 files
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-2_eksplorasi-filesystem/chaos-data-lake/raw/bitcoin/binance/2024/01
```
✅ Exit code: 0

**💻 Command:**
```bash
ls
```

**🖥️ Output:**
```
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
```
✅ Exit code: 0

**💻 Command:**
```bash
ls 01.csv 10.csv 11.csv 12.csv 13.csv 14.csv 15.csv
```

**🖥️ Output:**
```
01.csv
10.csv
11.csv
12.csv
13.csv
14.csv
15.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
ls 10.csv 11.csv 12.csv 13.csv 14.csv 15.csv
```

**🖥️ Output:**
```
10.csv
11.csv
12.csv
13.csv
14.csv
15.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
ls *1
```

**🖥️ Output:**
```
ls: cannot access '*1': No such file or directory
```
❌ Exit code: 2

**💻 Command:**
```bash
ls *2
```

**🖥️ Output:**
```
ls: cannot access '*2': No such file or directory
```
❌ Exit code: 2

**💻 Command:**
```bash
ls 02.csv 12.csv
```

**🖥️ Output:**
```
02.csv
12.csv
```
✅ Exit code: 0

- 📝 * artinya 1 atau lebih karakter
**✅ 2026-01-07 23:09:32 - Status:** COMPLETED


---

## 📚 2026-01-07 23:10:17 - Exercise: Ruestion mark (?)

**🎯 Objective:** mengetahui bagaimana penggunaan ?

**💻 Command:**
```bash
ls 10.csv 11.csv 12.csv 13.csv 14.csv 15.csv
```

**🖥️ Output:**
```
10.csv
11.csv
12.csv
13.csv
14.csv
15.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
ls 01.csv 02.csv 03.csv 04.csv 05.csv 06.csv 07.csv 08.csv 09.csv
```

**🖥️ Output:**
```
01.csv
02.csv
03.csv
04.csv
05.csv
06.csv
07.csv
08.csv
09.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
ls 01.csv 02.csv 03.csv 04.csv 05.csv 06.csv 07.csv 08.csv 09.csv
```

**🖥️ Output:**
```
01.csv
02.csv
03.csv
04.csv
05.csv
06.csv
07.csv
08.csv
09.csv
```
✅ Exit code: 0

- 📝 ? digunakan untuk sesuatu yang tepat satu karakter
**✅ 2026-01-07 23:13:04 - Status:** COMPLETED


---

## 📚 2026-01-07 23:25:11 - Exercise: Bracket [abc] - salah satu dari karakter

**💻 Command:**
```bash
ls 04.csv 06.csv
```

**🖥️ Output:**
```
04.csv
06.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
ls 11.csv 13.csv
```

**🖥️ Output:**
```
11.csv
13.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
ls 15.csv
```

**🖥️ Output:**
```
15.csv
```
✅ Exit code: 0

**✅ 2026-01-07 23:31:42 - Status:** COMPLETED


---

## 📚 2026-01-07 23:32:55 - Exercise: Range [a-z] - range secara berurutan

**💻 Command:**
```bash
13.csv 14.csv 15.csv
```

**🖥️ Output:**
```
13.csv: command not found
```
❌ Exit code: 127

**💻 Command:**
```bash
ls 13.csv 14.csv 15.csv
```

**🖥️ Output:**
```
13.csv
14.csv
15.csv
```
✅ Exit code: 0

**✅ 2026-01-07 23:34:59 - Status:** COMPLETED


---

## 📚 2026-01-07 23:35:48 - Exercise: Negation [!abc] - yang bukan karakter a b c

**💻 Command:**
```bash
ls 10.csv 11.csv 14.csv
```

**🖥️ Output:**
```
10.csv
11.csv
14.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
ls 01.csv 04.csv 06.csv 07.csv 09.csv
```

**🖥️ Output:**
```
01.csv
04.csv
06.csv
07.csv
09.csv
```
✅ Exit code: 0

**✅ 2026-01-07 23:37:50 - Status:** COMPLETED


---

## 📊 2026-01-07 23:38:00 - Session Summary

- **Total exercises:** 5
- **Completed:** 5
- **Failed:** 0

