# Learning Log

Started: 2026-01-10

**💻 Command:**
```bash
head -n 11 ../2-5_ekstraksi-kolom/btc30days_clean.csv
```

**🖥️ Output:**
```
date,open,high,low,close,volume
2025-12-09,90634.35000000,94588.99000000,89500.00000000,92678.80000000,21240.43014000
2025-12-10,92678.81000000,94476.00000000,91563.15000000,92015.37000000,18998.68083000
2025-12-11,92015.38000000,93555.00000000,89260.63000000,92513.38000000,19972.58758000
2025-12-12,92513.38000000,92754.00000000,89480.00000000,90268.42000000,16679.19169000
2025-12-13,90268.43000000,90634.55000000,89766.39000000,90240.01000000,5895.70788000
2025-12-14,90240.00000000,90472.40000000,87577.36000000,88172.17000000,9416.94004000
2025-12-15,88172.16000000,90052.64000000,85146.64000000,86432.08000000,19778.69190000
2025-12-16,86432.08000000,88175.98000000,85266.00000000,87863.42000000,18456.05017000
2025-12-17,87863.43000000,90365.85000000,85314.00000000,86243.22000000,19834.11729000
2025-12-18,86243.23000000,89477.61000000,84450.01000000,85516.41000000,25405.41763000
```
✅ Exit code: 0

**💻 Command:**
```bash
head -n 16 ../2-5_ekstraksi-kolom/btc30days_clean.csv
```

**🖥️ Output:**
```
date,open,high,low,close,volume
2025-12-09,90634.35000000,94588.99000000,89500.00000000,92678.80000000,21240.43014000
2025-12-10,92678.81000000,94476.00000000,91563.15000000,92015.37000000,18998.68083000
2025-12-11,92015.38000000,93555.00000000,89260.63000000,92513.38000000,19972.58758000
2025-12-12,92513.38000000,92754.00000000,89480.00000000,90268.42000000,16679.19169000
2025-12-13,90268.43000000,90634.55000000,89766.39000000,90240.01000000,5895.70788000
2025-12-14,90240.00000000,90472.40000000,87577.36000000,88172.17000000,9416.94004000
2025-12-15,88172.16000000,90052.64000000,85146.64000000,86432.08000000,19778.69190000
2025-12-16,86432.08000000,88175.98000000,85266.00000000,87863.42000000,18456.05017000
2025-12-17,87863.43000000,90365.85000000,85314.00000000,86243.22000000,19834.11729000
2025-12-18,86243.23000000,89477.61000000,84450.01000000,85516.41000000,25405.41763000
2025-12-19,85516.41000000,89399.97000000,85110.24000000,88136.94000000,21256.65004000
2025-12-20,88136.95000000,88573.07000000,87795.76000000,88360.90000000,5123.13194000
2025-12-21,88360.91000000,89081.77000000,87600.04000000,88658.86000000,7132.87258000
2025-12-22,88658.87000000,90588.23000000,87900.00000000,88620.79000000,14673.21970000
2025-12-23,88620.79000000,88940.00000000,86601.90000000,87486.00000000,13910.32904000
```
✅ Exit code: 0

**💻 Command:**
```bash
diff btc_10.csv btc_15.csv
```

**🖥️ Output:**
```
11a12,16
> 2025-12-19,85516.41000000,89399.97000000,85110.24000000,88136.94000000,21256.65004000
> 2025-12-20,88136.95000000,88573.07000000,87795.76000000,88360.90000000,5123.13194000
> 2025-12-21,88360.91000000,89081.77000000,87600.04000000,88658.86000000,7132.87258000
> 2025-12-22,88658.87000000,90588.23000000,87900.00000000,88620.79000000,14673.21970000
> 2025-12-23,88620.79000000,88940.00000000,86601.90000000,87486.00000000,13910.32904000
```
❌ Exit code: 1

**💻 Command:**
```bash
diff -q btc_10.csv btc_15.csv
```

**🖥️ Output:**
```
Files btc_10.csv and btc_15.csv differ
```
❌ Exit code: 1

**💻 Command:**
```bash
diff -u btc_10.csv btc_15.csv
```

