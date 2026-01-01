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
---

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
