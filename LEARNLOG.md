# 2026-01-01 21:12:51 - Filesystem & Path Linux untuk Data Engineering
## 2026-01-01 21:13:11 - Bab 1: Konsep Dasar Filesystem Linux
### 2026-01-01 21:13:52 - Filesystem Hierarchy Standard (FHS)
|Directory|Digunakan Untuk                                           |
|---------|----------------------------------------------------------|
|/home    | area kerja utama untuk project data, script ETL, dan repo|
|/bin     | command dasar yang dipakai setiap hari                   |
|/usr/bin | tool utama data engineering (python, awk, sed, grep)     |
|/etc     | file konfigurasi service data (database, airflow, spark) |
|/var/log | lokasi log untuk cek error job dan service               |
|/var     | data service yang sifatnya berubah (state, cache)        |
|/tmp     | tempat file sementara untuk testing atau proses cepat    |
### 2026-01-01 21:20:01 - PATH
|Jenis Path    |Penjelasan                                           |
|--------------|-----------------------------------------------------|
|Absolute Path | path yang dimulai dari root (/) path pasti          |
|Relative Path | path yang dimulai dari path saat ini tidak dari root|

**📝 2026-01-01 21:25:02 - Notes**
- untuk shortcut home bisa menggunakan ~
### 2026-01-01 21:27:16 - Karakter Khusus Path
|Karakter|Makna                                            |
|--------|-------------------------------------------------|
|`.`       | direktori saat ini                              |
|`..`      | direktori sebelumnya                            |
|`~`       | direktori home                                  |
|`-`       | kembali ke direktori sebelumnya "Hanya untuk cd"|
## 2026-01-01 21:51:15 - Bab 2: Command Dasar
### 2026-01-01 22:20:27 - Navigasi
|Commend|Kepanjangan              |Fungsi                                                 |
|-------|-------------------------|-------------------------------------------------------|
|`pwd`  | print working directory | menampilkan path, yang ditampilkan adalah path absolut|
|`cd`   | change directory        | pindah directory                                      |