**🖥️ Output:**
```
--- btc_10.csv	2026-01-10 11:11:28.172382605 +0700
+++ btc_15.csv	2026-01-10 11:12:13.365815420 +0700
@@ -9,3 +9,8 @@
 2025-12-16,86432.08000000,88175.98000000,85266.00000000,87863.42000000,18456.05017000
 2025-12-17,87863.43000000,90365.85000000,85314.00000000,86243.22000000,19834.11729000
 2025-12-18,86243.23000000,89477.61000000,84450.01000000,85516.41000000,25405.41763000
+2025-12-19,85516.41000000,89399.97000000,85110.24000000,88136.94000000,21256.65004000
+2025-12-20,88136.95000000,88573.07000000,87795.76000000,88360.90000000,5123.13194000
+2025-12-21,88360.91000000,89081.77000000,87600.04000000,88658.86000000,7132.87258000
+2025-12-22,88658.87000000,90588.23000000,87900.00000000,88620.79000000,14673.21970000
+2025-12-23,88620.79000000,88940.00000000,86601.90000000,87486.00000000,13910.32904000
```
❌ Exit code: 1

**💻 Command:**
```bash
comm btc_10.csv btc_15.csv
```

**🖥️ Output:**
```
		date,open,high,low,close,volume
		2025-12-09,90634.35000000,94588.99000000,89500.00000000,92678.80000000,21240.43014000
		2025-12-10,92678.81000000,94476.00000000,91563.15000000,92015.37000000,18998.68083000
		2025-12-11,92015.38000000,93555.00000000,89260.63000000,92513.38000000,19972.58758000
		2025-12-12,92513.38000000,92754.00000000,89480.00000000,90268.42000000,16679.19169000
		2025-12-13,90268.43000000,90634.55000000,89766.39000000,90240.01000000,5895.70788000
		2025-12-14,90240.00000000,90472.40000000,87577.36000000,88172.17000000,9416.94004000
		2025-12-15,88172.16000000,90052.64000000,85146.64000000,86432.08000000,19778.69190000
		2025-12-16,86432.08000000,88175.98000000,85266.00000000,87863.42000000,18456.05017000
		2025-12-17,87863.43000000,90365.85000000,85314.00000000,86243.22000000,19834.11729000
		2025-12-18,86243.23000000,89477.61000000,84450.01000000,85516.41000000,25405.41763000
	2025-12-19,85516.41000000,89399.97000000,85110.24000000,88136.94000000,21256.65004000
	2025-12-20,88136.95000000,88573.07000000,87795.76000000,88360.90000000,5123.13194000
	2025-12-21,88360.91000000,89081.77000000,87600.04000000,88658.86000000,7132.87258000
	2025-12-22,88658.87000000,90588.23000000,87900.00000000,88620.79000000,14673.21970000
	2025-12-23,88620.79000000,88940.00000000,86601.90000000,87486.00000000,13910.32904000
```
✅ Exit code: 0

**💻 Command:**
```bash
rm -v btc_10.csv btc_15.csv filesize_human_readable_opsi.txt generate_sort_uniq_data.sh logs_timestamp_duplicate_opsi.log mixed_key_value_opsi.txt numbers_numeric_opsi.txt strings_duplicate_case_opsi.txt users_csv_multicolumn_opsi.csv
```

**🖥️ Output:**
```
removed 'btc_10.csv'
removed 'btc_15.csv'
removed 'filesize_human_readable_opsi.txt'
removed 'generate_sort_uniq_data.sh'
removed 'logs_timestamp_duplicate_opsi.log'
removed 'mixed_key_value_opsi.txt'
removed 'numbers_numeric_opsi.txt'
removed 'strings_duplicate_case_opsi.txt'
removed 'users_csv_multicolumn_opsi.csv'
```
✅ Exit code: 0

**💻 Command:**
```bash
git restore .
```

**🖥️ Output:**
```
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
find . -name btc_1?.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

- 📝 ternyata git restore hapus semua perubahan dan kembalikan ke commit terakhir mangkkannya data di file sebelumnya hilang juga
**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/02-pencarian-dan-filtering/2-6_perbandingan-file
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── comm_useful_A.csv
├── comm_useful_B.csv
├── diff_A.csv
├── diff_B.csv
└── generate.sh

1 directory, 5 files
```
✅ Exit code: 0

**💻 Command:**
```bash
cat generate.sh
```

