# Learning Log

Started: 2026-01-07


---

## 📚 2026-01-07 10:13:50 - Exercise: Generate project latihan yang dibuat dengan bash oleh ai

**🎯 Objective:** generate project lumayan kompleks agar bisa melihat perbedaan kondisi penggunaan file,stat, du, dan df

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
└── generate.sh

1 directory, 1 file
```
✅ Exit code: 0

**💻 Command:**
```bash
source generate.sh
```

**🖥️ Output:**
```
[+] Membuat struktur direktori
[+] Membuat file data mentah
[+] Membuat file binary palsu
[+] Membuat file kosong (edge case)
[+] Membuat symlink (biar otakmu kepakai)
[+] Membuat script executable
[+] Menyimpan metadata menggunakan stat
[+] Menyimpan tipe file menggunakan file
[+] Simulasi log besar (biar du terasa)
[+] SELESAI

LATIHAN WAJIB (JANGAN DILEWATI):
1. file /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/*
2. stat /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/crypto.csv
3. du -sh /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab
4. du -sh /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/logs
5. df -h

Kalau kamu pakai df buat cari folder besar, STOP. Itu salah total.
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── fs-lab
│   ├── bin
│   │   └── process.sh
│   ├── data
│   │   ├── processed
│   │   │   └── latest.csv -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/crypto.csv
│   │   └── raw
│   │       ├── crypto.csv
│   │       ├── empty.txt
│   │       └── random.bin
│   ├── logs
│   │   ├── log_1.log
│   │   ├── log_10.log
│   │   ├── log_11.log
│   │   ├── log_12.log
│   │   ├── log_13.log
│   │   ├── log_14.log
│   │   ├── log_15.log
│   │   ├── log_16.log
│   │   ├── log_17.log
│   │   ├── log_18.log
│   │   ├── log_19.log
│   │   ├── log_2.log
│   │   ├── log_20.log
│   │   ├── log_3.log
│   │   ├── log_4.log
│   │   ├── log_5.log
│   │   ├── log_6.log
│   │   ├── log_7.log
│   │   ├── log_8.log
│   │   └── log_9.log
│   └── metadata
│       ├── schema
│       │   └── file-types.txt
│       └── stat
│           ├── crypto.stat
│           └── random.stat
└── generate.sh

10 directories, 29 files
```
✅ Exit code: 0

**💻 Command:**
```bash
du fs-lab/
```

**🖥️ Output:**
```
532	fs-lab/data/raw
8	fs-lab/data/processed
544	fs-lab/data
102404	fs-lab/logs
8	fs-lab/metadata/schema
12	fs-lab/metadata/stat
24	fs-lab/metadata
8	fs-lab/bin
102984	fs-lab/
```
✅ Exit code: 0

**💻 Command:**
```bash
du -h fs-lab/
```

**🖥️ Output:**
```
532K	fs-lab/data/raw
8.0K	fs-lab/data/processed
544K	fs-lab/data
101M	fs-lab/logs
8.0K	fs-lab/metadata/schema
12K	fs-lab/metadata/stat
24K	fs-lab/metadata
8.0K	fs-lab/bin
101M	fs-lab/
```
✅ Exit code: 0

**✅ 2026-01-07 10:18:41 - Status:** COMPLETED


---

## 📚 2026-01-07 10:20:58 - Exercise: file (determine file type)

**🎯 Objective:** mengetahui opsi yang sering dipakah dalam file dan memahamu fungsi command file

**💻 Command:**
```bash
bash -c pwd && ls -Ra
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab
.:
.
..
bin
data
logs
metadata

./bin:
.
..
process.sh

./data:
.
..
processed
raw

./data/processed:
.
..
latest.csv

./data/raw:
.
..
crypto.csv
empty.txt
random.bin

./logs:
.
..
log_1.log
log_10.log
log_11.log
log_12.log
log_13.log
log_14.log
log_15.log
log_16.log
log_17.log
log_18.log
log_19.log
log_2.log
log_20.log
log_3.log
log_4.log
... (72 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── bin
│   └── process.sh
├── data
│   ├── processed
│   │   └── latest.csv -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/crypto.csv
│   └── raw
│       ├── crypto.csv
│       ├── empty.txt
│       └── random.bin
├── logs
│   ├── log_1.log
│   ├── log_10.log
│   ├── log_11.log
│   ├── log_12.log
│   ├── log_13.log
│   ├── log_14.log
│   ├── log_15.log
│   ├── log_16.log
│   ├── log_17.log
│   ├── log_18.log
│   ├── log_19.log
│   ├── log_2.log
│   ├── log_20.log
│   ├── log_3.log
│   ├── log_4.log
│   ├── log_5.log
│   ├── log_6.log
│   ├── log_7.log
│   ├── log_8.log
│   └── log_9.log
└── metadata
    ├── schema
    │   └── file-types.txt
    └── stat
        ├── crypto.stat
        └── random.stat

9 directories, 28 files
```
✅ Exit code: 0

**💻 Command:**
```bash
file data/raw/crypto.csv data/raw/empty.txt data/raw/random.bin
```

**🖥️ Output:**
```
data/raw/crypto.csv: CSV ASCII text
data/raw/empty.txt:  empty
data/raw/random.bin: data
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c (
```

**🖥️ Output:**
```
bash: -c: line 2: syntax error: unexpected end of file
```
❌ Exit code: 2

**💻 Command:**
```bash
bash -c for a in data/*;do realpath  echo -e '\n' head -n 2  done
```

**🖥️ Output:**
```
bash: -c: line 2: syntax error: unexpected end of file
```
❌ Exit code: 2

**❌ 2026-01-07 13:20:51 - Status:** FAILED
**Reason:** karena fungsi run tidak bisa menamngkap perintah dengan enter, saya kira untuk loop tidak perlu dipisahkan dengan ; ternyata harus dipisahkan

**💻 Command:**
```bash
bash -c for f in data/*;do realpath "$f"; head -n 2 "$f"; echo; done
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/processed
head: error reading 'data/processed': Is a directory

/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw
head: error reading 'data/raw': Is a directory
```
✅ Exit code: 0

**❌ 2026-01-07 13:27:19 - Status:** FAILED
**Reason:** salah kedalaman folder

**💻 Command:**
```bash
bash -c for f in data/*/*;do realpath "$f"; head -n 2 "$f"; echo; done
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/crypto.csv
id,price,volume
1,9442,24197

