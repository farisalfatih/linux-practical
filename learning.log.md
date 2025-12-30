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