**🖥️ Output:**
```
cat << 'EOF' > comm_useful_A.csv
2025-01-01,BTC,43000,100
2025-01-02,BTC,43100,120
2025-01-03,BTC,43200,110
2025-01-04,BTC,43300,90
2025-01-05,BTC,43400,95
EOF

cat << 'EOF' > comm_useful_B.csv
2025-01-04,BTC,43300,90
2025-01-01,BTC,43000,100
2025-01-05,BTC,43400,95
2025-01-02,BTC,43100,120
2025-01-03,BTC,43200,110
EOF

cat << 'EOF' > diff_B.csv
2025-01-01,BTC,43000.00,100
2025-01-02,BTC,43150.00,120
2025-01-04,BTC,43300.00,90
2025-01-06,BTC,43500.00,130
EOF

cat << 'EOF' > diff_A.csv
2025-01-01,BTC,43000.00,100
2025-01-02,BTC,43100.00,120
2025-01-03,BTC,43200.00,110
2025-01-04,BTC,43300.00,90
2025-01-05,BTC,43400.00,95
EOF
```
✅ Exit code: 0


---

## 📚 2026-01-10 11:54:26 - Exercise: diff - bandingkan 2 file apa adanya


### 2026-01-10 11:54:35 - diff tanpa opsi
**💻 Command:**
```bash
diff diff_A.csv diff_B.csv
```

**🖥️ Output:**
```
2,3c2
< 2025-01-02,BTC,43100.00,120
< 2025-01-03,BTC,43200.00,110
---
> 2025-01-02,BTC,43150.00,120
5c4
< 2025-01-05,BTC,43400.00,95
---
> 2025-01-06,BTC,43500.00,130
```
❌ Exit code: 1

**💻 Command:**
```bash
cat diff_A.csv diff_B.csv
```

**🖥️ Output:**
```
2025-01-01,BTC,43000.00,100
2025-01-02,BTC,43100.00,120
2025-01-03,BTC,43200.00,110
2025-01-04,BTC,43300.00,90
2025-01-05,BTC,43400.00,95
2025-01-01,BTC,43000.00,100
2025-01-02,BTC,43150.00,120
2025-01-04,BTC,43300.00,90
2025-01-06,BTC,43500.00,130
```
✅ Exit code: 0

**💻 Command:**
```bash
diff comm_useful_A.csv comm_useful_B.csv
```

**🖥️ Output:**
```
0a1
> 2025-01-04,BTC,43300,90
1a3
> 2025-01-05,BTC,43400,95
4,5d5
< 2025-01-04,BTC,43300,90
< 2025-01-05,BTC,43400,95
```
❌ Exit code: 1

**💻 Command:**
```bash
cat comm_useful_A.csv comm_useful_B.csv
```

**🖥️ Output:**
```
2025-01-01,BTC,43000,100
2025-01-02,BTC,43100,120
2025-01-03,BTC,43200,110
2025-01-04,BTC,43300,90
2025-01-05,BTC,43400,95
2025-01-04,BTC,43300,90
2025-01-01,BTC,43000,100
2025-01-05,BTC,43400,95
2025-01-02,BTC,43100,120
2025-01-03,BTC,43200,110
```
✅ Exit code: 0

- 📝 diff membandingkan dua file baris demi baris dengan urutan baris sebagai acuan dan melaporkan perbedaan isinya
**✅ 2026-01-10 13:37:28 - Status:** COMPLETED

- 📝 opsi -q- hanya repor apakah file berbeda
**💻 Command:**
```bash
dirr -q diff_A.csv diff_B.csv
```

**🖥️ Output:**
```
Command 'dirr' not found, did you mean:
  command 'dir' from deb coreutils (9.4-3ubuntu6.1)
  command 'dirt' from deb dput-ng (1.37)
  command 'dirb' from deb dirb (2.22+dfsg-5)
Try: sudo apt install <deb name>
```
❌ Exit code: 127

**💻 Command:**
```bash
diff -q diff_A.csv diff_B.csv
```

**🖥️ Output:**
```
Files diff_A.csv and diff_B.csv differ
```
❌ Exit code: 1

- 📝 ini exit 1 karena emang file berbeda ya bukan karena errorr
**✅ 2026-01-10 13:43:29 - Status:** COMPLETED


### 2026-01-10 13:44:10 - opsi -y tampilkan sdide by side
**💻 Command:**
```bash
diff -y diff_A.csv diff_B.csv
```

