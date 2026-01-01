## Flow Latihan Filesystem - 2026-01-01 02:15:08
### Flow 0: Persiapan Lab - 2026-01-01 02:17:02
**Objective** - 2026-01-01 02:19:02
- bisa membuat stuktur project dengan terminal


**Context** - 2026-01-01 02:26:09
- User: faris-al-fatih
- Dir: /home/faris-al-fatih/linux-practical/lab/01-filesystem/flow
- Shell: /bin/bash
---
**Expected** - 2026-01-01 02:27:41
- membuat 6 folder dan ada sub folder di input dan output


**Command** - 2026-01-01 02:29:13
```bash
mkdir -pv input/raw_data output/processed_data logs tmp archive scripts
```
**Output (ringkas)** - 2026-01-01 02:29:13
```text
mkdir: created directory 'input'
mkdir: created directory 'input/raw_data'
mkdir: created directory 'output'
mkdir: created directory 'output/processed_data'
mkdir: created directory 'logs'
mkdir: created directory 'tmp'
mkdir: created directory 'archive'
mkdir: created directory 'scripts'
```
**Actual** - 2026-01-01 02:30:36
- Hasil sesuai eksekusi (exit code 0)
---
**Expected** - 2026-01-01 02:31:47
- membuat file di folder input/raw_data dan menampilkannya dalam tree


**Command** - 2026-01-01 02:36:56
```bash
(cd input/raw_data; touch sales_2024.csv customers.json products.parquet; tree)
```
**Output (ringkas)** - 2026-01-01 02:36:56
```text
.
├── customers.json
├── products.parquet
└── sales_2024.csv

1 directory, 3 files
```
**Actual** - 2026-01-01 02:37:40
- Hasil sesuai eksekusi (exit code 0)
---
**Expected** - 2026-01-01 02:39:40
- membuat file sekaligus menambahkan isi di file menggunakan >(overwrite) menghapus isi sebelumnya jika sudah ada dan menumpa dengan yang baru


**Command** - 2026-01-01 02:44:52
```bash
(echo id,name,value > input/raw_data/sample.csv; echo 'status: ok' >> input/raw_data/status.json; cat input/raw_data/sample.csv; cat input/raw_data/status.json; tree input/raw_data)
```
**Output (ringkas)** - 2026-01-01 02:44:52
```text
id,name,value
status: ok
input/raw_data
├── customers.json
├── products.parquet
├── sales_2024.csv
├── sample.csv
└── status.json

1 directory, 5 files
```
**Actual** - 2026-01-01 02:45:17
- Hasil sesuai eksekusi (exit code 0)
---
**Tags**: #cd #mkdir #touch #echo #>
---
### Flow 2: Manipulasi File dan Folder - 2026-01-01 02:51:29
**Objective** - 2026-01-01 02:54:59
- mahir melakukan manipulasi file coppy, move, remove. touch


**Context** - 2026-01-01 02:55:15
- User: faris-al-fatih
- Dir: /home/faris-al-fatih/linux-practical/lab/01-filesystem/flow
- Shell: /bin/bash
---
**Expected** - 2026-01-01 03:02:38
- coppy input/raw_data/sample.csv ke ouput/processed_data tanpa merubah nama


**Command** - 2026-01-01 03:05:42
```bash
cp -v input/raw_data/sample.csv output/processed_data/
```
**Output (ringkas)** - 2026-01-01 03:05:42
```text
'input/raw_data/sample.csv' -> 'output/processed_data/sample.csv'
```
**Actual** - 2026-01-01 03:05:59
- Hasil sesuai eksekusi (exit code 0)
---
**Expected** - 2026-01-01 03:07:37
- coppy input/raw_data/sample.csv ke ouput/processed_data/sample_backup.csv dengan merubah nama


**Command** - 2026-01-01 03:08:07
```bash
cp -v input/raw_data/sample.csv output/processed_data/sample_backup.csv
```
**Output (ringkas)** - 2026-01-01 03:08:07
```text
'input/raw_data/sample.csv' -> 'output/processed_data/sample_backup.csv'
```
**Actual** - 2026-01-01 03:08:21
- Hasil sesuai eksekusi (exit code 0)
---
**Expected** - 2026-01-01 03:14:02
- coppy file sambil mempertahankan atribut asli/meta data seperti timestamp, permissions, ownership


**Command** - 2026-01-01 03:16:34
```bash
(cp -p input/raw_data/sales_2024.csv tmp/; ls -l input/raw_data/sales_2024.csv; ls -l tmp/sales_2024.csv)
```
**Output (ringkas)** - 2026-01-01 03:16:34
```text
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 0 Jan  1 02:36 input/raw_data/sales_2024.csv
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 0 Jan  1 02:36 tmp/sales_2024.csv
```
---
**Expected** - 2026-01-01 03:22:06
- memindahkan file input/raw_data/status.json ke logs/, melakukan rename file tersebut menjadi elt_status.json, coppy keseluruhan data input/raw_data/ ke archive/raw_bacup_date


**Command** - 2026-01-01 03:24:43
```bash
(mv -v input/raw_data/status.json logs/; mv -v logs/status.json logs/etl_status.json; cp -rv input/raw_data/ archive/raw_backup_20260101)
```
**Output (ringkas)** - 2026-01-01 03:24:43
```text
renamed 'input/raw_data/status.json' -> 'logs/status.json'
renamed 'logs/status.json' -> 'logs/etl_status.json'
'input/raw_data/' -> 'archive/raw_backup_20260101'
'input/raw_data/sample.csv' -> 'archive/raw_backup_20260101/sample.csv'
'input/raw_data/sales_2024.csv' -> 'archive/raw_backup_20260101/sales_2024.csv'
'input/raw_data/customers.json' -> 'archive/raw_backup_20260101/customers.json'
'input/raw_data/products.parquet' -> 'archive/raw_backup_20260101/products.parquet'
```
**Actual** - 2026-01-01 03:25:30
- Hasil sesuai eksekusi (exit code 0)
---
**Expected** - 2026-01-01 03:28:22
- membuat banyak file sekaligus dengan brace expantion range{1..5} ini akan membuat file arutan 1-5


**Command** - 2026-01-01 03:29:57
```bash
(touch tmp/temp{1..5}.txt; tree tmp)
```
**Output (ringkas)** - 2026-01-01 03:29:57
```text
tmp
├── sales_2024.csv
├── temp1.txt
├── temp2.txt
├── temp3.txt
├── temp4.txt
└── temp5.txt

1 directory, 6 files
```
**Actual** - 2026-01-01 03:30:19
- Hasil sesuai eksekusi (exit code 0)
---
**Expected** - 2026-01-01 03:31:34
- menghapus file tmp/temp5.txt


**Command** - 2026-01-01 03:32:02
```bash
rm -v temp/temp5.txt
```
**Output (ringkas)** - 2026-01-01 03:32:02
```text
rm: cannot remove 'temp/temp5.txt': No such file or directory
```


**Error / Mistake** - 2026-01-01 03:32:42
- salah penyebutan folder harusnya tmp/


**Command** - 2026-01-01 03:32:57
```bash
rm -v tmp/temp5.txt
```
**Output (ringkas)** - 2026-01-01 03:32:57
```text
removed 'tmp/temp5.txt'
```
**Actual** - 2026-01-01 03:33:07
- Hasil sesuai eksekusi (exit code 0)
---
**Tags**: #cp #mv #tree #touch #rm
---
