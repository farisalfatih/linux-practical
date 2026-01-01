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
### link(Symbolic & Hard) - 2026-01-01 14:18:53
#### Persiapan folder latihan - 2026-01-01 14:26:57


**Command** - 2026-01-01 14:58:40
```bash
(mkdir input output; echo 'connect' > input/original-symplink.txt; echo 'berhasil memanggil inode file, jika file asli dihapus linux tetap menyimpan informasi file sampai file dan semua hardlink dihapus' > input/original-hardlink.txt; tree; cat input/original-hardlink.txt; cat input/original-symplink.txt)
```
**Output (ringkas)** - 2026-01-01 14:58:40
```text
.
├── input
│   ├── original-hardlink.txt
│   └── original-symplink.txt
└── output

3 directories, 2 files
berhasil memanggil inode file, jika file asli dihapus linux tetap menyimpan informasi file sampai file dan semua hardlink dihapus
connect
```
#### Skenario hardlink - 2026-01-01 15:02:35
**Expected** - 2026-01-01 15:05:05
- jika file asli di hapus dari maka hardlink tetap bisa menampilkan isi file karena inode yang menyimpan meta data belum dihapus


**Command** - 2026-01-01 15:10:19
```bash
(ln input/original-hardlink.txt output/hardlink.txt; ls -i input/original-hardlink.txt; ls -i output/hardlink.txt)
```
**Output (ringkas)** - 2026-01-01 15:10:19
```text
87975 input/original-hardlink.txt
87975 output/hardlink.txt
```


**Insight** - 2026-01-01 15:11:34
- link berhasil dibuat dengan hardlink yang memiliki inode -i yang sama


**Command** - 2026-01-01 15:14:57
```bash
(rm -v input/original-hardlink.txt; cat output/hardlink.txt)
```
**Output (ringkas)** - 2026-01-01 15:14:57
```text
removed 'input/original-hardlink.txt'
berhasil memanggil inode file, jika file asli dihapus linux tetap menyimpan informasi file sampai file dan semua hardlink dihapus
```


**Insight** - 2026-01-01 15:16:27
- percobaan berhasil dilakukan yang mana harlink bisa mengakses link meskipun file asli dihapus
#### skenario Symbolic link (s) - 2026-01-01 15:18:01
**Expected** - 2026-01-01 15:20:43
- ketika file asli dihapus link tidak bisa mengaksesnya, readlink digunakan untuk melihat path link dari link jika path itu tidak ada/sudah diapus akan tetap di tampilkan, realpath digunakan untuk melihat path asli dari link jika sumber link dihapus akan error karena realpath melakukan verifikasi dulu


**Command** - 2026-01-01 15:28:31
```bash
ln -s input/original-stplink.txt output/symplink.txt; tree
```
**Output (ringkas)** - 2026-01-01 15:28:32
```text
.
├── input
│   └── original-symplink.txt
└── output
    ├── hardlink.txt
    └── symplink.txt -> input/original-stplink.txt

3 directories, 3 files
```


**Command** - 2026-01-01 15:38:41
```bash
(cat output/symplink.txt; rm -v input/original-symplink.txt; readlink input/original-symplink.txt; realpath input/original-symplink.txt)
```
**Output (ringkas)** - 2026-01-01 15:38:41
```text
cat: output/symplink.txt: No such file or directory
removed 'input/original-symplink.txt'
/home/faris-al-fatih/linux-practical/lab/01-filesystem/commend-dasar/link/input/original-symplink.txt
```


**Error / Mistake** - 2026-01-01 15:41:59
- cat tidak bisa digunakan untuk membaca symbolic link


**Insight** - 2026-01-01 15:43:33
- jika ingin membaca link simbolic cari tau dimana dulu pathnya can baca dari path itu
### Pencarian File - 2026-01-01 17:07:41
#### Menggunakan find untuk pencarian - 2026-01-01 17:18:33
**Objective** - 2026-01-01 17:29:27
- Memahami cara dan variasi menggunakan find


**Context** - 2026-01-01 17:29:40
- User: faris-al-fatih
- Dir: /home/faris-al-fatih/linux-practical
- Shell: /bin/bash
---
**Expected** - 2026-01-01 17:30:48
- Mencari File Beedasarkan nama


**Command** - 2026-01-01 17:31:19
```bash
find . -name README
```
**Output (ringkas)** - 2026-01-01 17:31:19
```text
(no output)
```