**🖥️ Output:**
```
2025-01-01,BTC,43000.00,100					2025-01-01,BTC,43000.00,100
2025-01-02,BTC,43100.00,120				      |	2025-01-02,BTC,43150.00,120
2025-01-03,BTC,43200.00,110				      <
2025-01-04,BTC,43300.00,90					2025-01-04,BTC,43300.00,90
2025-01-05,BTC,43400.00,95				      |	2025-01-06,BTC,43500.00,130
```
❌ Exit code: 1

**✅ 2026-01-10 13:44:36 - Status:** COMPLETED


### 2026-01-10 13:45:30 - opsi -u
**💻 Command:**
```bash
diff -u diff_A.csv diff_B.csv
```

**🖥️ Output:**
```
--- diff_A.csv	2026-01-10 11:50:45.431502952 +0700
+++ diff_B.csv	2026-01-10 11:50:45.427502952 +0700
@@ -1,5 +1,4 @@
 2025-01-01,BTC,43000.00,100
-2025-01-02,BTC,43100.00,120
-2025-01-03,BTC,43200.00,110
+2025-01-02,BTC,43150.00,120
 2025-01-04,BTC,43300.00,90
-2025-01-05,BTC,43400.00,95
+2025-01-06,BTC,43500.00,130
```
❌ Exit code: 1

- 📝 output diff -u ini menunjukkan baris mana yang dihapus (-) dari diff_A.csv dan baris mana yang ditambahkan (+) di diff_B.csv dalam satu konteks perubahan berurutan
**✅ 2026-01-10 13:47:24 - Status:** COMPLETED


### 2026-01-10 13:48:56 - opsi -i ignore case - mengabaikan kapital
**💻 Command:**
```bash
echo HELLO WORLD
```

**🖥️ Output:**
```
HELLO WORLD
```
✅ Exit code: 0

**💻 Command:**
```bash
mv kapitak.xtx kapital.txt
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
echo hello world
```

**🖥️ Output:**
```
hello world
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── comm_useful_A.csv
├── comm_useful_B.csv
├── diff_A.csv
├── diff_B.csv
├── generate.sh
├── kapital.txt
└── kapitil.txt

1 directory, 7 files
```
✅ Exit code: 0

**💻 Command:**
```bash
cat kapital.txt kapitil.txt
```

**🖥️ Output:**
```
HELLO WORLD
hello world
```
✅ Exit code: 0

**💻 Command:**
```bash
diff kapital.txt kapitil.txt
```

**🖥️ Output:**
```
1c1
< HELLO WORLD
---
> hello world
```
❌ Exit code: 1

**💻 Command:**
```bash
diff -q kapital.txt kapitil.txt
```

**🖥️ Output:**
```
Files kapital.txt and kapitil.txt differ
```
❌ Exit code: 1

