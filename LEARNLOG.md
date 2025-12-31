# Filesystem & Path Linux - 2025-12-31 23:02:35
## Commend Dasar - 2025-12-31 23:03:21
### Navigasi & Explorasi - 2025-12-31 23:03:57
**Objective** - 2025-12-31 23:06:58
- Mengetahui posisi directory sat ini dan mahir berpindah antar directory

**Context** - 2025-12-31 23:07:23
- User: faris-al-fatih
- Dir: /home/faris-al-fatih/linux-practical
- Shell: /bin/bash
---
**Expected** - 2025-12-31 23:10:21
- pwd menampilkan path directory absolut milai dari root

**Command** - 2025-12-31 23:18:43
```bash
pwd
```
**Output (ringkas)** - 2025-12-31 23:18:43
```text
/home/faris-al-fatih/linux-practical
```

**Actual** - 2025-12-31 23:30:40
- Hasil sesuai eksekusi (exit code 0)
---

**Expected** - 2025-12-31 23:38:30
- cd ke directory docs karena - digunakan saat cd, sebelumnya berada di directory itu

**Command** - 2025-12-31 23:53:17
```bash
cd -
```
**Output (ringkas)** - 2025-12-31 23:53:17
```text
/home/faris-al-fatih/linux-practical/docs
```
**Actual** - 2025-12-31 23:53:17
- Hasil sesuai eksekusi (exit code 0)
---
**Expected** - 2025-12-31 23:54:26
- kembali ke home karena cd menggunakan ~

**Command** - 2025-12-31 23:55:47
```bash
cd ~ && pwd
```
**Output (ringkas)** - 2025-12-31 23:55:47
```text
/home/faris-al-fatih
```
**Actual** - 2025-12-31 23:56:06
- Hasil sesuai eksekusi (exit code 0)
---
**Expected** - 2026-01-01 00:01:03
- menampilkan list (ls) dengan long format (l)/detail, all(semua file termasuk hidden), dan h(human readable)/yang mudah dibaca contoh unuran file dari biner ke kb/mb

**Command** - 2026-01-01 00:02:02
```bash
ls -lah
```
**Output (ringkas)** - 2026-01-01 00:02:02
```text
total 44K
drwxr-xr-x  5 faris-al-fatih faris-al-fatih 4.0K Dec 31 22:43 .
drwxr-x--- 17 faris-al-fatih faris-al-fatih 4.0K Dec 31 22:52 ..
drwxr-xr-x  8 faris-al-fatih faris-al-fatih 4.0K Dec 31 21:32 .git
-rw-r--r--  1 faris-al-fatih faris-al-fatih 1.6K Jan  1 00:02 LEARNLOG.md
-rw-r--r--  1 faris-al-fatih faris-al-fatih 8.8K Dec 30 15:06 README.md
drwxr-xr-x 12 faris-al-fatih faris-al-fatih 4.0K Dec 29 16:02 docs
-rw-r--r--  1 faris-al-fatih faris-al-fatih 1.6K Dec 31 23:52 learnlog.sh
-rw-r--r--  1 faris-al-fatih faris-al-fatih 3.5K Dec 31 22:45 penjelasan-script-log.md
drwxr-xr-x  2 faris-al-fatih faris-al-fatih 4.0K Dec 31 21:54 scripts
```
**Actual** - 2026-01-01 00:02:38
- Hasil sesuai eksekusi (exit code 0)
---
**Expected** - 2026-01-01 00:44:28
- tree menampilkan stuktur directory dalam visual pohon dengan level(L) 2 yaitu sub sub ditectory

**Command** - 2026-01-01 00:44:59
```bash
tree -L 2
```
**Output (ringkas)** - 2026-01-01 00:44:59
```text
.
├── LEARNLOG.md
├── README.md
├── docs
│   ├── 01-filesystem
│   ├── 02-permission
│   ├── 03-env-variable
│   ├── 04-prosess
│   ├── 05-archive-transfer
│   ├── 06-networking
(output dipotong)
```
---
**Tags**: #pwd #cd #ls #tree
--

### Membuat dan menghapus File System Objects - 2026-01-01 00:47:48
**Objective** - 2026-01-01 00:49:34
- mengetahui bagaimana menghapus dan membuat file system objects

**Context** - 2026-01-01 00:50:30
- User: faris-al-fatih
- Dir: /home/faris-al-fatih/linux-practical
- Shell: /bin/bash
---
**Expected** - 2026-01-01 00:51:31
- mkdir membuat folder dengan -p(parent)/recursive jadi membuat folder beserta parentnya/membuat struktur folder bertingkat

