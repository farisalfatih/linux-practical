# Learning Log

Started: 2026-01-09

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── filesize_human_readable_opsi.txt
├── find.txt
├── generate_sort_uniq_data.sh
├── logs_timestamp_duplicate_opsi.log
├── mixed_key_value_opsi.txt
├── numbers_numeric_opsi.txt
├── strings_duplicate_case_opsi.txt
└── users_csv_multicolumn_opsi.csv

1 directory, 8 files
```
✅ Exit code: 0

**💻 Command:**
```bash
ls
```

**🖥️ Output:**
```
filesize_human_readable_opsi.txt
generate_sort_uniq_data.sh
logs_timestamp_duplicate_opsi.log
mixed_key_value_opsi.txt
numbers_numeric_opsi.txt
strings_duplicate_case_opsi.txt
users_csv_multicolumn_opsi.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/02-pencarian-dan-filtering/2-4_sorting-dan-deduplikasi
```
✅ Exit code: 0

**📂 Context:**

- Skenario ini dijalankan pada direktori:
  ```
  /home/faris-al-fatih/linux-practical/lab/02-pencarian-dan-filtering/2-4_sorting-dan-deduplikasi
  ```
- Catatan:
  - Tidak ada perintah `cd` yang dijalankan.
  - Semua command menggunakan working directory aktif saat ini.
  - Perubahan direktori **tidak otomatis tercatat** kecuali kamu eksplisit menjalankan `cd`.


---

## 📚 2026-01-09 21:00:21 - Exercise: sort (urutkan baris)


### 2026-01-09 21:03:11 - sort tanpa opsi
**💻 Command:**
```bash
bash -e for f in *; do   if [ -f "$f" ] && [[ "$f" != *.sh ]]; then     echo "==> $f <==";     cat "$f";   fi; done
```

**🖥️ Output:**
```
bash: for f in *; do   if [ -f "$f" ] && [[ "$f" != *.sh ]]; then     echo "==> $f <==";     cat "$f";   fi; done: No such file or directory
```
❌ Exit code: 1

**💻 Command:**
```bash
bash -c for f in *; do   if [ -f "$f" ] && [[ "$f" != *.sh ]]; then     echo "==> $f <==";     cat "$f";   fi; done
```

**🖥️ Output:**
```
==> filesize_human_readable_opsi.txt <==
1K
500M
20K
2G
800
15M
==> logs_timestamp_duplicate_opsi.log <==
2025-01-01 login user1
2024-12-31 logout user2
2025-01-01 login user1
2025-01-02 login user3
2025-01-02 login user3
==> mixed_key_value_opsi.txt <==
id1:100
id3:300
id2:200
id1:100
id2:200
==> numbers_numeric_opsi.txt <==
10
2
100
25
3
7
42
==> strings_duplicate_case_opsi.txt <==
apple
banana
apple
Apple
banana
banana
APPLE
==> users_csv_multicolumn_opsi.csv <==
1001,andi,50000
1003,budi,75000
1002,andi,50000
1001,andi,50000
1002,Andi,50000
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c find . -type f ! -name "*.sh" -exec cat {} + | sort
```

**🖥️ Output:**
```
10
100
1001,andi,50000
1001,andi,50000
1002,Andi,50000
1002,andi,50000
1003,budi,75000
15M
1K
2
2024-12-31 logout user2
2025-01-01 login user1
2025-01-01 login user1
2025-01-02 login user3
2025-01-02 login user3
20K
25
2G
3
42
500M
7
800
APPLE
Apple
apple
apple
banana
banana
banana
id1:100
id1:100
id2:200
id2:200
id3:300
```
✅ Exit code: 0

- 📝 urutan default sort tanpa opsi: simbol, angka 0-9, huruf besar A-Z, lalu huruf kecil a-z.
**✅ 2026-01-09 21:31:51 - Status:** COMPLETED


### 2026-01-09 21:33:07 - opsi -n - urutkan merdasarkan nomor
**💻 Command:**
```bash
cat numbers_numeric_opsi.txt
```

**🖥️ Output:**
```
10
2
100
25
3
7
42
```
✅ Exit code: 0

**💻 Command:**
```bash
sort -n numbers_numeric_opsi.txt
```

**🖥️ Output:**
```
2
3
7
10
25
42
100
```
✅ Exit code: 0


**✅ 2026-01-09 21:35:04 - Status:** COMPLETED


### 2026-01-09 21:36:18 - opsi -r digunakan untuk membalik urutan
**💻 Command:**
```bash
sort -r numbers_numeric_opsi.txt
```

**🖥️ Output:**
```
7
42
3
25
2
100
10
```
✅ Exit code: 0

**💻 Command:**
```bash
cat -r numbers_numeric_opsi.txt
```

**🖥️ Output:**
```
cat: invalid option -- 'r'
Try 'cat --help' for more information.
```
❌ Exit code: 1

**💻 Command:**
```bash
cat numbers_numeric_opsi.txt
```

**🖥️ Output:**
```
10
2
100
25
3
7
42
```
✅ Exit code: 0

- 📝 opsi -r digunakan untuk membalik urutan
**✅ 2026-01-09 21:38:02 - Status:** COMPLETED

### opsi -u digunakan untuk menghapus duplikat

**💻 Command:**
```bash
cat strings_duplicate_case_opsi.txt
```

**🖥️ Output:**
```
apple
banana
apple
Apple
banana
banana
APPLE
```
✅ Exit code: 0

**💻 Command:**
```bash
sort strings_duplicate_case_opsi.txt
```

**🖥️ Output:**
```
APPLE
Apple
apple
apple
banana
banana
banana
```
✅ Exit code: 0

**💻 Command:**
```bash
sort -u strings_duplicate_case_opsi.txt
```

**🖥️ Output:**
```
APPLE
Apple
apple
banana
```
✅ Exit code: 0

**✅ 2026-01-09 22:41:44 - Status:** COMPLETED


### 2026-01-09 22:45:59 - opsi -t CHAR
**💻 Command:**
```bash
sort -t users_csv_multicolumn_opsi.csv
```

**🖥️ Output:**
```
sort: multi-character tab ‘users_csv_multicolumn_opsi.csv’
```
❌ Exit code: 2

**💻 Command:**
```bash
cat users_csv_multicolumn_opsi.csv
```

**🖥️ Output:**
```
1001,andi,50000
1003,budi,75000
1002,andi,50000
1001,andi,50000
1002,Andi,50000
```
✅ Exit code: 0

**💻 Command:**
```bash
sort users_csv_multicolumn_opsi.csv
```

**🖥️ Output:**
```
1001,andi,50000
1001,andi,50000
1002,Andi,50000
1002,andi,50000
1003,budi,75000
```
✅ Exit code: 0

**💻 Command:**
```bash
sort -t , -k 2 users_csv_multicolumn_opsi.csv
```

**🖥️ Output:**
```
1002,Andi,50000
1001,andi,50000
1001,andi,50000
1002,andi,50000
1003,budi,75000
```
✅ Exit code: 0

- 📝 opsi -t CHAR digunakan untuk deleimiter file, contoh hasil diatas mengambil key ke 2 berdasarkan delimiter

### 2026-01-09 23:03:15 - opsi -k N - key
**💻 Command:**
```bash
sort -t , -k 2 users_csv_multicolumn_opsi.csv
```

**🖥️ Output:**
```
1002,Andi,50000
1001,andi,50000
1001,andi,50000
1002,andi,50000
1003,budi,75000
```
✅ Exit code: 0

**💻 Command:**
```bash
sort logs_timestamp_duplicate_opsi.log
```

**🖥️ Output:**
```
2024-12-31 logout user2
2025-01-01 login user1
2025-01-01 login user1
2025-01-02 login user3
2025-01-02 login user3
```
✅ Exit code: 0

**💻 Command:**
```bash
sort -k 3 logs_timestamp_duplicate_opsi.log
```

**🖥️ Output:**
```
2025-01-01 login user1
2025-01-01 login user1
2024-12-31 logout user2
2025-01-02 login user3
2025-01-02 login user3
```
✅ Exit code: 0

- 📝 opsi -k gigunakan untuk mengurutkan berdasarkan key kolom, defaultnya adalah spasi/tab, jika yang lainnya kombinasikan dengan -t

### 2026-01-09 23:10:43 - opsi -h - human numeric
**💻 Command:**
```bash
sort filesize_human_readable_opsi.txt
```

**🖥️ Output:**
```
15M
1K
20K
2G
500M
800
```
✅ Exit code: 0

**💻 Command:**
```bash
sort -h filesize_human_readable_opsi.txt
```

**🖥️ Output:**
```
800
1K
20K
15M
500M
2G
```
✅ Exit code: 0

- 📝 opsi -h digunakan untuk sort berdasarkan human readable

### 2026-01-09 23:13:47 - opsi -o file - output
**💻 Command:**
```bash
cat users_csv_multicolumn_opsi.csv
```

**🖥️ Output:**
```
1001,andi,50000
1003,budi,75000
1002,andi,50000
1001,andi,50000
1002,Andi,50000
```
✅ Exit code: 0

**💻 Command:**
```bash
sort -o users_csv_multicolumn_opsi.csv
```

**🖥️ Output:**
```
**💻 Command:**
```bash
sort -o users_csv_multicolumn_opsi.csv users_csv_multicolumn_opsi.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
cat users_csv_multicolumn_opsi.csv
```

