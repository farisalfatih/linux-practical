# LINUX PRACTICAL LEARNING LOG
## Filesystem
### Flow 0: Persiapan Lab
```text
/home/faris-al-fatih/linux-practical/lab/01-filesystem
.

0 directories, 0 files
.
├── archive
├── input
│   └── raw_data
│       ├── customer.json
│       ├── products.parquet
│       ├── sales_2024.csv
│       ├── sample.csv
│       └── status.json
├── logs
│   └── etl_log.txt
├── ouput
│   └── processed_data
├── scripts
└── tmp

9 directories, 6 files
 0 ./input/raw_data/customer.json
 0 ./input/raw_data/sales_2024.csv
 1 ./input/raw_data/status.json
 0 ./input/raw_data/products.parquet
 1 ./input/raw_data/sample.csv
 0 ./logs/etl_log.txt
 2 total
```
### Flow 1: Navigasi & Exsplorasi
```text
total 32
drwxr-xr-x  8 faris-al-fatih faris-al-fatih 4096 Dec 29 20:42 .
drwxr-xr-x 12 faris-al-fatih faris-al-fatih 4096 Dec 29 20:04 ..
drwxr-xr-x  2 faris-al-fatih faris-al-fatih 4096 Dec 29 20:42 archive
drwxr-xr-x  3 faris-al-fatih faris-al-fatih 4096 Dec 29 20:42 input
drwxr-xr-x  2 faris-al-fatih faris-al-fatih 4096 Dec 29 20:46 logs
drwxr-xr-x  3 faris-al-fatih faris-al-fatih 4096 Dec 29 20:42 ouput
drwxr-xr-x  2 faris-al-fatih faris-al-fatih 4096 Dec 29 20:42 scripts
drwxr-xr-x  2 faris-al-fatih faris-al-fatih 4096 Dec 29 20:42 tmp
.
├── archive
├── input
│   └── raw_data
│       ├── customer.json
│       ├── products.parquet
│       ├── sales_2024.csv
│       ├── sample.csv
│       └── status.json
├── logs
│   └── etl_log.txt
├── ouput
│   └── processed_data
├── scripts
└── tmp

9 directories, 6 files
/home/faris-al-fatih/linux-practical/lab/01-filesystem
/home/faris-al-fatih/linux-practical/lab/01-filesystem/input/raw_data
/home/faris-al-fatih/linux-practical/lab/01-filesystem
/home/faris-al-fatih/linux-practical/lab/01-filesystem/ouput
/home/faris-al-fatih/linux-practical/lab/01-filesystem
```
### Flow 2: Manipulasi File & Folder
```text
.
├── archive
├── input
│   └── raw_data
│       ├── customer.json
│       ├── products.parquet
│       ├── sales_2024.csv
│       ├── sample.csv
│       └── status.json
├── logs
│   └── etl_log.txt
├── ouput
│   └── processed_data
├── scripts
└── tmp

9 directories, 6 files
.
├── archive
├── input
│   └── raw_data
│       ├── customer.json
│       ├── products.parquet
│       ├── sales_2024.csv
│       ├── sample.csv
│       └── status.json
├── logs
│   └── etl_log.txt
├── output
│   └── processed_data
│       └── sample_backup.csv
├── scripts
└── tmp
    └── sales_2024.csv

9 directories, 8 files
.
├── archive
│   └── raw_backup_20251229
│       ├── customer.json
│       ├── products.parquet
│       ├── sales_2024.csv
│       └── sample.csv
├── input
│   └── raw_data
│       ├── customer.json
│       ├── products.parquet
│       ├── sales_2024.csv
│       └── sample.csv
├── logs
│   ├── etl_log.txt
│   └── etl_status.json
├── output
│   └── processed_data
│       └── sample_backup.csv
├── scripts
└── tmp
    ├── sales_2024.csv
    ├── temp1.txt
    ├── temp2.txt
    ├── temp3.txt
    ├── temp4.txt
    └── temp5.txt

10 directories, 17 files
```
### Flow 3: Symbolic Link - 2025-12-29 21:27:39
```text
.
├── archive
│   └── raw_backup_20251229
│       ├── customer.json
│       ├── products.parquet
│       ├── sales_2024.csv
│       └── sample.csv
├── input
│   └── raw_data
│       ├── customer.json
│       ├── products.parquet
│       ├── sales_2024.csv
│       └── sample.csv
├── logs
│   ├── etl_log.txt
│   └── etl_status.json
├── output
│   └── processed_data
│       └── sample_backup.csv
├── scripts
└── tmp
    ├── sales_2024.csv
    ├── temp1.txt
    ├── temp2.txt
    ├── temp3.txt
    ├── temp4.txt
    └── temp5.txt

10 directories, 17 fileslrwxrwxrwx  1 faris-al-fatih faris-al-fatih   70 Dec 29 21:30 link_input -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/input/raw_data/
lrwxrwxrwx  1 faris-al-fatih faris-al-fatih   62 Dec 29 21:32 link_output -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/output/
/home/faris-al-fatih/linux-practical/lab/01-filesystem/input/raw_data/
/home/faris-al-fatih/linux-practical/lab/01-filesystem/input/raw_data
customer.json
products.parquet
sales_2024.csv
sample.csv
id,name,value
.
├── archive
│   └── raw_backup_20251229
│       ├── customer.json
│       ├── products.parquet
│       ├── sales_2024.csv
│       └── sample.csv
├── corrent_log.txt -> logs/etl_log.txt
├── input
│   └── raw_data
│       ├── customer.json
│       ├── products.parquet
│       ├── sales_2024.csv
│       └── sample.csv
├── link_input -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/input/raw_data/
├── logs
│   ├── etl_log.txt
│   └── etl_status.json
├── output
│   └── processed_data
│       └── sample_backup.csv
├── scripts
└── tmp
    ├── sales_2024.csv
    ├── temp1.txt
    ├── temp2.txt
    ├── temp3.txt
    ├── temp4.txt
    └── temp5.txt

11 directories, 18 files
```
### Flow 4: Metadata & Monitoring - 2025-12-29 21:44:45
```text
  File: input/raw_data/sample.csv
  Size: 14        	Blocks: 8          IO Block: 4096   regular file
Device: 8,48	Inode: 63792       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2025-12-29 20:54:39.210158314 +0700
Modify: 2025-12-29 20:49:29.935687966 +0700
Change: 2025-12-29 20:49:29.935687966 +0700
 Birth: 2025-12-29 20:49:12.519683898 +0700
input/raw_data/customer.json:    empty
input/raw_data/products.parquet: empty
input/raw_data/sales_2024.csv:   empty
input/raw_data/sample.csv:       ASCII text
12K	input/
12K	output/
12K	./input
12K	./output
8.0K	./logs
4.0K	./scripts
12K	./archive
4.0K	./tmp
60K	.
Filesystem      Size  Used Avail Use% Mounted on
none            3.4G     0  3.4G   0% /usr/lib/modules/6.6.87.2-microsoft-standard-WSL2
none            3.4G  4.0K  3.4G   1% /mnt/wsl
drivers         476G   89G  388G  19% /usr/lib/wsl/drivers
/dev/sdd       1007G   18G  939G   2% /
none            3.4G   76K  3.4G   1% /mnt/wslg
none            3.4G     0  3.4G   0% /usr/lib/wsl/lib
rootfs          3.4G  2.7M  3.4G   1% /init
none            3.4G  788K  3.4G   1% /run
none            3.4G     0  3.4G   0% /run/lock
none            3.4G     0  3.4G   0% /run/shm
none            3.4G   96K  3.4G   1% /mnt/wslg/versions.txt
none            3.4G   96K  3.4G   1% /mnt/wslg/doc
C:\             476G   89G  388G  19% /mnt/c
snapfuse        5.0M  5.0M     0 100% /snap/glow/90
snapfuse         64M   64M     0 100% /snap/core20/2686
snapfuse         51M   51M     0 100% /snap/snapd/25577
tmpfs           689M   28K  689M   1% /run/user/1000
17
60K	.
12K	./output
12K	./input
12K	./archive
8.0K	./output/processed_data
8.0K	./logs
8.0K	./input/raw_data
8.0K	./archive/raw_backup_20251229
4.0K	./tmp
4.0K	./scripts
```
### Flow 5: Pencarian File - 2025-12-29 22:01:21
```text
./input/raw_data/sales_2024.csv
./input/raw_data/sample.csv
./output/processed_data/sample_backup.csv
./archive/raw_backup_20251229/sales_2024.csv
./archive/raw_backup_20251229/sample.csv
./tmp/sales_2024.csv
./input/raw_data/customer.json
./logs/etl_status.json
./archive/raw_backup_20251229/customer.json
./logs/etl_log.txt
./tmp/temp5.txt
./tmp/temp1.txt
./tmp/temp3.txt
./tmp/temp4.txt
./tmp/temp2.txt
./input/raw_data/customer.json
./input/raw_data/sales_2024.csv
./input/raw_data/products.parquet
./logs/etl_log.txt
./archive/raw_backup_20251229/customer.json
./archive/raw_backup_20251229/sales_2024.csv
./archive/raw_backup_20251229/products.parquet
./tmp/temp5.txt
./tmp/sales_2024.csv
./tmp/temp1.txt
./tmp/temp3.txt
./tmp/temp4.txt
./tmp/temp2.txt
./input/raw_data/customer.json
./input/raw_data/sales_2024.csv
./input/raw_data/products.parquet
./logs/etl_log.txt
./archive/raw_backup_20251229/customer.json
./archive/raw_backup_20251229/sales_2024.csv
./archive/raw_backup_20251229/products.parquet
./tmp/temp5.txt
./tmp/sales_2024.csv
./tmp/temp1.txt
./tmp/temp3.txt
./tmp/temp4.txt
./tmp/temp2.txt
./input/raw_data/customer.json
./input/raw_data/sales_2024.csv
./input/raw_data/products.parquet
./input/raw_data/sample.csv
./output/processed_data/sample_backup.csv
./logs/etl_log.txt
./logs/etl_status.json
./archive/raw_backup_20251229/customer.json
./archive/raw_backup_20251229/sales_2024.csv
./archive/raw_backup_20251229/products.parquet
./archive/raw_backup_20251229/sample.csv
./tmp/temp5.txt
./tmp/sales_2024.csv
./tmp/temp1.txt
./tmp/temp3.txt
./tmp/temp4.txt
./tmp/temp2.txt
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 0 Dec 29 20:46 ./input/raw_data/sales_2024.csv
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 14 Dec 29 20:49 ./input/raw_data/sample.csv
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 14 Dec 29 21:14 ./output/processed_data/sample_backup.csv
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 0 Dec 29 21:19 ./archive/raw_backup_20251229/sales_2024.csv
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 14 Dec 29 21:19 ./archive/raw_backup_20251229/sample.csv
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 0 Dec 29 20:46 ./tmp/sales_2024.csv
0 ./corrent_log.txt
0 ./logs/etl_log.txt
0 ./tmp/temp5.txt
0 ./tmp/temp1.txt
0 ./tmp/temp3.txt
0 ./tmp/temp4.txt
0 ./tmp/temp2.txt
./input/raw_data/sales_2024.csv
./input/raw_data/sample.csv
./output/processed_data/sample_backup.csv
./tmp/sales_2024.csv
```
### Globbing & Widcards - 2025-12-29 22-19-01
```text
link_input/sales_2024.csv
link_input/sample.csv
tmp/sales_2024.csv
input/raw_data/customer.json
input/raw_data/products.parquet
input/raw_data/sales_2024.csv
input/raw_data/sample.csv
tmp/temp1.txt
tmp/temp2.txt
tmp/temp3.txt
tmp/temp4.txt
tmp/temp5.txt
tmp/temp1.txt
tmp/temp2.txt
tmp/temp3.txt
input/:
raw_data

output/:
processed_data
.
├── archive
├── corrent_log.txt -> logs/etl_log.txt
├── input
├── link_input -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/input/raw_data/
├── logs
├── output
├── scripts
└── tmp

8 directories, 1 file
.
├── archive
├── corrent_log.txt -> logs/etl_log.txt
├── file.bak
├── file.txt
├── input
├── link_input -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/input/raw_data/
├── logs
├── output
├── report_feb.csv
├── report_jan.csv
├── report_mar.csv
├── scripts
└── tmp

8 directories, 6 files
```
### File Descriptor & Redirection 2025-12-29 22:37:49
```text
/home/faris-al-fatih/linux-practical/lab/01-filesystem
.
├── archive
│   └── raw_backup_20251229
│       ├── customer.json
│       ├── products.parquet
│       ├── sales_2024.csv
│       └── sample.csv
├── corrent_log.txt -> logs/etl_log.txt
├── file.bak
├── file.txt
├── input
│   └── raw_data
│       ├── customer.json
│       ├── products.parquet
│       ├── sales_2024.csv
│       └── sample.csv
├── link_input -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/input/raw_data/
├── logs
│   ├── etl_log.txt
│   └── etl_status.json
├── output
│   └── processed_data
│       └── sample_backup.csv
├── report_feb.csv
├── report_jan.csv
├── report_mar.csv
├── scripts
└── tmp
    ├── sales_2024.csv
    ├── temp1.txt
    ├── temp2.txt
    ├── temp3.txt
    ├── temp4.txt
    └── temp5.txt

11 directories, 23 files
./file.txt
./logs/etl_log.txt
./tmp/temp5.txt
./tmp/temp1.txt
./tmp/temp3.txt
./tmp/temp4.txt
./tmp/temp2.txt
17 file_list.txt
18 file_list.txt
415 errors_root.txt
0 all_output.txt
19 all_output.txt
0
```
### xargs untuk Bach Processing 2025-12-30 13:05:41
```text
./input/raw_data/sales_2024.csv
./input/raw_data/sample.csv
./report_mar.csv
./practice_tree3/many/file014.csv
./practice_tree3/many/file009.csv
./practice_tree3/many/file012.csv
./practice_tree3/many/file007.csv
./practice_tree3/many/file005.csv
./practice_tree3/many/file017.csv
./practice_tree3/many/file016.csv
./practice_tree3/many/file002.csv
./practice_tree3/many/file011.csv
./practice_tree3/many/file013.csv
./practice_tree3/many/file010.csv
./practice_tree3/many/file020.csv
./practice_tree3/many/file006.csv
./practice_tree3/many/file015.csv
./practice_tree3/many/file004.csv
./practice_tree3/many/file008.csv
./practice_tree3/many/file019.csv
./practice_tree3/many/file001.csv
./practice_tree3/many/file018.csv
./practice_tree3/many/file003.csv
./output/processed_data/sample_backup.csv
./archive/raw_backup_20251229/sales_2024.csv
./archive/raw_backup_20251229/sample.csv
./report_feb.csv
./practice_tree2/-dashstart.csv
./practice_tree2/nested/another.csv
./practice_tree2/weird$name.csv
./practice_tree2/data-2.csv
./practice_tree2/data 1.csv
./report_jan.csv
./practice_tree1/a.csv
./practice_tree1/report_jan.csv
./practice_tree1/b.csv
./practice_tree1/subdir/inner.csv
./tmp/sales_2024.csv
 0 ./input/raw_data/sales_2024.csv
 1 ./input/raw_data/sample.csv
 0 ./report_mar.csv
 1 ./output/processed_data/sample_backup.csv
 0 ./archive/raw_backup_20251229/sales_2024.csv
 1 ./archive/raw_backup_20251229/sample.csv
 0 ./report_feb.csv
 0 ./report_jan.csv
 0 ./tmp/sales_2024.csv
 3 total
archive/
└── raw_backup_20251229
    ├── customer.json
    ├── products.parquet
    ├── sales_2024.csv
    └── sample.csv

2 directories, 4 files
2025-12-30 13:37:42 - log = 0
./xargs-train4.log
./xargs-train5.log
./xargs-train2.log
./xargs-train3.log
./xargs-train1.log
archive/
├── raw_backup_20251229
│   ├── customer.json
│   ├── products.parquet
│   ├── sales_2024.csv
│   └── sample.csv
├── xargs-train1.log
├── xargs-train2.log
├── xargs-train3.log
├── xargs-train4.log
└── xargs-train5.log

2 directories, 9 files
.
├── all_output.txt
├── archive
├── corrent_log.txt -> logs/etl_log.txt
├── errors_root.txt
├── file.bak
├── file.txt
├── file_list.txt
├── input
├── link_input -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/input/raw_data/
├── logs
├── output
├── report_feb.csv
├── report_jan.csv
├── report_mar.csv
├── scripts
├── tmp
├── xargs-train1.log
├── xargs-train2.log
├── xargs-train3.log
├── xargs-train4.log
└── xargs-train5.log

8 directories, 14 files
.
├── all_output.txt
├── archive
├── corrent_log.txt -> logs/etl_log.txt
├── errors_root.txt
├── file.bak
├── file.txt
├── file_list.txt
├── input
├── link_input -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/input/raw_data/
├── logs
├── output
├── report_feb.csv.gz
├── report_jan.csv.gz
├── report_mar.csv.gz
├── scripts
├── tmp
├── xargs-train1.log
├── xargs-train2.log
├── xargs-train3.log
├── xargs-train4.log
└── xargs-train5.log

8 directories, 14 files
```
### Mini challenge 1: Organisasi data 2025-12-30 14:01:51
```text
/home/faris-al-fatih/linux-practical/lab/01-challenge-organisasi-data
.
├── archive
├── logs
├── production
├── raw
└── staging

6 directories, 0 files
.
├── archive
├── logs
├── production
├── raw
│   ├── data_1.csv
│   ├── data_2.csv
│   ├── data_3.csv
│   ├── data_4.csv
│   └── data_5.csv
└── staging

6 directories, 5 files
'raw/data_1.csv' -> 'staging/data_1.csv'
'raw/data_2.csv' -> 'staging/data_2.csv'
'raw/data_3.csv' -> 'staging/data_3.csv'
'raw/data_4.csv' -> 'staging/data_4.csv'
'raw/data_5.csv' -> 'staging/data_5.csv'
.
├── archive
├── logs
├── production
├── raw
│   ├── data_1.csv
│   ├── data_2.csv
│   ├── data_3.csv
│   ├── data_4.csv
│   └── data_5.csv
└── staging
    ├── data_1.csv
    ├── data_2.csv
    ├── data_3.csv
    ├── data_4.csv
    └── data_5.csv

6 directories, 10 files
```
### Mini Challange 2: ETL Simulation 2025-12-30 14:21:41
```text
renamed '01-challenge-organisasi-data/' -> '01-challange'
mkdir: created directory 'archive/backup_2025-12-30_14-26-17'
'archive/latest' -> 'archive/backup_2025-12-30_14-26-17/*'
Tue Dec 30 14:31:04 WIB 2025: Files Archived
.
├── archive
│   ├── backup_2025-12-30_14-26-17
│   └── latest -> archive/backup_2025-12-30_14-26-17/*
├── logs
│   └── etl_log.txt
├── production
├── raw
│   ├── data_1.csv
│   ├── data_2.csv
│   ├── data_3.csv
│   ├── data_4.csv
│   └── data_5.csv
└── staging
    ├── data_1.csv
    ├── data_2.csv
    ├── data_3.csv
    ├── data_4.csv
    └── data_5.csv

7 directories, 12 files
```
### Mini Challange 3: Cleanup Scripts 2025-12-30 14:35:01
```text
.
├── archive
│   ├── backup_2025-12-30_14-26-17
│   └── latest -> archive/backup_2025-12-30_14-26-17/*
├── logs
│   └── etl_log.txt
├── production
├── raw
│   ├── data_1.csv
│   ├── data_2.csv
│   ├── data_3.csv
│   ├── data_4.csv
│   └── data_5.csv
└── staging
    ├── data_1.csv
    ├── data_2.csv
    ├── data_3.csv
    ├── data_4.csv
    └── data_5.csv

7 directories, 12 files
mkdir: created directory 'tmp'
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 0 Jun  6  2024 tmp/file-chal3_1.txt
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 0 Jun  6  2024 tmp/file-chal3_2.txt
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 0 Jun  6  2024 tmp/file-chal3_3.txt
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 45 Dec 30 14:31 logs/etl_log.txt
-rw-r--r-- 1 faris-al-fatih faris-al-fatih  0 Jun  6  2024 logs/file-log-chal3_1.txt
-rw-r--r-- 1 faris-al-fatih faris-al-fatih  0 Jun  6  2024 logs/file-log-chal3_2.txt
-rw-r--r-- 1 faris-al-fatih faris-al-fatih  0 Jun  6  2024 logs/file-log-chal3_3.txt
tmp/

0 directories, 0 files
.
├── archive
│   ├── backup_2025-12-30_14-26-17
│   └── latest -> archive/backup_2025-12-30_14-26-17/*
├── logs
│   ├── etl_log.txt
│   ├── file-log-chal3_1.txt
│   ├── file-log-chal3_2.txt
│   └── file-log-chal3_3.txt
├── production
├── raw
│   ├── data_1.csv
│   ├── data_2.csv
│   ├── data_3.csv
│   ├── data_4.csv
│   └── data_5.csv
├── staging
│   ├── data_1.csv
│   ├── data_2.csv
│   ├── data_3.csv
│   ├── data_4.csv
│   └── data_5.csv
└── tmp

8 directories, 15 files
.
├── archive
│   └── latest -> archive/backup_2025-12-30_14-26-17/*
├── logs
│   ├── etl_log.txt
│   ├── file-log-chal3_1.txt
│   ├── file-log-chal3_2.txt
│   └── file-log-chal3_3.txt
├── raw
│   ├── data_1.csv
│   ├── data_2.csv
│   ├── data_3.csv
│   ├── data_4.csv
│   └── data_5.csv
└── staging
    ├── data_1.csv
    ├── data_2.csv
    ├── data_3.csv
    ├── data_4.csv
    └── data_5.csv

5 directories, 15 files
logs/
├── etl_log.txt
├── file-log-chal3_1.txt.gz
├── file-log-chal3_2.txt.gz
└── file-log-chal3_3.txt.gz

1 directory, 4 files
```
## Permission & Ownership Linux 2025-12-30 15:50:54
### Persiapan Lab sub bab 2 - 2025-12-30 15:52:25
```text
[drwxr-xr-x]  .
├── [drwxr-xr-x]  data
│   ├── [drwxr-xr-x]  processed
│   │   └── [-rw-r--r--]  report.csv
│   ├── [drwxr-xr-x]  raw
│   │   └── [-rw-r--r--]  sales.csv
│   └── [drwxr-xr-x]  sensitive
│       └── [-rw-r--r--]  crendentials.txt
├── [drwxr-xr-x]  logs
│   └── [-rw-r--r--]  app.log
└── [drwxr-xr-x]  scripts
    └── [-rw-r--r--]  etl.sh

7 directories, 5 files
```
*Note:* struktur diatas adalah struktur latihan dan permission awal
### Flow 1: Melihat Permission - 2025-12-30 16:03:56
*Tujuan Flow:* Bisa membaca permission
#### Dengan ls -l atau tree -p bisa melihat detail termasuk permision dalam format symbolic(-rwx------), karakter pertama merupakan tipe misal - berarti tipenya file dan d berarti folder, lalu karakter ke 2-4 merupakan hak akses owner/user(u), karakter ke 5-7 merupakan akses group(g), karakter ke 8-10 merupakan hak akses ke semua user lain/orthers(o). karakter hak akses itu formatnya adalah r(read), w(write), x(execute). misal ownwr mimiliki akses rwx maka owner bisa melihat, menulis(bisa edit, delete, dll), execute/menjalankan program
```text
total 20
drwxr-xr-x  5 faris-al-fatih faris-al-fatih 4096 Dec 30 15:54 .
drwxr-xr-x 13 faris-al-fatih faris-al-fatih 4096 Dec 30 14:23 ..
drwxr-xr-x  5 faris-al-fatih faris-al-fatih 4096 Dec 30 15:54 data
drwxr-xr-x  2 faris-al-fatih faris-al-fatih 4096 Dec 30 15:57 logs
drwxr-xr-x  2 faris-al-fatih faris-al-fatih 4096 Dec 30 15:57 scripts
[drwxr-xr-x]  .
├── [drwxr-xr-x]  data
│   ├── [drwxr-xr-x]  processed
│   │   └── [-rw-r--r--]  report.csv
│   ├── [drwxr-xr-x]  raw
│   │   └── [-rw-r--r--]  sales.csv
│   └── [drwxr-xr-x]  sensitive
│       └── [-rw-r--r--]  crendentials.txt
├── [drwxr-xr-x]  logs
│   └── [-rw-r--r--]  app.log
└── [drwxr-xr-x]  scripts
    └── [-rw-r--r--]  etl.sh

7 directories, 5 files
```
#### ls -ld data/ - melihat permission dari folder data (l-list, d=directory)
```text
drwxr-xr-x 5 faris-al-fatih faris-al-fatih 4096 Dec 30 15:54 data/
```
#### ls -laR /data - menampilkan list(ls), dengan format longlist (l), lihat semua file termasuk file tersembunyi/all(a), dan menampilkan isi dari sub directory secarakeseluruhan/recursive(R) dari directory /data
```text
data/:
total 20
drwxr-xr-x 5 faris-al-fatih faris-al-fatih 4096 Dec 30 15:54 .
drwxr-xr-x 5 faris-al-fatih faris-al-fatih 4096 Dec 30 15:54 ..
drwxr-xr-x 2 faris-al-fatih faris-al-fatih 4096 Dec 30 15:57 processed
drwxr-xr-x 2 faris-al-fatih faris-al-fatih 4096 Dec 30 15:57 raw
drwxr-xr-x 2 faris-al-fatih faris-al-fatih 4096 Dec 30 15:57 sensitive

data/processed:
total 8
drwxr-xr-x 2 faris-al-fatih faris-al-fatih 4096 Dec 30 15:57 .
drwxr-xr-x 5 faris-al-fatih faris-al-fatih 4096 Dec 30 15:54 ..
-rw-r--r-- 1 faris-al-fatih faris-al-fatih    0 Dec 30 15:57 report.csv

data/raw:
total 8
drwxr-xr-x 2 faris-al-fatih faris-al-fatih 4096 Dec 30 15:57 .
drwxr-xr-x 5 faris-al-fatih faris-al-fatih 4096 Dec 30 15:54 ..
-rw-r--r-- 1 faris-al-fatih faris-al-fatih    0 Dec 30 15:57 sales.csv

data/sensitive:
total 8
drwxr-xr-x 2 faris-al-fatih faris-al-fatih 4096 Dec 30 15:57 .
drwxr-xr-x 5 faris-al-fatih faris-al-fatih 4096 Dec 30 15:54 ..
-rw-r--r-- 1 faris-al-fatih faris-al-fatih    0 Dec 30 15:57 crendentials.txt
```
#### stat data/raw/sales.csv - menampilkan 1 data dengan detail lengkap, cocok digunakan ketika ingin melihat 1 data, jika melihat banyak data lebih baik menggunakan list
```text
  File: data/raw/sales.csv
  Size: 0         	Blocks: 0          IO Block: 4096   regular empty file
Device: 8,48	Inode: 87722       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2025-12-30 15:57:00.455524242 +0700
Modify: 2025-12-30 15:57:00.455524242 +0700
Change: 2025-12-30 15:57:00.455524242 +0700
 Birth: 2025-12-30 15:57:00.455524242 +0700
```
#### -c "%a %n" data/* - karena output stat panjang karena mengambil semua data untuk melihat hanya permission dalam octal perintah ini mengambil custom format(c) dari permission numeric/acces rights(a) dan nama file/dirctory/name(n) dari semua isi (*) yang ada pada directory data
```text
755 data/processed
755 data/raw
755 data/sensitive
```
*Note:* pada stat diatas bisa dilihat bahwa tampilan permission dalam format octal, cara menghitungnya seperti ini: nilai dari caracter symbolix; r=4, w=2, x=1. jadi permission 755 berarti user/ownwe dapat membaca, menulis, dan menjalankan(Akses Penuh), group dan other hanya dapat membaca dan execute
### Flow 2: Mengubah Permission (chmod/change mode) - 2025-12-30 17:11:02
*Tujuan flow:* Mahir menggunakan chmod symbolic dan numeric/octal mode
#### chmod -v u+x scripts/etl.sh - menggunakan chmod untuk file tunggal, disini ubah u(user/owner) agar bisa execute, verbose(v) digunakan untuk menampilkan informasi detail - 2025-12-30 17:19:42
```text
mode of 'scripts/etl.sh' changed from 0644 (rw-r--r--) to 0744 (rwxr--r--)
```
#### chmod u+rwx,g+rx,o+r digunakan untuk merubah permission symbolic multi changes - 2025-12-30 17:25:28
```text
mode of 'scripts/etl.sh' changed from 0744 (rwxr--r--) to 0754 (rwxr-xr--)
```
#### chmod 755 set permission numeric mode - 2025-12-30 17:28:58
```text
mode of 'scripts/etl.sh' changed from 0754 (rwxr-xr--) to 0755 (rwxr-xr-x)
```
#### chmod 700 ubah jadi private - 2025-12-30 17:33:26
```text
mode of 'data/sensitive/' changed from 0755 (rwxr-xr-x) to 0700 (rwx------)
```
#### chmod 644 Read Only biasanya untuk log - 2025-12-30 17:34:42
```text
mode of 'logs/app.log' retained as 0644 (rw-r--r--)
```
#### chmod -R 755 recrusive(R) mengubah izin untuk keseluruhan isi dalam suatu folder - 2025-12-30 17:38:09
```text
mode of 'data/processed/' retained as 0755 (rwxr-xr-x)
mode of 'data/processed/report.csv' changed from 0644 (rw-r--r--) to 0755 (rwxr-xr-x)
```
### Flow 3: Ownership (chown(change owner)/chgrp(change group)) - 2025-12-30 18:14:37
*Tujuan Flow:* Mahir mengatur ownership
#### Lihat current user dan groups (whoami (who am I) digunakan untuk mengetahui nama user yang sedang login, id (identity) menampilkan identitas lengkap user berupa UID, GID, dan seluruh group yang melekat, groups (groups) digunakan untuk melihat daftar group yang dimiliki user secara ringkas)- 2025-12-30 18:15:58
```text
faris-al-fatih
uid=1000(faris-al-fatih) gid=1000(faris-al-fatih) groups=1000(faris-al-fatih),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),100(users)
faris-al-fatih adm cdrom sudo dip plugdev users
```
#### chown faris-al-fatih:faris-al-fatih digunakan untuk mengubah ownership bagian pertama melambangkan user(ouner) : bagian kedua menggambarkan group - 2025-12-30 18:23:09
```text
ownership of 'data/raw/sales.csv' retained as faris-al-fatih:faris-al-fatih
```
#### chgrp mengubah group saja 1 variabel - 2025-12-30 18:31:25
```text
group of 'data/processed/report.csv' retained as faris-al-fatih
```
#### chown -R(Recursive) digunakan untuk merubah kepemilikan keseluruhan isi dalam folder - 2025-12-30 18:34:33
```text
ownership of 'data/' retained as faris-al-fatih:faris-al-fatih
```
### Flow 4: Permission untuk Data Security - 2025-12-30 18:36:40
```text
mode of 'data/sensitive/crendentials.txt' changed from 0644 (rw-r--r--) to 0600 (rw-------)
mode of 'data/sensitive/' retained as 0700 (rwx------)
mode of 'scripts/etl.sh' changed from 0755 (rwxr-xr-x) to 0555 (r-xr-xr-x)
```
### Flow 5: Shared Folder Setup - 2025-12-30 18:41:46
```text
mkdir: created directory 'shared_data'
mode of 'shared_data/' retained as 0755 (rwxr-xr-x)
mode of 'shared_data/team_report.csv' changed from 0644 (rw-r--r--) to 0664 (rw-rw-r--)
  File: shared_data/
  Size: 4096      	Blocks: 8          IO Block: 4096   directory
Device: 8,48	Inode: 64221       Links: 2
Access: (0755/drwxr-xr-x)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2025-12-30 18:44:33.868968366 +0700
Modify: 2025-12-30 18:44:32.720968366 +0700
Change: 2025-12-30 18:44:32.720968366 +0700
 Birth: 2025-12-30 18:42:56.947023316 +0700
```