**💻 Command:**
```bash
diff -i kapital.txt kapitil.txt
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
diff -iq kapital.txt kapitil.txt
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
diff -qi kapital.txt kapitil.txt
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**✅ 2026-01-10 13:54:04 - Status:** COMPLETED

**💻 Command:**
```bash
echo indonesia,malaysia,jepang
```

**🖥️ Output:**
```
indonesia,malaysia,jepang
```
✅ Exit code: 0

**💻 Command:**
```bash
echo indonesia malaysia jepang
```

**🖥️ Output:**
```
indonesia malaysia jepang
```
✅ Exit code: 0

**💻 Command:**
```bash
echo indonesia, malaysia, jepang
```

**🖥️ Output:**
```
indonesia, malaysia, jepang
```
✅ Exit code: 0

**💻 Command:**
```bash
diff koma.txt spasi.txt
```

**🖥️ Output:**
```
1c1
< indonesia,malaysia,jepang
---
> indonesia, malaysia, jepang
```
❌ Exit code: 1

**💻 Command:**
```bash
diff -w koma.txt spasi.txt
```

**🖥️ Output:**
```
```
✅ Exit code: 0

- 📝 opsi -w digunakan untuk mengabaikan whitespace atau spasi
**✅ 2026-01-10 13:58:52 - Status:** COMPLETED


### 2026-01-10 14:01:29 - opsi -r (recursive) - compire data secara recrusif biasanya digunakan untuk membandingkan langsung data di folder proccessing v1 dan v2 atau raw dan pwoccessed tergantung kebutuhan
**💻 Command:**
```bash
mkdir -v raw proccessed
```

**🖥️ Output:**
```
mkdir: created directory 'raw'
mkdir: created directory 'proccessed'
```
✅ Exit code: 0

**💻 Command:**
```bash
mv koma.txt raw/
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
mv -v spasi.txt proccessed/
```

**🖥️ Output:**
```
renamed 'spasi.txt' -> 'proccessed/spasi.txt'
```
✅ Exit code: 0

**💻 Command:**
```bash
diff raw/ proccessed/
```

**🖥️ Output:**
```
Only in raw/: koma.txt
Only in proccessed/: spasi.txt
```
❌ Exit code: 1

**💻 Command:**
```bash
diff -r raw/ proccessed/
```

**🖥️ Output:**
```
Only in raw/: koma.txt
Only in proccessed/: spasi.txt
```
❌ Exit code: 1

**💻 Command:**
```bash
diff -r raw/koma.txt proccessed/spasi.txt
```

**🖥️ Output:**
```
1c1
< indonesia,malaysia,jepang
---
> indonesia, malaysia, jepang
```
❌ Exit code: 1

**💻 Command:**
```bash
diff raw/koma.txt proccessed/spasi.txt
```

**🖥️ Output:**
```
1c1
< indonesia,malaysia,jepang
---
> indonesia, malaysia, jepang
```
❌ Exit code: 1

**✅ 2026-01-10 14:04:59 - Status:** COMPLETED


---

## 📚 2026-01-10 14:05:24 - Exercise: comm bandingkan 2 file terurut

**💻 Command:**
```bash
head -n 11 ../2-5_ekstraksi-kolom/
```

**🖥️ Output:**
```
head: error reading '../2-5_ekstraksi-kolom/': Is a directory
```
❌ Exit code: 1

**💻 Command:**
```bash
head -n 11 ../2-5_ekstraksi-kolom/btc30days_clean.csv
```

**🖥️ Output:**
```
date,open,high,low,close,volume
2025-12-09,90634.35000000,94588.99000000,89500.00000000,92678.80000000,21240.43014000
2025-12-10,92678.81000000,94476.00000000,91563.15000000,92015.37000000,18998.68083000
2025-12-11,92015.38000000,93555.00000000,89260.63000000,92513.38000000,19972.58758000
2025-12-12,92513.38000000,92754.00000000,89480.00000000,90268.42000000,16679.19169000
2025-12-13,90268.43000000,90634.55000000,89766.39000000,90240.01000000,5895.70788000
2025-12-14,90240.00000000,90472.40000000,87577.36000000,88172.17000000,9416.94004000
2025-12-15,88172.16000000,90052.64000000,85146.64000000,86432.08000000,19778.69190000
2025-12-16,86432.08000000,88175.98000000,85266.00000000,87863.42000000,18456.05017000
2025-12-17,87863.43000000,90365.85000000,85314.00000000,86243.22000000,19834.11729000
2025-12-18,86243.23000000,89477.61000000,84450.01000000,85516.41000000,25405.41763000
```
✅ Exit code: 0

**💻 Command:**
```bash
head -n 16 ../2-5_ekstraksi-kolom/btc30days_clean.csv
```

**🖥️ Output:**
```
date,open,high,low,close,volume
2025-12-09,90634.35000000,94588.99000000,89500.00000000,92678.80000000,21240.43014000
2025-12-10,92678.81000000,94476.00000000,91563.15000000,92015.37000000,18998.68083000
2025-12-11,92015.38000000,93555.00000000,89260.63000000,92513.38000000,19972.58758000
2025-12-12,92513.38000000,92754.00000000,89480.00000000,90268.42000000,16679.19169000
2025-12-13,90268.43000000,90634.55000000,89766.39000000,90240.01000000,5895.70788000
2025-12-14,90240.00000000,90472.40000000,87577.36000000,88172.17000000,9416.94004000
2025-12-15,88172.16000000,90052.64000000,85146.64000000,86432.08000000,19778.69190000
2025-12-16,86432.08000000,88175.98000000,85266.00000000,87863.42000000,18456.05017000
2025-12-17,87863.43000000,90365.85000000,85314.00000000,86243.22000000,19834.11729000
2025-12-18,86243.23000000,89477.61000000,84450.01000000,85516.41000000,25405.41763000
2025-12-19,85516.41000000,89399.97000000,85110.24000000,88136.94000000,21256.65004000
2025-12-20,88136.95000000,88573.07000000,87795.76000000,88360.90000000,5123.13194000
2025-12-21,88360.91000000,89081.77000000,87600.04000000,88658.86000000,7132.87258000
2025-12-22,88658.87000000,90588.23000000,87900.00000000,88620.79000000,14673.21970000
2025-12-23,88620.79000000,88940.00000000,86601.90000000,87486.00000000,13910.32904000
```
✅ Exit code: 0

**💻 Command:**
```bash
mv -r btc-11.csv btc-10.csv
```

**🖥️ Output:**
```
mv: invalid option -- 'r'
Try 'mv --help' for more information.
```
❌ Exit code: 1

**💻 Command:**
```bash
mv -v btc-11.csv btc-10.csv
```

**🖥️ Output:**
```
renamed 'btc-11.csv' -> 'btc-10.csv'
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -L 1
```

**🖥️ Output:**
```
.
├── btc-10.csv
├── btc-15.csv
├── comm_useful_A.csv
├── comm_useful_B.csv
├── diff_A.csv
├── diff_B.csv
├── generate.sh
├── kapital.txt
├── kapitil.txt
├── proccessed
└── raw