**📝 2026-01-01 22:34:19 - Notes**
- kombinasikan `cd` dengan karakter khusus path
- [Karakter Khusus Path](#2026-01-01-212716---karakter-khusus-path)
### 2026-01-01 22:56:17 - Eksplorasi

<div style="background-color:#1e1e1e; color:#ffffff; padding:10px; border-radius:12px; max-width:700px; margin:auto; font-family:monospace; line-height:1.5; box-shadow:0 4px 12px rgba(0,0,0,0.5);">
  <h3 style="padding:5px; margin:0;color:#569cd6; text-align:center; margin-bottom:15px;">Command Usage</h3>
  <div style="background-color:#2d2d2d; color:#dcdcaa; border-radius:8px; font-size:16px; white-space:pre-wrap;">
    ls [optopns] [target]
  </div>
</div>

#### 2026-01-01 22:58:00 - Commend Dasar Eksplorasi
| Command      | Kepanjangan | Fungsi |
|--------------|------------|--------|
| `ls`         | list       | menampilkan isi direktori saat ini |
| `tree -L N`  | tree       | menampilkan struktur direktori hingga level N |

**📝 2026-01-01 23:02:18 - Notes**
- untuk fokus explorasi saya lebih fokus ke ls karena lebih powefull
- untuk tree hanya digunakan jika ingin melihat struktur direktori dengan lebih rapi
#### 2026-01-01 23:08:31 - Option list(ls)

| Command | Option Kepanjangan | Penjelasan |
|---------|------------|------------|
| `ls -l` | long listing | menampilkan detail file termasuk permission, owner, group, ukuran, dan waktu terakhir diubah |
| `ls -a` | all | menampilkan semua file termasuk file tersembunyi yang diawali dengan titik |
| `ls -h` | human-readable | menampilkan ukuran file dalam format yang mudah dibaca seperti k, m, g |
| `ls -lh` | long + human | kombinasi menampilkan detail file dengan ukuran human readable |
| `ls -R` | recursive | menampilkan isi direktori beserta seluruh subdirektorinya secara rekursif |
| `ls -t` | time sort | mengurutkan file berdasarkan waktu terakhir diubah, terbaru terlebih dahulu |
| `ls -lt` | long + time sort | menampilkan detail file sekaligus mengurutkan berdasarkan waktu terakhir diubah |
| `ls -S` | size sort | mengurutkan file berdasarkan ukuran, terbesar terlebih dahulu |
| `ls -lhS` | long + human + size sort | menampilkan detail file dengan ukuran yang mudah dibaca dan diurutkan berdasarkan ukuran |
| `ls -1` | one per line | menampilkan satu file per baris, berguna untuk dipipe ke command lain |
| `ls -d` | directory | menampilkan direktori itu sendiri, bukan isinya |
| `ls --color=auto` | color output | memberikan warna pada output untuk membedakan file, direktori, dan link simbolik |
| `ls -i` | inode | menampilkan nomor inode setiap file |
| `ls -n` | numeric uid gid | menampilkan user dan group dalam bentuk angka |
| `ls -U` | unsorted | menampilkan file sesuai urutan asli filesystem tanpa sorting |
### 2026-01-02 13:48:16 - Membuat Folder (mkdir/Make Directories)
<div style="background-color:#1e1e1e; color:#ffffff; padding:10px; border-radius:12px; max-width:700px; margin:auto; font-family:monospace; line-height:1.5; box-shadow:0 4px 12px rgba(0,0,0,0.5);">
  <h3 style="padding:5px; margin:0;color:#569cd6; text-align:center; margin-bottom:15px;">Command Usage</h3>
  <div style="background-color:#2d2d2d; color:#dcdcaa; border-radius:8px; font-size:16px; white-space:pre-wrap; padding:10px;">
    mkdir [options] direktori
  </div>
</div>

| Command         |  Option Kepanjangan | Fungsi |
|-----------------|-----------------|-------|
| `mkdir -p`      | parents         | membuat direktori beserta parent jika belum ada |
| `mkdir -m`      | mode            | mengatur permission direktori saat dibuat |
| `mkdir -v`      | verbose         | menampilkan pesan setiap direktori dibuat |
| `mkdir -Z`      | selinux context | atur konteks keamanan selinux default |
| `mkdir --context` | context       | atur konteks selinux/smack spesifik |

### 2026-01-02 14:03:28 - Membuat File (touch/change file timestamps)
<div style="background-color:#1e1e1e; color:#ffffff; padding:10px; border-radius:12px; max-width:700px; margin:auto; font-family:monospace; line-height:1.5; box-shadow:0 4px 12px rgba(0,0,0,0.5);">
  <h3 style="padding:5px; margin:0;color:#569cd6; text-align:center; margin-bottom:15px;">Command Usage</h3>
  <div style="background-color:#2d2d2d; color:#dcdcaa; border-radius:8px; font-size:16px; white-space:pre-wrap; padding:10px;">
    touch [options] file
  </div>
</div>

| Command        |  Option Kepanjangan     | Fungsi | Fungsi untuk Data Engineer |
|----------------|---------------------|--------|---------------------------|
| `touch -a`     | access time          | ubah hanya waktu akses file | memperbarui waktu akses file untuk tracking pipeline atau log |
| `touch -m`     | modification time    | ubah hanya waktu modifikasi file | memperbarui waktu modifikasi file, berguna saat sinkronisasi data |
| `touch -c`     | no-create            | tidak membuat file baru | menghindari pembuatan file baru saat hanya ingin update timestamp |
| `touch -d`     | date                 | gunakan tanggal/waktu spesifik | set timestamp tertentu untuk file hasil proses atau testing |
| `touch -h`     | no-dereference       | ubah waktu symlink, bukan file yang dituju | ubah timestamp symlink, relevan saat struktur file kompleks |
| `touch -r`     | reference            | gunakan waktu file lain sebagai referensi | samakan timestamp dengan file lain untuk konsistensi data |
| `touch -t`     | timestamp            | gunakan format waktu spesifik [[CC]YY]MMDDhhmm[.ss] | atur waktu spesifik untuk file batch atau log |
| `touch --time` | time                 | ubah jenis waktu tertentu: access/modify | ubah jenis waktu tertentu sesuai kebutuhan monitoring data |

### 2026-01-02 14:29:39 - Menghapus File dan Direktori (rm/remove)
<div style="background-color:#1e1e1e; color:#ffffff; padding:10px; border-radius:12px; max-width:700px; margin:auto; font-family:monospace; line-height:1.5; box-shadow:0 4px 12px rgba(0,0,0,0.5);">
  <h3 style="padding:5px; margin:0;color:#569cd6; text-align:center; margin-bottom:15px;">Command Usage</h3>
  <div style="background-color:#2d2d2d; color:#dcdcaa; border-radius:8px; font-size:16px; white-space:pre-wrap; padding:10px;">
    rm [options] file
  </div>
</div>

| Command       | Option Kepanjangan       | Fungsi | Fungsi untuk Data Engineer |
|---------------|------------------------|--------|---------------------------|
| `rm -f`       | force                  | hapus file/direktori tanpa konfirmasi, abaikan jika tidak ada | cepat hapus file/direktori tanpa error, berguna untuk cleanup otomatis |
| `rm -i`       | interactive            | minta konfirmasi sebelum menghapus setiap file | mencegah penghapusan tidak sengaja saat running skrip penting |
| `rm -I`       | interactive once       | minta konfirmasi sekali sebelum menghapus >3 file atau recursive | lebih aman dari `rm -r` masal tanpa terlalu sering prompt |
| `rm --interactive` | interactive WHEN     | minta konfirmasi sesuai WHEN: never, once, always | fleksibel untuk kontrol prompt saat penghapusan batch |
| `rm --one-file-system` | one-file-system    | skip direktori yang ada di filesystem berbeda saat recursive | hindari hapus data di mount berbeda saat cleanup hierarki data |
| `rm --no-preserve-root` | no-preserve-root | izinkan hapus '/' (bahaya) | jarang dipakai, biasanya untuk testing di container/VM |
| `rm --preserve-root` | preserve-root       | jangan hapus '/' (default) | aman untuk mencegah kesalahan fatal hapus root filesystem |
| `rm -r, -R`   | recursive              | hapus direktori beserta isi | utama untuk hapus folder proyek, data pipeline, logs |
| `rm -d`       | dir                    | hapus direktori kosong | bisa menggantikan `rmdir` untuk cleanup direktori kosong |
| `rm -v`       | verbose                | tampilkan apa yang sedang dihapus | membantu logging aktivitas hapus file/direktori |


**📝 2026-01-02 14:34:44 - Notes**
- saya hanya fokus ke rm karena rmdir memiliki opsi yang terbatas
- dengan mr -d bisa menggantikan mrdir
### 2026-01-02 14:43:08 - Coppy File dan Folder (cp/coppy)
#### 2026-01-02 14:53:16 - Command Usage
| How to Use | Penjelasan | Fungsi untuk Data Engineer |
|------------|------------|---------------------------|
| `cp [OPTION]... [-T] SOURCE DEST` | salin satu file atau direktori ke target tertentu; `-T` paksa target dianggap file biasa | menyalin file penting ke lokasi spesifik, misal backup atau data staging |
| `cp [OPTION]... SOURCE... DIRECTORY` | salin satu atau beberapa file ke direktori tujuan | menyalin banyak file sekaligus ke folder proyek atau pipeline data |
| `cp [OPTION]... -t DIRECTORY SOURCE...` | salin file ke direktori tujuan dengan target di awal | memudahkan skrip atau xargs untuk menyalin banyak file secara batch |

#### 2026-01-02 15:16:02 - Options remove
| Command      | Option Kepanjangan       | Fungsi | Fungsi untuk Data Engineer |
|--------------|------------------------|--------|---------------------------|
| `cp -a`      | archive                | salin file/direktori termasuk atribut, mode, timestamp, dan link | backup lengkap atau migrasi data dengan semua metadata tetap |
| `cp --attributes-only` | attributes-only     | hanya salin atribut file, bukan isinya | update metadata file tanpa menyalin data, berguna untuk sinkronisasi timestamp atau permissions |
| `cp --backup` | backup                | buat backup file tujuan jika sudah ada | mencegah kehilangan data saat overwrite file penting |
| `cp -b`      | backup tanpa argumen   | seperti --backup tapi tanpa argumen | cepat backup file sebelum overwrite |
| `cp --copy-contents` | copy-contents      | salin isi file khusus saat recursive | berguna untuk copy device file atau special file di data pipeline |
| `cp -d`      | no-dereference & preserve links | pertahankan symbolic/hard link | menjaga struktur link file di proyek atau dataset |
| `cp --debug` | debug                  | tampilkan proses copy | membantu troubleshooting saat menyalin banyak file |
| `cp -f`      | force                  | hapus file tujuan jika tidak bisa dibuka | memastikan copy berhasil tanpa gagal karena file locked |
| `cp -i`      | interactive            | minta konfirmasi sebelum overwrite | mencegah overwrite file penting secara tidak sengaja |
| `cp -H`      | follow command-line symlinks | ikuti symbolic link yang diberikan di command line | menjaga struktur link saat copy file proyek |
| `cp -l`      | link                   | buat hard link daripada copy | hemat ruang disk dengan membuat hard link file besar |
| `cp -L`      | dereference            | selalu ikuti symbolic link | salin isi file target symlink daripada link itu sendiri |
| `cp -n`      | no-clobber             | tidak overwrite file yang ada | aman untuk batch copy tanpa kehilangan data lama |
| `cp -P`      | no-dereference         | jangan ikuti symbolic link | salin link itu sendiri, bukan targetnya |
| `cp -p`      | preserve               | pertahankan mode, ownership, timestamp | penting untuk menjaga metadata file pada pipeline/data staging |
| `cp --preserve` | preserve            | pertahankan atribut spesifik | kontrol metadata file yang ingin dipertahankan saat copy |
| `cp --no-preserve` | no-preserve       | jangan pertahankan atribut tertentu | menyalin file tanpa membawa atribut tertentu |
| `cp --parents` | parents               | gunakan path lengkap di bawah DIRECTORY | menjaga struktur folder saat menyalin banyak file ke folder tujuan |
| `cp -r, -R`  | recursive              | salin direktori beserta isinya | salin folder proyek atau dataset besar secara menyeluruh |
| `cp --reflink` | reflink               | buat CoW clone jika didukung filesystem | hemat ruang saat duplikasi dataset besar |
| `cp --remove-destination` | remove-destination | hapus file tujuan sebelum copy | pastikan copy berhasil meski file tujuan ada |
| `cp --sparse` | sparse                | kontrol pembuatan file sparse | efisien untuk file besar dengan banyak nol |
| `cp --strip-trailing-slashes` | strip-trailing-slashes | hapus trailing slash dari SOURCE | mencegah error saat path salah format |
| `cp -s`      | symbolic-link          | buat symlink bukan copy | hemat disk dan buat struktur referensi data |
| `cp -S`      | suffix                 | ganti suffix backup | kontrol nama backup saat overwrite |
| `cp -t`      | target-directory       | salin semua SOURCE ke DIRECTORY | memudahkan batch copy ke folder tujuan |
| `cp -T`      | no-target-directory    | anggap DEST sebagai file biasa | memastikan copy satu file ke file |
| `cp --update` | update                | salin hanya file yang lebih baru | efisien untuk sinkronisasi data incremental |
| `cp -u`      | update older           | sama dengan --update=older | copy hanya file baru dibanding tujuan |
| `cp -v`      | verbose                | tampilkan proses copy | monitoring copy file/direktori |
| `cp -x`      | one-file-system        | tetap di filesystem yang sama | hindari copy data antar mount point berbeda |
| `cp -Z`      | SELinux context        | set konteks keamanan SELinux ke default | penting untuk server dengan kebijakan keamanan |
| `cp --context` | context               | set konteks SELinux/SMACK tertentu | kontrol keamanan file saat copy di environment ketat |
### 2026-01-02 15:38:14 - Move & Rename (mv/move)
#### 2026-01-02 15:43:50 - Command Usage
| How to Use | Penjelasan | Fungsi untuk Data Engineer |
|------------|------------|---------------------------|
| `mv [OPTION]... [-T] SOURCE DEST` | pindahkan atau ganti nama satu file/direktori ke target tertentu; `-T` anggap DEST sebagai file biasa | memindahkan file penting ke lokasi baru atau rename file untuk organizing data pipeline |
| `mv [OPTION]... SOURCE... DIRECTORY` | pindahkan satu atau beberapa file ke direktori tujuan | mengatur file input/output batch ke folder proyek atau pipeline data |
| `mv [OPTION]... -t DIRECTORY SOURCE...` | pindahkan file ke direktori tujuan dengan target di awal | memudahkan skrip atau xargs memindahkan banyak file secara batch |
#### 2026-01-02 15:45:34 - Options move
| Command | Option Kepanjangan | Fungsi | Fungsi untuk Data Engineer |
|---------|-----------------|--------|---------------------------|
| `mv --backup` | backup | buat backup file tujuan sebelum overwrite | mencegah kehilangan data saat memindahkan file penting |
| `mv -b` | backup tanpa argumen | sama seperti --backup tapi tanpa argumen | cepat backup file sebelum overwrite |
| `mv --debug` | debug | tampilkan proses pemindahan file | membantu troubleshooting saat move banyak file |
| `mv -f` | force | tidak minta konfirmasi sebelum overwrite | memastikan move file berhasil tanpa prompt |
| `mv -i` | interactive | minta konfirmasi sebelum overwrite | mencegah overwrite file penting secara tidak sengaja |
| `mv -n` | no-clobber | jangan overwrite file yang ada | aman untuk batch move tanpa kehilangan data lama |
| `mv --no-copy` | no-copy | jangan salin file jika rename gagal | mencegah duplikasi file saat move gagal |
| `mv --strip-trailing-slashes` | strip-trailing-slashes | hapus trailing slash dari SOURCE | mencegah error path saat move file/direktori |
| `mv -S` | suffix | ganti suffix backup | kontrol nama backup file saat overwrite |
| `mv -t` | target-directory | pindahkan semua SOURCE ke DIRECTORY | memudahkan batch move ke folder tujuan |
| `mv -T` | no-target-directory | anggap DEST sebagai file biasa | memastikan move satu file ke file tujuan |
| `mv --update` | update | ganti file tujuan hanya jika sesuai aturan {all,none,older} | sinkronisasi file lama dengan file baru secara selektif |
| `mv -u` | update older | sama dengan --update=older | overwrite file hanya jika lebih lama dari source |
| `mv -v` | verbose | tampilkan proses pemindahan | monitoring move file/direktori |
| `mv -Z, --context` | context | set SELinux context file tujuan | penting untuk environment dengan kebijakan keamanan ketat |
### 2026-01-02 16:29:27 - Resolusi Path(realpath)
<div style="background-color:#1e1e1e; color:#ffffff; padding:10px; border-radius:12px; max-width:700px; margin:auto; font-family:monospace; line-height:1.5; box-shadow:0 4px 12px rgba(0,0,0,0.5);">
  <h3 style="padding:5px; margin:0;color:#569cd6; text-align:center; margin-bottom:15px;">Command Usage</h3>
  <div style="background-color:#2d2d2d; color:#dcdcaa; border-radius:8px; font-size:16px; white-space:pre-wrap; padding:10px;">
    realpath [OPTION]... FILE...
  </div>
</div>

| Command      | Kepanjangan | Fungsi | Fungsi untuk Data Engineer |
|-------------|------------|--------|---------------------------|
| `realpath -e`                    | canonicalize-existing | semua komponen path harus ada | verifikasi path file/folder sebelum digunakan di pipeline data |
| `realpath -m`                    | canonicalize-missing  | tidak perlu semua komponen path ada | memeriksa atau menyiapkan path baru tanpa harus ada sebelumnya |
| `realpath -L`                    | logical               | resolve '..' sebelum symlink | memastikan path logis digunakan untuk navigasi direktori proyek |
| `realpath -P`                    | physical              | resolve symlink saat ditemui | mengikuti symlink aktual ke lokasi file sebenarnya |
| `realpath -q`                    | quiet                 | sembunyikan pesan error | digunakan di skrip batch agar tidak terganggu error minor |
| `realpath --relative-to=DIR`     | relative-to           | cetak path relatif terhadap DIR | mempermudah referensi file relatif di pipeline proyek |
| `realpath --relative-base=DIR`   | relative-base         | cetak absolute path kecuali di bawah DIR | kombinasi absolute dan relative path untuk logging atau skrip |
| `realpath -s`                    | strip / no-symlinks   | jangan perluas symlink | gunakan path asli tanpa mengikuti symlink |
| `realpath -z`                    | zero                  | akhiri output dengan NUL, bukan newline | berguna untuk skrip yang memproses output secara aman, misal xargs -0 |


**📝 2026-01-02 16:43:33 - Notes**
- realpath dapat digunakan untuk membaca dan menverikasi symbolic link, jika tujuan symbolic link di hapus maka akan error
- realpath dapat masih tetap bisa digunakan jika itu hard link karena hardlink adalah nama untuk inode yang sama, jadi meskipun tujuan link dihapus link tetap bisa menyimpannya karena file di meta data masih ada
### 2026-01-02 16:54:13 - Link (ln/link)
