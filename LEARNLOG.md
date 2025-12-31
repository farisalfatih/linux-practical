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