**Error / Mistake** - 2026-01-01 17:34:38
- tidak muncul karena yang dicari itu README dan tidak ada yang namanya README yang ada hanya README.md


**Insight** - 2026-01-01 17:37:51
- gunakan -iname untuk case insensitive


**Command** - 2026-01-01 17:37:53
```bash
find . -iname README
```
**Output (ringkas)** - 2026-01-01 17:37:53
```text
(no output)
```


**Error / Mistake** - 2026-01-01 17:42:24
- tidak muncul karena ekstensi filenya diabaikan oleh iname, iname hanya melakukan pengabaian carakter besar dan kecil


**Insight** - 2026-01-01 17:44:05
- gunakan wildcard untuk menangkap variasi nama


**Command** - 2026-01-01 17:44:39
```bash
find . -iname ReaDme*
```
**Output (ringkas)** - 2026-01-01 17:44:39
```text
./README.md
./docs/09-text-processing/README.md
./docs/10-shell-scripting/README.md
./docs/04-prosess/README.md
./docs/08-cron/README.md
./docs/01-filesystem/README.md
./docs/06-networking/README.md
./docs/02-permission/README.md
./docs/03-env-variable/README.md
./docs/05-archive-transfer/README.md
(output dipotong)
```
---
#### menggunakan find untuk mencari waktu - 2026-01-01 17:46:50


**Command** - 2026-01-01 17:47:18
```bash
find . -mtime -4
```
**Output (ringkas)** - 2026-01-01 17:47:18
```text
.
./learnlog.sh
./README.md
./docs
./docs/09-text-processing
./docs/09-text-processing/README.md
./docs/10-shell-scripting
./docs/10-shell-scripting/README.md
./docs/04-prosess/README.md
./docs/08-cron/README.md
(output dipotong)
```
---
#### Menggunakan find untuk mencari berdasarkan tipe object file system - 2026-01-01 17:50:40


**Command** - 2026-01-01 17:51:37
```bash
find . -type d
```
**Output (ringkas)** - 2026-01-01 17:51:37
```text
.
./docs
./docs/09-text-processing
./docs/10-shell-scripting
./docs/04-prosess
./docs/08-cron
./docs/01-filesystem
./docs/06-networking
./docs/02-permission
./docs/03-env-variable
(output dipotong)
```
#### locate digunakan untuk pencarian file yang dibuat oleh library mlocate - 2026-01-01 17:59:36
#### which hanya bisa digunakan untuk melihat execute program - 2026-01-01 18:00:34


**Command** - 2026-01-01 18:00:47
```bash
wich code
```
**Output (ringkas)** - 2026-01-01 18:00:48
```text
Command 'wich' not found, did you mean:
  command 'wick' from snap wick (0+git.e34b005)
  command 'wcch' from deb wcc (0.0.2+dfsg-4.4)
  command 'wish' from deb tk (8.6.13)
  command 'which' from deb debianutils (5.14)
  command 'which' from deb gnu-which (2.21+dfsg-3)
See 'snap info <snapname>' for additional versions.
```


**Error / Mistake** - 2026-01-01 18:01:12
- typo


**Command** - 2026-01-01 18:01:23
```bash
which code
```
**Output (ringkas)** - 2026-01-01 18:01:23
```text
/home/faris-al-fatih/.vscode-server/bin/994fd12f8d3a5aa16f17d42c041e5809167e845a/bin/remote-cli/code
```
### Melihat isi file - 2026-01-01 18:01:45
**Objective** - 2026-01-01 18:02:31
- Mengetahui commend dasar untuk melihat isi file


**Context** - 2026-01-01 18:06:39
- User: faris-al-fatih
- Dir: /home/faris-al-fatih/linux-practical
- Shell: /bin/bash
---
**Expected** - 2026-01-01 18:11:28
- menampilkan semua isi dari file learnlog.sh


**Command** - 2026-01-01 18:11:44
```bash
cat learnlog.sh
```
**Output (ringkas)** - 2026-01-01 18:11:44
```text
LOG="$HOME/linux-practical/LEARNLOG.md"

TS() {
  date '+%Y-%m-%d %H:%M:%S'
}

sep() {
  echo -e "---" >> "$LOG"
}

(output dipotong)
```
**Actual** - 2026-01-01 18:12:04
- Eksekusi gagal (exit code )
---