3 directories, 9 files
```
✅ Exit code: 0

**💻 Command:**
```bash
comm comm_useful_A.csv comm_useful_B.csv
```

**🖥️ Output:**
```
2025-01-01,BTC,43000,100
2025-01-02,BTC,43100,120
2025-01-03,BTC,43200,110
		2025-01-04,BTC,43300,90
comm: file 2 is not in sorted order
	2025-01-01,BTC,43000,100
		2025-01-05,BTC,43400,95
	2025-01-02,BTC,43100,120
	2025-01-03,BTC,43200,110
comm: input is not in sorted order
```
❌ Exit code: 1

**💻 Command:**
```bash
comm -1 comm_useful_A.csv comm_useful_B.csv
```

**🖥️ Output:**
```
	2025-01-04,BTC,43300,90
comm: file 2 is not in sorted order
2025-01-01,BTC,43000,100
	2025-01-05,BTC,43400,95
2025-01-02,BTC,43100,120
2025-01-03,BTC,43200,110
comm: input is not in sorted order
```
❌ Exit code: 1

**💻 Command:**
```bash
comm -2 comm_useful_A.csv comm_useful_B.csv
```

**🖥️ Output:**
```
2025-01-01,BTC,43000,100
2025-01-02,BTC,43100,120
2025-01-03,BTC,43200,110
	2025-01-04,BTC,43300,90
comm: file 2 is not in sorted order
	2025-01-05,BTC,43400,95
comm: input is not in sorted order
```
❌ Exit code: 1

**💻 Command:**
```bash
comm -3 comm_useful_A.csv comm_useful_B.csv
```

**🖥️ Output:**
```
2025-01-01,BTC,43000,100
2025-01-02,BTC,43100,120
2025-01-03,BTC,43200,110
comm: file 2 is not in sorted order
	2025-01-01,BTC,43000,100
	2025-01-02,BTC,43100,120
	2025-01-03,BTC,43200,110
comm: input is not in sorted order
```
❌ Exit code: 1

**💻 Command:**
```bash
comm -1 -3 comm_useful_A.csv comm_useful_B.csv
```

**🖥️ Output:**
```
comm: file 2 is not in sorted order
2025-01-01,BTC,43000,100
2025-01-02,BTC,43100,120
2025-01-03,BTC,43200,110
comm: input is not in sorted order
```
❌ Exit code: 1

**✨ What I learned:**
- comm default menampilkan 3 kolom: baris unik file1, baris unik file2, dan baris yang sama di kedua file (dipisah TAB, file wajib di-sort).
- opsi -1 menyembunyikan kolom baris unik file1 sehingga hanya terlihat baris unik file2 dan baris yang sama.
- opsi -2 menyembunyikan kolom baris unik file2 sehingga hanya terlihat baris unik file1 dan baris yang sama.
- opsi -3 menyembunyikan kolom baris yang sama sehingga hanya terlihat perbedaan unik antara file1 dan file2.

**✅ 2026-01-10 14:11:58 - Status:** COMPLETED


---

## 📊 2026-01-10 14:12:02 - Session Summary

- **Total exercises:** 2
- **Completed:** 8
- **Failed:** 0