**🖥️ Output:**
```
1001,andi,50000
1001,andi,50000
1002,Andi,50000
1002,andi,50000
1003,budi,75000
```
✅ Exit code: 0

- 📝 opsi -o file digunakan untuk menulis ke file tertentu tanpa memerlukan redirec manual
**✅ 2026-01-09 23:20:00 - Status:** COMPLETED


---

## 📚 2026-01-09 23:21:00 - Exercise: uniq (hapus duplikat berurutan)

**💻 Command:**
```bash
cat users_csv_multicolumn_opsi.csv
```

**🖥️ Output:**
```
1001,andi,50000
1001,andi,50000
1002,Andi,50000
1002,andi,50000
1003,budi,75000
```
✅ Exit code: 0

**💻 Command:**
```bash
uniq users_csv_multicolumn_opsi.csv
```

**🖥️ Output:**
```
1001,andi,50000
1002,Andi,50000
1002,andi,50000
1003,budi,75000
```
✅ Exit code: 0

- 📝 uniq tanpa opsi digunakan untuk menghapus duplikat yang berurutan

### 2026-01-09 23:26:06 - opsi -c - count
**💻 Command:**
```bash
uniq -c users_csv_multicolumn_opsi.csv
```

**🖥️ Output:**
```
      2 1001,andi,50000
      1 1002,Andi,50000
      1 1002,andi,50000
      1 1003,budi,75000
```
✅ Exit code: 0