**Command** - 2026-01-01 00:52:39
```bash
mkdir -p a/b/c && tree a
```
**Output (ringkas)** - 2026-01-01 00:52:39
```text
a
└── b
    └── c

3 directories, 0 files
```
**Actual** - 2026-01-01 00:53:00
- Hasil sesuai eksekusi (exit code 0)
---
**Expected** - 2026-01-01 00:58:26
- touch digunakan untuk membuat file kosong dan jika sudah ada maka akan di update timestampnya
**Command** - 2026-01-01 01:00:35
```bash
touch a/b/c/file.txt && ls -l a/b/c/file.txt
```
**Output (ringkas)** - 2026-01-01 01:00:35
```text
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 0 Jan  1 01:00 a/b/c/file.txt
```
**Actual** - 2026-01-01 01:00:49
- Hasil sesuai eksekusi (exit code 0)
---
**Expected** - 2026-01-01 01:06:42
- rmdir digunakan untuk menghapus folder kosong, jika folder ada isinya maka tidak bisa di hapus berbeda dengan rm, disini saya menggunakan v(verbose) untuk untuk mengetahui tindakan yang dilakukan oleh perintah
**Command** - 2026-01-01 01:07:37
```bash
rmdir -v a/b/c
```
**Output (ringkas)** - 2026-01-01 01:07:37
```text
rmdir: removing directory, 'a/b/c'
rmdir: failed to remove 'a/b/c': Directory not empty
```
**Actual** - 2026-01-01 01:07:47
- Hasil sesuai eksekusi (exit code 0)
**Insight** - 2026-01-01 01:09:03
- Bisa dilihat bahwa folder yang ada isinya tidak bisa dihapus dengan rmdir
---
**Expected** - 2026-01-01 01:15:17
- mr digunakan untuk menghapus file dan folder dengan -r(recrisive) bisa menghapus keseluruhan dari isi folder, dan dengan f(force) bisa menghapus bahkan jika perizinan write nya tidak ada
**Command** - 2026-01-01 01:17:44
```bash
tree -Lp 1 a && rm -rfv a
```
**Output (ringkas)** - 2026-01-01 01:17:44
```text
[dr-xr-xr-x]  a
└── [drwxr-xr-x]  b

2 directories, 0 files
removed 'a/b/c/file.txt'
removed directory 'a/b/c'
rm: cannot remove 'a/b': Permission denied
```
**Error / Mistake** - 2026-01-01 01:21:16
- -f tidak override permission sistem. tanpa write access atau root, folder/file tetap tidak bisa dihapus.
**Insight** - 2026-01-01 01:22:49
- saya akan mengembalikan permissionnya agar user punya akses write
**Command** - 2026-01-01 01:24:43
```bash
tree -Lp 1 a && rm -rfv a
```
**Output (ringkas)** - 2026-01-01 01:24:43
```text
[drwxr-xr-x]  a
└── [drwxr-xr-x]  b

2 directories, 0 files
removed directory 'a/b'
removed directory 'a'
```
---
**Tags**: #mkdir #touch #rm #rmdir
---
### Coppy, Move, dan Rename File System Objects - 2026-01-01 01:29:17
**Objective** - 2026-01-01 01:45:57
- mengetahui bagaimana pergerakan file system objects

**Context** - 2026-01-01 01:46:58
- User: faris-al-fatih
- Dir: /home/faris-al-fatih/linux-practical/cmr
- Shell: /bin/bash
---
**Expected** - 2026-01-01 02:00:15
- Coppy(cp) folder coppy dengan nama coppy1


**Command** - 2026-01-01 02:04:26
```bash
cp -v coppy coppy1
```
**Output (ringkas)** - 2026-01-01 02:04:26
```text
cp: -r not specified; omitting directory 'coppy'
```
**Actual** - 2026-01-01 02:04:33
- Hasil sesuai eksekusi (exit code 0)


**Error / Mistake** - 2026-01-01 02:04:45
- cp tidak bisa melakukan coppy folder


**Insight** - 2026-01-01 02:05:27
- gunakan recrusive(r) untuk coppy folder
---
**Expected** - 2026-01-01 02:06:07
- Coppy(cp) folder coppy dengan nama coppy1 menggunakan r


**Command** - 2026-01-01 02:07:05
```bash
cp -vr coppy coppy1
```
**Output (ringkas)** - 2026-01-01 02:07:06
```text
'coppy' -> 'coppy1'
```
**Actual** - 2026-01-01 02:07:19
- Hasil sesuai eksekusi (exit code 0)
---
**Expected** - 2026-01-01 02:08:39
- merubah nama folder coppy1 menjadi coppy-rename


**Command** - 2026-01-01 02:09:06
```bash
mv -v coppy1 coppy-rename
```
**Output (ringkas)** - 2026-01-01 02:09:06
```text
renamed 'coppy1' -> 'coppy-rename'
```
**Actual** - 2026-01-01 02:09:32
- Hasil sesuai eksekusi (exit code 0)
---
**Expected** - 2026-01-01 02:12:39
- memindahkan file.txt ke folder move


**Command** - 2026-01-01 02:13:19
```bash
mv -v file.txt move/
```
**Output (ringkas)** - 2026-01-01 02:13:19
```text
renamed 'file.txt' -> 'move/file.txt'
```
**Actual** - 2026-01-01 02:13:34
- Hasil sesuai eksekusi (exit code 0)
---
**Tags**: #cp #mv
---
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