/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/crypto.csv
id,price,volume
1,9442,24197

/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/empty.txt

/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/random.bin
�xa��>��m=*�<c��n��F{��b��o��ˊ�n��������I5%��c��Mv��t���ĝ��t�E9��>|`�a!ʂ�:��r�yp���&�:�n3u�`���^��w j�s�wn�h�7x*�vy��h��'U�w}�� q��>�?H'�v1�:�+m�8�O&��	s6m�kV�J�?�3b�`��uH:X��KvI�s� �a����jO-���|�Z�1H�S���lN/0"��4'��m�qA�x!�����pa�l|���g�6�J�m�MÏUZ����Y/!�j�o>���n�����ϒ|�8g��������4�n&@���D�$��h��K��X8:'�G#��ky/<���~Bī ��C1���F[�^�T�#LS������O9��6�=�2�P� &��̮h�y%��f��:'�����q�!��y�!�[j:1���b�R2=�Hm��f+�d��ؓ7!\���p�?TGXY��z�C��E����Ȍ-�����s��OW]�@�M��2��ٝ���r��	�ٽ��t�ԻR�g�Z�Nq"���֣�d��c�I4��t"�O�3��6���-��X�k�c�	M\RpX�Ik;�B�:��!l��L{IZIEݰ��4
Ȯ����l�I8�&H��ԀrM�WnO���,����;݈���i��-D�N�d��y�z��%�Ƹː���Y�����"{Am�i�?���W�Q.(56��8/�l�!U~��T�]�%��i��^���� ��8
```
✅ Exit code: 0

- 📝 dapat dilihat bahwa dengan file bisa mengetahui jenis filenya tanpa melihat isinya
**💻 Command:**
```bash
file -b data/processed/latest.csv data/raw/crypto.csv data/raw/empty.txt data/raw/random.bin
```

**🖥️ Output:**
```
symbolic link to /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/crypto.csv
CSV ASCII text
empty
data
```
✅ Exit code: 0

**💻 Command:**
```bash
file data/processed/latest.csv data/raw/crypto.csv data/raw/empty.txt data/raw/random.bin
```

**🖥️ Output:**
```
data/processed/latest.csv: symbolic link to /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/crypto.csv
data/raw/crypto.csv:       CSV ASCII text
data/raw/empty.txt:        empty
data/raw/random.bin:       data
```
✅ Exit code: 0

- 📝 opsi -b digunakan untuk menjetak jenis filenya saja, tidak dengan nama dan lokasi filenya, ini berguna untuk parcing output dalam script, untuk penggunaan dalam data enginering saya masih belum tau
**💻 Command:**
```bash
file -i data/raw/crypto.csv data/raw/empty.txt data/raw/random.bin metadata/schema/file-types.txt metadata/stat/crypto.stat metadata/stat/random.stat
```

**🖥️ Output:**
```
data/raw/crypto.csv:            text/csv; charset=us-ascii
data/raw/empty.txt:             inode/x-empty; charset=binary
data/raw/random.bin:            application/octet-stream; charset=binary
metadata/schema/file-types.txt: text/plain; charset=us-ascii
metadata/stat/crypto.stat:      text/plain; charset=us-ascii
metadata/stat/random.stat:      text/plain; charset=us-ascii
```
✅ Exit code: 0

- 📝 dengan opsi -i akan memunculkan output MIME dari sebuah file
**💻 Command:**
```bash
gzip data/raw/crypto.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── bin
│   └── process.sh
├── data
│   ├── processed
│   │   └── latest.csv -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/crypto.csv
│   └── raw
│       ├── crypto.csv.gz
│       ├── empty.txt
│       └── random.bin
├── logs
│   ├── log_1.log
│   ├── log_10.log
│   ├── log_11.log
│   ├── log_12.log
│   ├── log_13.log
│   ├── log_14.log
│   ├── log_15.log
│   ├── log_16.log
│   ├── log_17.log
│   ├── log_18.log
│   ├── log_19.log
│   ├── log_2.log
│   ├── log_20.log
│   ├── log_3.log
│   ├── log_4.log
│   ├── log_5.log
│   ├── log_6.log
│   ├── log_7.log
│   ├── log_8.log
│   └── log_9.log
└── metadata
    ├── schema
    │   └── file-types.txt
    └── stat
        ├── crypto.stat
        └── random.stat

9 directories, 28 files
```
✅ Exit code: 0

**💻 Command:**
```bash
file data/raw/crypto.csv.gz
```

**🖥️ Output:**
```
data/raw/crypto.csv.gz: gzip compressed data, was "crypto.csv", last modified: Wed Jan  7 03:15:54 2026, from Unix, original size modulo 2^32 15227
```
✅ Exit code: 0

**💻 Command:**
```bash
file -z data/raw/crypto.csv.gz
```

**🖥️ Output:**
```
data/raw/crypto.csv.gz: CSV ASCII text (gzip compressed data, was "crypto.csv", last modified: Wed Jan  7 03:15:54 2026, from Unix)
```
✅ Exit code: 0

- 📝 dengan opsi -z dapat melihat jenis isi file yang sudah di compress
**💻 Command:**
```bash
gunzip -v data/raw/crypto.csv.gz
```

**🖥️ Output:**
```
data/raw/crypto.csv.gz:	 50.8% -- replaced with data/raw/crypto.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
tree data/raw/
```

**🖥️ Output:**
```
data/raw/
├── crypto.csv
├── empty.txt
└── random.bin

1 directory, 3 files
```
✅ Exit code: 0

**💻 Command:**
```bash
file data/processed/latest.csv
```

**🖥️ Output:**
```
data/processed/latest.csv: symbolic link to /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/crypto.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
file -L data/processed/latest.csv
```

**🖥️ Output:**
```
data/processed/latest.csv: CSV ASCII text
```
✅ Exit code: 0

- 📝 dengan opsi -L akan mengikuti link asli dari symolic link

---

## 📚 2026-01-07 13:53:07 - Exercise: stat (display file status)

**🎯 Objective:** mengetahui apa itu meta data, dan apa fungsinya sebagai data engenering

**💻 Command:**
```bash
bash -c pwd; echo; tree; echo; stat crypto.csv; echo;  stat empty.txt; echo; stat random.bin
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw

.
├── crypto.csv
├── empty.txt
└── random.bin

1 directory, 3 files

  File: crypto.csv
  Size: 15227     	Blocks: 32         IO Block: 4096   regular file
Device: 8,48	Inode: 130905      Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-07 13:43:27.656339499 +0700
Modify: 2026-01-07 10:15:54.555686837 +0700
Change: 2026-01-07 13:42:24.898362694 +0700
 Birth: 2026-01-07 13:42:24.898362694 +0700

  File: empty.txt
  Size: 0         	Blocks: 0          IO Block: 4096   regular empty file
Device: 8,48	Inode: 137803      Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-07 10:37:05.993737317 +0700
Modify: 2026-01-07 10:15:54.571686837 +0700
Change: 2026-01-07 10:15:54.571686837 +0700
 Birth: 2026-01-07 10:15:54.571686837 +0700

  File: random.bin
  Size: 524288    	Blocks: 1024       IO Block: 4096   regular file
Device: 8,48	Inode: 137799      Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-07 10:15:54.607686835 +0700
Modify: 2026-01-07 10:15:54.567686837 +0700
Change: 2026-01-07 10:15:54.567686837 +0700
 Birth: 2026-01-07 10:15:54.563686837 +0700
```
✅ Exit code: 0

**✨ What I learned:**
- size ditampilkan dalam bentuk kb
- stat memiliki meta data nama dll
- 1 block adalah 4 kb dalam disk
- io block adalah jumlah block yang digunakan saat file baca atau di tulis
- file adalah nama file yang sedang dilihat  
- size adalah ukuran file dalam byte  
- blocks adalah jumlah block disk yang dipakai file  
- io block adalah ukuran unit baca tulis file oleh sistem  
- device adalah id perangkat atau partisi tempat file berada  
- inode adalah nomor unik file di filesystem  
- links adalah jumlah hard link file  
- access adalah permission file  
- uid adalah id pemilik file  
- gid adalah id group pemilik file  
- access time adalah waktu terakhir file dibaca  
- modify time adalah waktu terakhir isi file diubah  
- change time adalah waktu terakhir metadata file diubah  
- birth time adalah waktu file dibuat

**💻 Command:**
```bash
stat -t crypto.csv
```

**🖥️ Output:**
```
crypto.csv 15227 32 81a4 1000 1000 830 130905 1 0 0 1767768207 1767755754 1767768144 1767768144 4096
```
✅ Exit code: 0

- 📝 opsi -t isinya sama dengan stat biasa cuman yang ditampilkan adalah teste yang mana lebih ramah terhadap machine
**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── processed
│   └── latest.csv -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/crypto.csv
└── raw
    ├── crypto.csv
    ├── empty.txt
    └── random.bin

3 directories, 4 files
```
✅ Exit code: 0

**💻 Command:**
```bash
stat processed/latest.csv
```

**🖥️ Output:**
```
  File: processed/latest.csv -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/crypto.csv
  Size: 105       	Blocks: 8          IO Block: 4096   symbolic link
Device: 8,48	Inode: 137824      Links: 1
Access: (0777/lrwxrwxrwx)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-07 10:16:27.259498858 +0700
Modify: 2026-01-07 10:15:54.575686837 +0700
Change: 2026-01-07 10:15:54.575686837 +0700
 Birth: 2026-01-07 10:15:54.575686837 +0700
```
✅ Exit code: 0

**💻 Command:**
```bash
stat -L processed/latest.csv
```

**🖥️ Output:**
```
  File: processed/latest.csv
  Size: 15227     	Blocks: 32         IO Block: 4096   regular file
Device: 8,48	Inode: 130905      Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-07 13:43:27.656339499 +0700
Modify: 2026-01-07 10:15:54.555686837 +0700
Change: 2026-01-07 13:42:24.898362694 +0700
 Birth: 2026-01-07 13:42:24.898362694 +0700
```
✅ Exit code: 0

- 📝 opsi -L digunakan untuk mengikuti target link, bukan stat pada folder atau link itu sendiri
**💻 Command:**
```bash
stat -f raw/
```

**🖥️ Output:**
```
  File: "raw/"
    ID: b8a7c81cd77f7ec2 Namelen: 255     Type: ext2/ext3
Block size: 4096       Fundamental block size: 4096
Blocks: Total: 263940717  Free: 259381817  Available: 245955949
Inodes: Total: 67108864   Free: 66970961
```
✅ Exit code: 0

**✨ What I learned:**
- opsi -f pada stat digunakan untuk menampilkan metadata filesystem bukan metadata file
- file adalah direktori atau titik mount yang sedang dilihat  
- id adalah identifier unik filesystem  
- namelen adalah panjang maksimum nama file yang didukung filesystem  
- type adalah tipe filesystem seperti ext2 ext3 atau ext4  
- block size adalah ukuran unit block yang digunakan filesystem untuk baca tulis data  
- fundamental block size adalah unit dasar block filesystem  
- blocks total adalah jumlah total block yang tersedia di filesystem  
- blocks free adalah jumlah block kosong yang belum dipakai  
- blocks available adalah jumlah block yang bisa digunakan user biasa  
- inodes total adalah jumlah maksimum file atau direktori yang bisa dibuat di filesystem  
- inodes free adalah jumlah inode yang masih tersedia untuk membuat file baru

**💻 Command:**
```bash
stat -c %n raw/
```

**🖥️ Output:**
```
raw/
```
✅ Exit code: 0

- 📝 OPSI TERPENTING BAGI DATA ENGENERING ADALAH OPSI -c KARENA DIGUNAKAN UNTUK EXTRACT METADATA SECARA SPESIFIK YANG NANTINYA BERGUNA UNTUK SCRIPT YANG SPESIFIK
**✅ 2026-01-07 15:39:46 - Status:** COMPLETED

**🎯 Objective:** bisa memonitoring dist atau penyimpanan ukuran yang digunakan dan mengetahui opsi apa saja yang sering dipakai

**💻 Command:**
```bash
tree -h
```

**🖥️ Output:**
```
[4.0K]  .
├── [4.0K]  bin
│   └── [  45]  process.sh
├── [4.0K]  data
│   ├── [4.0K]  processed
│   │   └── [ 105]  latest.csv -> /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab/data/raw/crypto.csv
│   └── [4.0K]  raw
│       ├── [ 15K]  crypto.csv
│       ├── [   0]  empty.txt
│       └── [512K]  random.bin
├── [4.0K]  logs
│   ├── [5.0M]  log_1.log
│   ├── [5.0M]  log_10.log
│   ├── [5.0M]  log_11.log
│   ├── [5.0M]  log_12.log
│   ├── [5.0M]  log_13.log
│   ├── [5.0M]  log_14.log
│   ├── [5.0M]  log_15.log
│   ├── [5.0M]  log_16.log
│   ├── [5.0M]  log_17.log
│   ├── [5.0M]  log_18.log
│   ├── [5.0M]  log_19.log
│   ├── [5.0M]  log_2.log
│   ├── [5.0M]  log_20.log
│   ├── [5.0M]  log_3.log
│   ├── [5.0M]  log_4.log
│   ├── [5.0M]  log_5.log
│   ├── [5.0M]  log_6.log
│   ├── [5.0M]  log_7.log
│   ├── [5.0M]  log_8.log
│   └── [5.0M]  log_9.log
└── [4.0K]  metadata
    ├── [4.0K]  schema
    │   └── [ 347]  file-types.txt
    └── [4.0K]  stat
        ├── [ 484]  crypto.stat
        └── [ 484]  random.stat

9 directories, 28 files
```
✅ Exit code: 0

**💻 Command:**
```bash
du -hsc metadata/ bin/ data/
```

**🖥️ Output:**
```
24K	metadata/
8.0K	bin/
544K	data/
576K	total
```
✅ Exit code: 0

**✨ What I learned:**
- opsi h digunakan untuk menampilkan agar manusia bisa paham/human readable (KB, MB, GB, dst)
- opsi s digunakan untuk meringkas total disk directory target saja tanpa perlu menampilkan detail didalamnya, karena defaultnya menampilkan detail
- opsi c digunakan untuk mentotal penggunaan disk dari setiap target

**💻 Command:**
```bash
du -hc --max-depth=2 --exclude=logs
```

**🖥️ Output:**
```
532K	./data/raw
8.0K	./data/processed
544K	./data
8.0K	./metadata/schema
12K	./metadata/stat
24K	./metadata
8.0K	./bin
580K	.
580K	total
```
✅ Exit code: 0

**✨ What I learned:**
- opsi --mac-depth=N digunakan untuk membatasi atau menentukan kedalaman
- opsi --exclude=FILE digunakan untuk mengecualikan target

**💻 Command:**
```bash
du -ah .
```

**🖥️ Output:**
```
512K	./data/raw/random.bin
16K	./data/raw/crypto.csv
0	./data/raw/empty.txt
532K	./data/raw
4.0K	./data/processed/latest.csv
8.0K	./data/processed
544K	./data
5.0M	./logs/log_15.log
5.0M	./logs/log_14.log
5.0M	./logs/log_13.log
5.0M	./logs/log_17.log
5.0M	./logs/log_7.log
5.0M	./logs/log_18.log
5.0M	./logs/log_3.log
5.0M	./logs/log_19.log
5.0M	./logs/log_9.log
5.0M	./logs/log_5.log
5.0M	./logs/log_6.log
5.0M	./logs/log_10.log
5.0M	./logs/log_20.log
5.0M	./logs/log_8.log
5.0M	./logs/log_4.log
5.0M	./logs/log_2.log
5.0M	./logs/log_1.log
5.0M	./logs/log_16.log
5.0M	./logs/log_12.log
5.0M	./logs/log_11.log
101M	./logs
4.0K	./metadata/schema/file-types.txt
8.0K	./metadata/schema
4.0K	./metadata/stat/crypto.stat
4.0K	./metadata/stat/random.stat
12K	./metadata/stat
24K	./metadata
4.0K	./bin/process.sh
8.0K	./bin
101M	.
```
✅ Exit code: 0

**💻 Command:**
```bash
du -h .
```

**🖥️ Output:**
```
532K	./data/raw
8.0K	./data/processed
544K	./data
101M	./logs
8.0K	./metadata/schema
12K	./metadata/stat
24K	./metadata
8.0K	./bin
101M	.
```
✅ Exit code: 0

- 📝 opsi -a digunakan untuk mengecek ukuran disk yang digunakan secara rekrusive sampai kedalaman folder terdalam
**💻 Command:**
```bash
-sb .
```

**🖥️ Output:**
```
Command '-sb' not found, did you mean:
  command 'msb' from deb mysql-sandbox (3.2.05-1)
  command 'sb' from deb lrzsz (0.12.21-10)
Try: sudo apt install <deb name>
```
❌ Exit code: 127

**💻 Command:**
```bash
du -sb .
```

**🖥️ Output:**
```
105398580	.
```
✅ Exit code: 0

- 📝 opsi -b digunakan untuk menampilkan dalam bytes secara detail, ini berguna untuk script yang membutuhkan ketelitihan yang tinggi

---

## 📚 2026-01-07 16:14:51 - Exercise: df (disk free)

**🎯 Objective:** bisa memonitoring dish yang digunakan dalam file, bisa melihat file/folder tertentu masuk pada disk mana, bisa mengidentifikasi masalah error saat penyimpanan tidak cukup atau inodenya yang stoknya habis

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-5_metadata-dan-ukuran/fs-lab
```
✅ Exit code: 0

**💻 Command:**
```bash
df .
```

**🖥️ Output:**
```
Filesystem      1K-blocks     Used Available Use% Mounted on
/dev/sdd       1055762868 18235656 983823740   2% /
```
✅ Exit code: 0

- 📝 folder pada lokasi ini masuk ke disk filesystem /dev/sdd
**💻 Command:**
```bash
df
```

**🖥️ Output:**
```
Filesystem      1K-blocks      Used Available Use% Mounted on
/dev/sdd       1055762868  18235668 983823728   2% /
rootfs            3522508      2720   3519788   1% /init
none              3527548         0   3527548   0% /dev/shm
none              3527548       784   3526764   1% /run
none              3527548         0   3527548   0% /run/lock
none              3527548        84   3527464   1% /run/user
tmpfs              705508        20    705488   1% /run/user/1000
drivers         498989052 105812344 393176708  22% /usr/lib/wsl/drivers
none              3527548         0   3527548   0% /usr/lib/wsl/lib
none              3527548         4   3527544   1% /mnt/wsl
none              3527548        96   3527452   1% /mnt/wslg/versions.txt
none              3527548        96   3527452   1% /mnt/wslg/doc
none              3527548         0   3527548   0% /usr/lib/modules/6.6.87.2-microsoft-standard-WSL2
snapfuse             5120      5120         0 100% /snap/glow/90
snapfuse            65408     65408         0 100% /snap/core20/2686
snapfuse            52224     52224         0 100% /snap/snapd/25577
C:\             498989052 105812344 393176708  22% /mnt/c
```
✅ Exit code: 0

**💻 Command:**
```bash
df -hiT
```

**🖥️ Output:**
```
Filesystem     Type          Inodes IUsed IFree IUse% Mounted on
/dev/sdd       ext4             64M  135K   64M    1% /
rootfs         rootfs          860K    12  860K    1% /init
none           tmpfs           862K     1  862K    1% /dev/shm
none           tmpfs           862K   560  861K    1% /run
none           tmpfs           862K     2  862K    1% /run/lock
none           tmpfs           862K    33  862K    1% /run/user
tmpfs          tmpfs           173K    54  173K    1% /run/user/1000
drivers        9p               999 -976K  977K     - /usr/lib/wsl/drivers
none           overlay         862K     5  862K    1% /usr/lib/wsl/lib
none           tmpfs           862K     2  862K    1% /mnt/wsl
none           overlay         862K    58  862K    1% /mnt/wslg/versions.txt
none           overlay         862K    58  862K    1% /mnt/wslg/doc
none           overlay         862K     5  862K    1% /usr/lib/modules/6.6.87.2-microsoft-standard-WSL2
snapfuse       fuse.snapfuse      4     4     0  100% /snap/glow/90
snapfuse       fuse.snapfuse    12K   12K     0  100% /snap/core20/2686
snapfuse       fuse.snapfuse    617   617     0  100% /snap/snapd/25577
C:\            9p               999 -976K  977K     - /mnt/c
```
✅ Exit code: 0

**✨ What I learned:**
- opsi -h digunakan untuk memudahkan pembaca/menampilkan ukuran dalam kb, mb, dst
- opsi -i digunakan untuk menambahkan inode pada tampilan df, ini berguna untuk cek nanti jika tidak bisa membuat file padahal disk masih free banyak, bisa jadi karena inodenya sudah full
- opsi -T digunakan untuk melihat tipe filesystem ext4 dll
- karena saya menggunakan wsl jadi disk yang digunakan di /dev/sdd itu banyak karena ini virtual

**💻 Command:**
```bash
df -ht ext4
```

**🖥️ Output:**
```
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdd       1007G   18G  939G   2% /
```
✅ Exit code: 0

- 📝 opsi -t type digunakan untuk memfilter berdasaekan type
**💻 Command:**
```bash
df -h --total
```

**🖥️ Output:**
```
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdd       1007G   18G  939G   2% /
rootfs          3.4G  2.7M  3.4G   1% /init
none            3.4G     0  3.4G   0% /dev/shm
none            3.4G  784K  3.4G   1% /run
none            3.4G     0  3.4G   0% /run/lock
none            3.4G   84K  3.4G   1% /run/user
tmpfs           689M   20K  689M   1% /run/user/1000
drivers         476G  101G  375G  22% /usr/lib/wsl/drivers
none            3.4G     0  3.4G   0% /usr/lib/wsl/lib
none            3.4G  4.0K  3.4G   1% /mnt/wsl
none            3.4G   96K  3.4G   1% /mnt/wslg/versions.txt
none            3.4G   96K  3.4G   1% /mnt/wslg/doc
none            3.4G     0  3.4G   0% /usr/lib/modules/6.6.87.2-microsoft-standard-WSL2
snapfuse        5.0M  5.0M     0 100% /snap/glow/90
snapfuse         64M   64M     0 100% /snap/core20/2686
snapfuse         51M   51M     0 100% /snap/snapd/25577
C:\             476G  101G  375G  22% /mnt/c
total           2.0T  220G  1.7T  12% -
```
✅ Exit code: 0

- 📝 opsi --total digunakan untuk melihat total baris dalam df, mirip kaya total dalam bahasa indonesia ya
**✅ 2026-01-07 16:53:49 - Status:** COMPLETED


---

## 📊 2026-01-07 16:53:54 - Session Summary

- **Total exercises:** 4
- **Completed:** 3
- **Failed:** 2

**💻 Command:**
```bash
du -hs
```

**🖥️ Output:**
```
101M	.
```
✅ Exit code: 0

**💻 Command:**
```bash
du -hc
```

**🖥️ Output:**
```
532K	./data/raw
8.0K	./data/processed
544K	./data
101M	./logs
8.0K	./metadata/schema
12K	./metadata/stat
24K	./metadata
8.0K	./bin
101M	.
101M	total
```
✅ Exit code: 0

**💻 Command:**
```bash
rm -v logs/log_1.log logs/log_10.log logs/log_11.log logs/log_12.log logs/log_13.log logs/log_14.log logs/log_15.log logs/log_16.log logs/log_17.log logs/log_18.log logs/log_19.log logs/log_2.log logs/log_20.log logs/log_3.log logs/log_4.log logs/log_5.log logs/log_6.log logs/log_7.log logs/log_8.log logs/log_9.log
```

**🖥️ Output:**
```
removed 'logs/log_1.log'
removed 'logs/log_10.log'
removed 'logs/log_11.log'
removed 'logs/log_12.log'
removed 'logs/log_13.log'
removed 'logs/log_14.log'
removed 'logs/log_15.log'
removed 'logs/log_16.log'
removed 'logs/log_17.log'
removed 'logs/log_18.log'
removed 'logs/log_19.log'
removed 'logs/log_2.log'
removed 'logs/log_20.log'
removed 'logs/log_3.log'
removed 'logs/log_4.log'
removed 'logs/log_5.log'
removed 'logs/log_6.log'
removed 'logs/log_7.log'
removed 'logs/log_8.log'
removed 'logs/log_9.log'
```
✅ Exit code: 0

**💻 Command:**
```bash
du -cs
```

**🖥️ Output:**
```
584	.
584	total
```
✅ Exit code: 0

**💻 Command:**
```bash
du --max-depth=1 -c
```

**🖥️ Output:**
```
544	./data
4	./logs
24	./metadata
8	./bin
584	.
584	total
```
✅ Exit code: 0

**💻 Command:**
```bash
du --max-depth=1 -ch
```

**🖥️ Output:**
```
544K	./data
4.0K	./logs
24K	./metadata
8.0K	./bin
584K	.
584K	total
```
✅ Exit code: 0

- 📝 menghapus log agar tidak membebani pc