- 📝 dengan -c akan ditampilkan berpa baris yang sama
**💻 Command:**
```bash
find . -type f ! -name *.sh -exec uniq -c {} ;
```

**🖥️ Output:**
```
      1 id1:100
      1 id3:300
      1 id2:200
      1 id1:100
      1 id2:200
      1 10
      1 2
      1 100
      1 25
      1 3
      1 7
      1 42
      1 apple
      1 banana
      1 apple
      1 Apple
      2 banana
      1 APPLE
      1 2025-01-01 login user1
      1 2024-12-31 logout user2
      1 2025-01-01 login user1
      2 2025-01-02 login user3
      2 1001,andi,50000
      1 1002,Andi,50000
      1 1002,andi,50000
      1 1003,budi,75000
      1 1K
      1 500M
      1 20K
      1 2G
      1 800
      1 15M
```
✅ Exit code: 0


### 2026-01-09 23:29:00 - opsi -d - duplicated - tampilkan hanya baris duplikat
**💻 Command:**
```bash
find . -type f ! -name *.sh -exec uniq -d {} ;
```

**🖥️ Output:**
```
banana
2025-01-02 login user3
1001,andi,50000
```
✅ Exit code: 0

**✅ 2026-01-09 23:29:14 - Status:** COMPLETED


### 2026-01-09 23:30:09 - opsi -u - uniq - tampilkan hanya baris yang uniq dan tidak duplikat
**💻 Command:**
```bash
find . -type f ! -name *.sh -exec uniq -u {} ;
```

**🖥️ Output:**
```
id1:100
id3:300
id2:200
id1:100
id2:200
10
2
100
25
3
7
42
apple
banana
apple
Apple
APPLE
2025-01-01 login user1
2024-12-31 logout user2
2025-01-01 login user1
1002,Andi,50000
1002,andi,50000
1003,budi,75000
1K
500M
20K
2G
800
15M
```
✅ Exit code: 0

- 📝 ah saya lupa kalo belum di sort
- 📝 akan saya sort dulu semua filenya
- 📝 akan saya gunakan opsi -o jadi tidak ditulis di log
**💻 Command:**
```bash
find . -type f ! -name *.sh -exec cat {} ;
```

**🖥️ Output:**
```
id1:100
id1:100
id2:200
id2:200
id3:300
2
3
7
10
25
42
100
APPLE
Apple
apple
apple
banana
banana
banana
2024-12-31 logout user2
2025-01-01 login user1
2025-01-01 login user1
2025-01-02 login user3
2025-01-02 login user3
1001,andi,50000
1001,andi,50000
1002,Andi,50000
1002,andi,50000
1003,budi,75000
800
1K
20K
15M
500M
2G
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -type f ! -name *.sh -exec uniq -cu {} ;
```

**🖥️ Output:**
```
      1 id3:300
      1 2
      1 3
      1 7
      1 10
      1 25
      1 42
      1 100
      1 APPLE
      1 Apple
      1 2024-12-31 logout user2
      1 1002,Andi,50000
      1 1002,andi,50000
      1 1003,budi,75000
      1 800
      1 1K
      1 20K
      1 15M
      1 500M
      1 2G
```
✅ Exit code: 0

**💻 Command:**
```bash
find . -type f ! -name *.sh -exec uniq -cd {} ;
```

**🖥️ Output:**
```
      2 id1:100
      2 id2:200
      2 apple
      3 banana
      2 2025-01-01 login user1
      2 2025-01-02 login user3
      2 1001,andi,50000
```
✅ Exit code: 0

- 📝 opsi -u digunakan untuk hanya menampilkan baris yang unik dalam konteks yang berurutan
**✅ 2026-01-09 23:45:49 - Status:** COMPLETED


### 2026-01-09 23:47:19 - opsi -i - ignore case - mengabaikan huruf kapital dan tidak
**💻 Command:**
```bash
find . -type f ! -name *.sh -exec uniq -i {} ;
```

**🖥️ Output:**
```
id1:100
id2:200
id3:300
2
3
7
10
25
42
100
APPLE
banana
2024-12-31 logout user2
2025-01-01 login user1
2025-01-02 login user3
1001,andi,50000
1002,Andi,50000
1003,budi,75000
800
1K
20K
15M
500M
2G
```
✅ Exit code: 0

**💻 Command:**
```bash
cat stre
```

**🖥️ Output:**
```
cat: stre: No such file or directory
```
❌ Exit code: 1

**💻 Command:**
```bash
cat strings_duplicate_case_opsi.txt
```

**🖥️ Output:**
```
APPLE
Apple
apple
apple
banana
banana
banana
```
✅ Exit code: 0

**💻 Command:**
```bash
uniq -i strings_duplicate_case_opsi.txt
```

**🖥️ Output:**
```
APPLE
banana
```
✅ Exit code: 0

**💻 Command:**
```bash
uniq -ic strings_duplicate_case_opsi.txt
```

**🖥️ Output:**
```
      4 APPLE
      3 banana
```
✅ Exit code: 0

**💻 Command:**
```bash
uniq -c strings_duplicate_case_opsi.txt
```

**🖥️ Output:**
```
      1 APPLE
      1 Apple
      2 apple
      3 banana
```
✅ Exit code: 0

- 📝 jadi dengan opsi -i meskipun ada karakter yang kapital maka akan terhitung sebagai duplikat
**✅ 2026-01-09 23:50:44 - Status:** COMPLETED


### 2026-01-09 23:53:45 - opsi -f N - skip field - digunakan untuk deduplicate bassed di spesifik field
**💻 Command:**
```bash
uniq strings_duplicate_case_opsi.txt
```

**🖥️ Output:**
```
APPLE
Apple
apple
banana
```
✅ Exit code: 0

**💻 Command:**
```bash
cat strings_duplicate_case_opsi.txt
```

**🖥️ Output:**
```
APPLE
Apple
apple
apple
banana
banana
banana
```
✅ Exit code: 0

**💻 Command:**
```bash
uniq -f 5 strings_duplicate_case_opsi.txt
```

**🖥️ Output:**
```
APPLE
```
✅ Exit code: 0

- 📝 salah paham, maksud -f disini itu adalah kolom yang dipisahkan oleh sesuatu

**💻 Command:**
```bash
cat logs_timestamp_duplicate_opsi.log
```

**🖥️ Output:**
```
2024-12-31 logout user2
2025-01-01 login user1
2025-01-01 login user1
2025-01-02 login user3
2025-01-02 login user3
```
✅ Exit code: 0

**💻 Command:**
```bash
uniq -f 2 logs_timestamp_duplicate_opsi.log
```

**🖥️ Output:**
```
2024-12-31 logout user2
2025-01-01 login user1
2025-01-02 login user3
```
✅ Exit code: 0

- 📝 opsi -f N digunakan untuk mengabaikan kolom tertentu, defaultny adalah spasi atau tab
**✅ 2026-01-10 00:16:06 - Status:** COMPLETED


---

## 📊 2026-01-10 00:17:43 - Session Summary

- **Total exercises:** 2
- **Completed:** 9
- **Failed:** 0

