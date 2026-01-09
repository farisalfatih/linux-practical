# BAB 0: KONSEP DASAR DATA ENGINEERING

## 0.1 Apa itu Data Engineering

| Aspek | Penjelasan |
|-------|------------|
| **Peran** | Data engineer fokus pada *alur, keandalan, dan skala data* |
| **Perbedaan dengan Data Analyst** | Analyst fokus insight, Engineer fokus infrastruktur data |
| **Perbedaan dengan Data Scientist** | Scientist fokus model, Engineer fokus pipeline |
| **Tanggung Jawab** | Membuat data tersedia, akurat, dan tepat waktu |
| **Output Utama** | Pipeline yang robust, bukan insight |

## 0.2 Siklus Hidup Data

| Stage | Deskripsi |
|-------|-----------|
| **Ingestion** | Mengambil data dari source (API, file, database) |
| **Storage** | Menyimpan data mentah tanpa diubah |
| **Processing** | Transformasi data (cleaning, filtering, aggregation) |
| **Output** | Data siap pakai untuk konsumsi |
| **Prinsip** | Data berpindah, tidak diam di satu tempat |

## 0.3 Jenis-jenis Data

| Tipe | Karakteristik | Contoh Format |
|------|---------------|---------------|
| **Structured** | Tabular, schema jelas dan tetap | CSV, TSV |
| **Semi-structured** | Flexible schema, hierarki | JSON, XML |
| **Unstructured** | Tidak ada schema | Log, text, binary |
| **Prinsip** | Pemahaman format = langkah pertama processing |

## 0.4 Batch vs Streaming

| Aspek | Batch | Streaming |
|-------|-------|-----------|
| **Cara Kerja** | Proses data dalam chunk besar | Proses data real-time |
| **Scheduling** | Terjadwal (cron) | Continuous |
| **Latency** | Tinggi (jam/hari) | Rendah (detik/menit) |
| **Use Case** | Report harian, ETL bulk | Monitoring, alert real-time |
| **Fokus Modul** | ✅ Batch (cron + shell script) | ❌ Di luar scope |

## 0.5 ETL vs ELT

| Aspek | ETL | ELT |
|-------|-----|-----|
| **Extract** | Ambil data dari source | Ambil data dari source |
| **Transform** | ✅ Transformasi SEBELUM load | ❌ Skip |
| **Load** | Load data yang sudah bersih | ✅ Load data mentah |
| **Transform (lagi)** | ❌ Sudah selesai | ✅ Transformasi SETELAH load |
| **Fokus Modul** | ✅ Pola ETL dengan Bash | -
|

## 0.6 Prinsip Dasar Pipeline Data

| Prinsip | Makna | Contoh |
|---------|-------|---------|
| **Deterministik** | Input sama = output sama | Script tidak depend on random/time |
| **Idempotent** | Aman dijalankan ulang tanpa efek samping | Jalankan 1x atau 100x, hasilnya sama |
| **Observable** | Bisa dipantau dan di-debug | Ada logging dan metrics |
| **Fail Fast** | Error langsung terdeteksi | Tidak silent failure |
| **Traceable** | Setiap data bisa dilacak asalnya | Ada audit trail |

## 0.7 Data Quality (4 Pilar)

| Pilar | Definisi | Validasi |
|-------|----------|----------|
| **Completeness** | Data lengkap, tidak ada yang hilang | Check null, missing values |
| **Accuracy** | Data benar dan valid | Validasi range, format, tipe data |
| **Consistency** | Format dan nilai konsisten | Standardisasi format |
| **Timeliness** | Data tersedia tepat waktu | Monitor delay |
| **Prinsip** | Validasi harus ada di SETIAP stage pipeline |

## 0.8 Data Lineage & Observability

| Konsep | Penjelasan | Implementasi |
|--------|------------|--------------|
| **Data Lineage** | Jejak perjalanan data dari source ke destination | Track setiap transformasi |
| **Observability** | Kemampuan melihat apa yang terjadi di pipeline | Logging, monitoring, alert |
| **Audit Trail** | History lengkap proses data | Log dengan timestamp |
| **Debugging** | Tanpa observability = menebak dalam gelap | Structured logging |

## 0.9 Error Handling Philosophy

| Prinsip | Penjelasan |
|---------|------------|
| **Error akan terjadi** | Network, disk, format error adalah normal |
| **Pipeline harus jujur** | Gagal = harus terlihat dan tercatat |
| **Silent failure = berbahaya** | Lebih baik crash daripada silent failure |
| **Retry untuk transient error** | Network timeout → retry dengan backoff |
| **Dead letter queue** | Permanent error → simpan untuk investigasi |

## 0.10 Transformation Principles

| Prinsip | Penjelasan | Implementasi |
|---------|------------|--------------|
| **Immutable source** | JANGAN edit data mentah | Read-only source data |
| **Transform progressively** | Step-by-step, bukan sekaligus | Stage 1 → Stage 2 → Stage 3 |
| **Stateless when possible** | Hindari dependency ke state eksternal | Self-contained script |
| **Atomic operations** | Commit hanya jika berhasil semua | Gunakan temp file + mv |
| **Temp file strategy** | Proses di temp, commit saat sukses | `mktemp` → process → `mv` |

## 0.11 Data Pipeline Anti-Patterns (HINDARI!)

| ❌ Anti-Pattern | ✅ Best Practice |
|----------------|------------------|
| Edit data source langsung | Immutable source, transform to new file |
| Pipeline tidak bisa dijalankan ulang | Idempotent design |
| Tidak ada logging | Logging di setiap stage |
| Menyembunyikan error | Fail fast, expose error |
| Hard-coded path dan credential | Environment variable & config |
| Tidak ada validasi data | Validasi di setiap stage |
| Append tanpa deduplikasi | Check duplikat sebelum append |

## 0.12 Mindset Production-Ready

| Pertanyaan Kunci | Implikasi |
|------------------|-----------|
| **"Apa yang terjadi kalau ini gagal?"** | Perlu error handling & fallback |
| **"Bagaimana saya tahu ini gagal?"** | Perlu logging & monitoring |
| **"Bisakah saya jalankan ulang dengan aman?"** | Perlu idempotency |
| **Code "jalan" ≠ "production-ready"** | Production = reliable + observable + maintainable |

---

# BAB 1: FILESYSTEM

**Konsep inti:** representasi data di disk & navigasi struktur

---
log/01-file-system/1-4_manajemen-file-dan-directory
## 1.1 Path & lokasi

### pwd (print working directory)

**How to use:**
```bash
pwd
```

**Options:**
| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-L` | Logical | Tampilkan path logical (dengan symlink) | Default behavior, cek lokasi kerja saat ini dalam pipeline |
| `-P` | Physical | Tampilkan path physical (tanpa symlink) | Memastikan path absolut real, menghindari masalah symlink di pipeline |

**Use case data engineering:** Validasi lokasi saat ini sebelum proses data, logging path dalam audit trail.

---

### cd (change directory)

**How to use:**
```bash
cd [DIRECTORY]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-L` | Logical | Follow symlink (default) | Navigasi normal dalam pipeline |
| `-P` | Physical | Gunakan struktur physical | Menghindari masalah symlink dalam automation |

**Use case data engineering:** Navigasi antar direktori data (raw, staging, processed), otomasi script ETL.

---

### Konsep: Absolute vs Relative Path

| Tipe | Format | Contoh | Use Case Data Engineering |
|------|--------|--------|---------------------------|
| **Absolute** | Dimulai dari root `/` | `/data/raw/file.csv` | Pipeline script yang jalan dari berbagai lokasi |
| **Relative** | Relatif dari lokasi saat ini | `../raw/file.csv` | Development lokal, fleksibel tapi risky di production |

**Best practice:** Gunakan absolute path dalam production pipeline untuk konsistensi.


### [LOG LATIHAN PATH DAN LOKASI](log/01-file-system/1-1_path-dan-lokasi/latihan.md)
---

## 1.2 Eksplorasi filesystem

### ls (list directory)

**How to use:**
```bash
ls [OPTION]... [FILE]...
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-l` | Long format | Tampilkan detail (permission, size, date) | Audit data: siapa buat, kapan, berapa besar |
| `-h` | Human readable | Size dalam KB, MB, GB | Cepat cek ukuran file data |
| `-t` | Time | Urutkan berdasarkan waktu modifikasi | Cari file terbaru hasil ETL |
| `-r` | Reverse | Reverse urutan | Kombinasi dengan -t untuk file terlama |
| `-a` | All | Tampilkan hidden files (.file) | Cek file config (.env, .gitignore) |
| `-S` | Size | Urutkan berdasarkan ukuran | Identifikasi file data terbesar |
| `-R` | Recursive | List semua subdirectory | Eksplorasi struktur data secara menyeluruh |
| `-d` | Directory | List direktori itu sendiri, bukan isinya | Cek apakah direktori ada |

**Use case data engineering:** Validasi file hasil ETL, cek ukuran data sebelum processing, identifikasi file terbaru untuk ingestion.

---

### tree (visualisasi struktur)

**How to use:**
```bash
tree [OPTION]... [DIRECTORY]...
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-L n` | Level | Limit kedalaman n level | Overview struktur tanpa detail berlebihan |
| `-d` | Directory | Hanya tampilkan direktori | Visualisasi arsitektur data tanpa noise file |
| `-h` | Human readable | Ukuran file dalam KB/MB/GB | Cepat survey ukuran data per direktori |
| `-D` | Date | Tampilkan waktu modifikasi | Track kapan data diupdate |
| `-p` | Permission | Tampilkan permission | Audit keamanan struktur data |
| `-I 'pattern'` | Ignore | Ignore file/dir sesuai pattern | Exclude log, temp file dari visualisasi |

**Use case data engineering:** Dokumentasi struktur data lake, onboarding tim baru, validasi struktur setelah deployment.

### [LATIHAN DASAR ESKPLORASI](/log/01-file-system/1-2_eksplorasi-filesystem/latihan-dasar.md)
### [TASK LATIHAN LS DAN TREE](/log/01-file-system/1-2_eksplorasi-filesystem/task-ls-tree.md)
### [KERJAKAN TASK LATIHAN LS DAN TREE](/log/01-file-system/1-2_eksplorasi-filesystem/action-ls-tree.md)
---

## 1.3 Membaca isi file

### cat (concatenate & print)

**How to use:**
```bash
cat [OPTION]... [FILE]...
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-n` | Number | Tampilkan nomor baris | Debug data, reference baris bermasalah |
| `-b` | Number nonblank | Nomor hanya baris yang tidak kosong | Hitung baris data aktual |
| `-s` | Squeeze blank | Squeeze multiple blank lines jadi satu | Cleaning output untuk readability |
| `-A` | Show all | Tampilkan karakter non-printable | Debug encoding, hidden character issue |

**Use case data engineering:** Quick view file kecil, gabung multiple file CSV, debug isi file.

#### TABEL LENGKAP OPSI `cat -A` UNTUK DEBUGGING DATA ENGINEERING

| Karakter / Simbol | Representasi `cat -A` | Sumber Umum / Penyebab | Dampak di Data | Contoh Masalah |
|------------------|----------------------|-----------------------|----------------|----------------|
| Newline (LF) | `$` | Unix/Linux | Baris normal | Tidak ada |
| Carriage Return (CR) | `^M` | Windows file (CRLF) | Parser CSV gagal, kolom geser | CSV dibuka di Linux tapi ada `^M` |
| TAB | `^I` | Spreadsheet export, TSV | Kolom salah, parser salah | Delimiter tidak konsisten |
| Space biasa | (spasi) | Manual input, copy paste | Bisa bikin field ekstra | Field “kosong” tapi ternyata ada spasi |
| Non-breaking space | `M-BM-` / aneh | Copy HTML / PDF | Trim gagal | `"John Doe"` tidak sama dengan `"John Doe"` |
| NUL | `^@` | File biner, dump SQL | Crash tool text, parser error | SQL dump korup |
| BOM (Byte Order Mark) | `M-oM-;M-?` / aneh | Windows UTF-8 editor | Header kolom rusak, parser CSV error | Excel export CSV |
| BEL | `^G` | File log lama / control char | Terminal bunyi beep | Log kontrol muncul di console |
| Backspace | `^H` | Manual input / copy | Menghapus karakter tak terduga | Field “abc^Hdef” → jadi “adef” |
| ESC | `^[` | ANSI escape, color | Parser tidak paham | Log berwarna nyasar ke CSV |
| Carakter non-printable lain | `^?`, `^A`, dst | Encoding error / binary | Parser crash | File CSV dari sistem lama |
| Replacement character | `�` | Encoding mismatch | Data korup | Copy paste dari web, encoding beda |

---

### head (lihat awal file)

**How to use:**
```bash
head [OPTION]... [FILE]...
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-n N` | Lines | Tampilkan N baris pertama | Sampling data, ambil header, preview data |
| `-c N` | Bytes | Tampilkan N bytes pertama | Preview binary file, cek encoding |
| `-q` | Quiet | Jangan print nama file | Clean output untuk pipeline |

**Use case data engineering:** Ambil header CSV, sampling data untuk testing, validasi format file besar tanpa load semua.

---

### tail (lihat akhir file)

**How to use:**
```bash
tail [OPTION]... [FILE]...
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-n N` | Lines | Tampilkan N baris terakhir | Cek record terakhir yang masuk, validasi tail data |
| `-n +N` | Start from line N | Mulai dari baris N sampai akhir | Skip header, proses dari baris tertentu |
| `-f` | Follow | Monitor file real-time | Monitor log pipeline, watch data ingestion real-time |
| `-F` | Follow with retry | Follow bahkan jika file di-rename | Robust monitoring untuk rotating log |
| `-c N` | Bytes | Tampilkan N bytes terakhir | Cek akhir binary file |

**Use case data engineering:** Monitor log ETL real-time, validasi record terakhir, debugging pipeline live.

---

### less (pager untuk file besar)

**How to use:**
```bash
less [OPTION]... [FILE]...
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-N` | Line numbers | Tampilkan nomor baris | Reference nomor baris saat debug |
| `-S` | Chop long lines | Jangan wrap long lines | Inspect CSV dengan banyak kolom |
| `+F` | Follow | Follow mode seperti tail -f | Monitor log dengan kemampuan scroll back |
| `-i` | Ignore case | Case-insensitive search | Search pattern tanpa peduli case |
| `-X` | No clear | Jangan clear screen saat exit | Output tetap di terminal setelah quit |

**Use case data engineering:** Inspect file data besar, search pattern dalam log, browse hasil query tanpa load ke memory.

---

### more (pager sederhana)

**How to use:**
```bash
more [options] file ...
```
**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-d` | Display help | Tampilkan help message | User-friendly untuk pemula |
| `-f` | Count logical lines | Hitung logical lines bukan screen lines | Akurat untuk file dengan long lines |
| `+n` | Start at line | Mulai dari baris n | Skip ke bagian tertentu file |
| `-s` | Squeeze blank | Squeeze multiple blank lines | Clean display |

**Use case data engineering:** Quick browse file (alternatif less), pipe long output untuk pagination.

**Note:** `less` lebih powerful, gunakan `more` hanya jika `less` tidak tersedia.

### [LOG LATIHAN MEMBACA ISI FILE](log/01-file-system/1-3_membaca-isi-file/latihan-dasar.md)

---

## 1.4 Manajemen file & directory

### mkdir (make directory)

**How to use:**
```bash
mkdir [options] direktori
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-p` | Parents | Buat parent directories jika perlu | Setup struktur data lake, no error jika sudah ada |
| `-m mode` | Mode | Set permission saat create | Security: set permission langsung saat create direktori |
| `-v` | Verbose | Print setiap direktori yang dibuat | Logging dalam script ETL |

**Use case data engineering:** Setup struktur direktori data (raw/processed/archive), inisialisasi data lake, create dated directories.

---

### touch (create empty file / update timestamp)

**How to use:**
```bash
touch [options] file
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-c` | No create | Jangan buat file baru, hanya update jika ada | Update timestamp tanpa create file baru |
| `-t STAMP` | Time | Set timestamp spesifik (YYYYMMDDhhmm) | Backfill data dengan timestamp historis |
| `-r file` | Reference | Gunakan timestamp dari file lain | Sinkronisasi timestamp antar file |
| `-a` | Access time | Hanya update access time | Track file access |
| `-m` | Modification time | Hanya update modification time | Track modification |

**Use case data engineering:** Buat flag file untuk koordinasi pipeline, signaling completion, update timestamp untuk trigger.

---

### rm (remove)

**How to use:**
```bash
rm [options] file/direktori
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-r` | Recursive | Hapus direktori dan isinya rekursif | Cleanup direktori data lama |
| `-f` | Force | Force hapus tanpa konfirmasi | Automation cleanup dalam script |
| `-i` | Interactive | Konfirmasi setiap file | Safety: prevent accidental delete |
| `-v` | Verbose | Print setiap file yang dihapus | Logging dalam cleanup script |

**Use case data engineering:** Cleanup temp files, archival deletion, remove processed data.

**⚠️ WARNING:** `rm -rf` sangat berbahaya! Validasi path sebelum execute.

---

### cp (copy)

**How to use:**
```bash
cp [options] source destination
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-r` | Recursive | Copy direktori dan isinya | Backup/copy struktur data secara menyeluruh |
| `-p` | Preserve | Preserve permission, ownership, timestamps | Backup dengan metadata lengkap |
| `-u` | Update | Copy hanya jika source lebih baru | Incremental backup, sync data |
| `-v` | Verbose | Print setiap file yang di-copy | Logging dalam backup script |
| `-i` | Interactive | Konfirmasi sebelum overwrite | Safety: prevent overwrite accidental |
| `-n` | No clobber | Jangan overwrite file yang sudah ada | Protect existing data |

**Use case data engineering:** Backup data, copy raw data ke staging, duplicate dataset untuk testing.

---

### mv (move/rename)

**How to use:**
```bash
mv [options] source destination
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-f` | Force | Force overwrite tanpa konfirmasi | Automation: overwrite expected dalam pipeline |
| `-i` | Interactive | Konfirmasi sebelum overwrite | Safety: prevent data loss |
| `-n` | No clobber | Jangan overwrite file yang ada | Protect existing data |
| `-v` | Verbose | Print setiap file yang di-move | Logging dalam pipeline |
| `-u` | Update | Move hanya jika source lebih baru | Sync data dengan safety |

**Use case data engineering:** ATOMIC COMMIT (process di temp, mv ke final), promote staging to production, organize data.

---

### ln (create link)

**How to use:**
```bash
ln [options] source link
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-s` | Symbolic | Buat symbolic link (bukan hard link) | Pointer ke data tanpa duplikasi, versioning |
| `-f` | Force | Overwrite existing link | Update symlink ke versi terbaru |
| `-v` | Verbose | Print link yang dibuat | Logging dalam script |
| `-n` | No dereference | Jangan follow symlink saat overwrite | Safe overwrite symlink ke directory |

**Use case data engineering:** Alias "latest" data untuk consumer, zero-downtime deployment, shared config/reference data.

### [LOG LATIHAN MANAJEMEN FILE DAN DIRECTORY](log/01-file-system/1-4_manajemen-file-dan-directory/latihan-dasar.md)

---

## 1.5 Metadata & ukuran

### file (determine file type)

**How to use:**
```bash
file [options] file
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-b` | Brief | Output tanpa nama file | Parsing output dalam script |
| `-i` | MIME | Output MIME type | Validasi file type programmatically |
| `-z` | Compressed | Look inside compressed files | Inspect tanpa extract |
| `-L` | Follow symlinks | Follow symbolic links | Cek tipe file target symlink |

| Nama sehari-hari | `file` (tanpa opsi) | `file -i` (MIME) |
|-----------------|---------------------|------------------|
| File teks (.txt) | ASCII text | text/plain; charset=utf-8 |
| CSV | ASCII text | text/csv; charset=utf-8 |
| JSON | JSON text data | application/json |
| XML | XML 1.0 document | application/xml |
| Log file | ASCII text | text/plain; charset=utf-8 |
| Shell script | Bourne-Again shell script | text/x-shellscript |
| Python script | Python script | text/x-python |
| Binary / executable | ELF 64-bit LSB executable | application/x-executable |
| File kosong | empty | inode/x-empty |
| ZIP | Zip archive data | application/zip |
| GZIP | gzip compressed data | application/gzip |
| TAR | POSIX tar archive | application/x-tar |
| Parquet | Apache Parquet | application/octet-stream |
| ORC | Apache ORC | application/octet-stream |
| Image PNG | PNG image data | image/png |
| Image JPEG | JPEG image data | image/jpeg |
| PDF | PDF document | application/pdf |
| SQLite DB | SQLite 3.x database | application/x-sqlite3 |
| Symlink ke CSV | symbolic link to ../raw/file.csv | text/csv |

### [MIME STANDARD Engineering Task Force (IETF)](https://developer.mozilla.org/ms/docs/Web/HTTP/Basics_of_HTTP/MIME_Types)

**Use case data engineering:** Validasi tipe file sebelum processing, detect corrupt files, verify file format dalam pipeline.

---

### stat (display file status)

**How to use:**
```bash
stat [options] file
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-c FORMAT` | Format | Custom output format | Extract metadata spesifik untuk script |
| `-f` | Filesystem | Show filesystem status | Monitor disk space |
| `-L` | Follow | Follow symlinks | Stat target file, bukan symlink |
| `-t` | Terse | Terse output (machine-readable) | Parsing dalam script |

#### Tabel LENGKAP format `stat -c` (GNU coreutils)

##### 📄 Identitas File
| Format | Arti |
|------|------|
| `%n` | Nama file |
| `%N` | Nama file + target symlink |
| `%i` | Inode number |
| `%F` | Tipe file |
| `%h` | Jumlah hard link |

##### 📦 Ukuran & Storage
| Format | Arti |
|------|------|
| `%s` | Ukuran file (byte) |
| `%b` | Jumlah blok terpakai |
| `%B` | Ukuran blok (byte) |
| `%o` | Optimal I/O block |
| `%D` | Device number (hex) |
| `%d` | Device number (decimal) |

##### 🔐 Permission & Ownership
| Format | Arti |
|------|------|
| `%a` | Permission octal (644) |
| `%A` | Permission readable |
| `%u` | UID |
| `%U` | Username |
| `%g` | GID |
| `%G` | Group name |

##### ⏱️ Timestamp
| Format | Arti |
|------|------|
| `%x` | Access time (human) |
| `%X` | Access time (epoch) |
| `%y` | Modified time (human) |
| `%Y` | Modified time (epoch) |
| `%z` | Change time (human) |
| `%Z` | Change time (epoch) |
| `%w` | Birth time (human) |
| `%W` | Birth time (epoch / -1) |

##### 🔗 Symlink & Special
| Format | Arti |
|------|------|
| `%C` | SELinux context |
| `%t` | Major device (hex) |
| `%T` | Minor device (hex) |

##### 🧠 Literal & Kontrol Output
| Format | Arti |
|------|------|
| `%%` | Karakter `%` |
| `\n` | New line |
| `\t` | Tab |

**Use case data engineering:** Validasi ukuran file hasil ETL, audit timestamp, cek permission, monitoring metadata.

---

### du (disk usage)

**How to use:**
```bash
du [options] [file/direktori]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-h` | Human readable | Tampilkan KB, MB, GB | Quick assess ukuran data |
| `-s` | Summary | Total size saja (summarize) | Ukuran direktori tanpa detail file |
| `-c` | Total | Tampilkan grand total di akhir | Sum multiple directories |
| `--max-depth=N` | Max depth | Limit kedalaman N level | Overview per subdirectory tanpa noise |
| `-a` | All | Tampilkan file dan directory | Detailed size audit |
| `-b` | Bytes | Ukuran dalam bytes | Exact size untuk validasi programmatic |

**Use case data engineering:** Monitor pertumbuhan data, capacity planning, identifikasi direktori besar, pre-check sebelum transfer.

---

### df (disk free)

**How to use:**
```bash
df [options] [filesystem/direktori]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-h` | Human readable | Size dalam KB, MB, GB | Quick check disk availability |
| `-i` | Inodes | Tampilkan inode usage | Debug "disk full" padahal space ada (inode habis) |
| `-T` | Type | Tampilkan filesystem type | Identify filesystem untuk troubleshooting |
| `-t type` | Type filter | Filter filesystem type tertentu | Focus on data filesystems |
| `--total` | Total | Tampilkan grand total | Overview total disk |

**Use case data engineering:** Pre-check disk space sebelum ETL, monitoring disk usage, alerting disk penuh, capacity planning.

### [LOG LATIHAN MANAJEMEN META DATA DAN UKURAN](log/01-file-system/1-5_metadata-dan-ukuran/latihan-dasar.md)

---

## 1.6 Wildcards & Pattern Matching

### Wildcard Characters

**How to use:**
```bash
ls *.csv               # Semua file .csv
ls data?.txt           # data + 1 karakter
ls data[12].txt        # data1 atau data2
ls data[0-9].txt       # data + angka
ls data[!0-9].txt      # data + bukan angka
```

**Wildcard Reference Table:**

| Wildcard | Nama | Matching | Contoh | Match | Not Match |
|----------|------|----------|--------|-------|-----------|
| `*` | Asterisk | 0 atau lebih karakter | `*.csv` | `data.csv`, `file123.csv` | `data.txt` |
| `?` | Question mark | Tepat 1 karakter | `data?.csv` | `data1.csv`, `dataX.csv` | `data.csv`, `data12.csv` |
| `[abc]` | Bracket | Salah satu dari a,b,c | `data[123].csv` | `data1.csv`, `data2.csv` | `data4.csv` |
| `[a-z]` | Range | Range dari a sampai z | `file[0-9].txt` | `file0.txt`, `file9.txt` | `fileA.txt` |
| `[!abc]` | Negation | BUKAN a,b,c | `data[!0-9].txt` | `dataX.txt` | `data1.txt` |

**Use case data engineering:** Batch process files by pattern, selective file operations, file discovery dalam pipeline.

### [LOG LATIHAN WILDCARD DAN PATTERN MATCHING](log/01-file-system/1-6_wildcards-dan-pattern-maching/latihan-dasar.md)

---

**Yang harus dikuasai:**

> Mampu membaca struktur data di disk, inspect metadata file, navigate filesystem dengan confidence, dan memahami dampak operasi file terhadap data dalam context data engineering pipeline.

---

# BAB 2: PENCARIAN & FILTERING

**Konsep inti:** seleksi data dari filesystem & teks

---

## 2.1 Pencarian file

### find (cari file berdasarkan kriteria)

**How to use:**
```bash
find [option] [starting-point...] [expression] [action]
```

**Options (diletakkan sebelum starting-point):**

| Option | Fungsi | Contoh Penggunaan |
|--------|--------|-------------------|
| `-H` | Follow symbolic links di command line | `find -H /data -name "*.csv"` |
| `-L` | Follow all symbolic links | `find -L /data -type f` |
| `-P` | Never follow symbolic links (default) | `find -P . -name "*.log"` |
| `-D debugopts` | Debug find command execution (jarang dipakai) | `find -D search . -name "*.csv"` |
| `-Olevel` | Optimize query level 0-3 (jarang dipakai) | `find -O3 . -name "*.log"` |

**Expression (kriteria pencarian):**

| Expression | Fungsi | Contoh Penggunaan |
|------------|--------|-------------------|
| `-name pattern` | Cari berdasarkan nama file | `find . -name "*.csv"` - cari semua file CSV |
| `-type f/d` | Filter berdasarkan tipe (f=file, d=directory) | `find . -type f` - cari hanya file |
| `-size [+-]N` | Cari berdasarkan ukuran | `find . -size +100M` - file lebih dari 100MB |
| `-mtime [+-]N` | File dimodifikasi N hari lalu | `find . -mtime -7` - file diubah 7 hari terakhir |
| `-newer file` | File lebih baru dari reference | `find . -newer last_run.txt` - incremental load |
| `-empty` | File/direktori kosong | `find . -empty` - cari file kosong untuk cleanup |

**Action (aksi terhadap hasil):**

| Action | Fungsi | Contoh Penggunaan |
|--------|--------|-------------------|
| `-delete` | Hapus file yang match | `find . -name "*.tmp" -delete` |
| `-exec cmd {} \;` | Jalankan command untuk setiap match | `find . -name "*.csv" -exec wc -l {} \;` |

**Use case data engineering:** Discover data files, filter by date/size, batch processing, cleanup old data.

---

### locate (cari file dari database)

**How to use:**
```bash
locate [options] pattern
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-i` | Ignore case | Case-insensitive search | Cari file tanpa peduli case |
| `-c` | Count | Hitung jumlah match | Quick count file |
| `-l N` | Limit | Batasi output N results | Preview hasil pencarian |
| `-r` | Regexp | Gunakan regex pattern | Complex pattern matching |

**Use case data engineering:** Fast file discovery, verify file existence, locate config files.

**Note:** `locate` lebih cepat dari `find` tapi menggunakan database yang di-update secara periodik.

### [LOG LATIHAN PENCARIAN FILE](log/02-pencarian-dan-filtering/2-1_pencarian-file/latihan-dasar.md)

---

## 2.2 Pencarian pola teks

### grep (cari pattern dalam file)

**How to use:**
```bash
grep [options] pattern [file...]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-i` | Ignore case | Case-insensitive search | Search tanpa peduli case |
| `-v` | Invert match | Tampilkan baris yang TIDAK match | Filter out unwanted data |
| `-c` | Count | Hitung jumlah baris yang match | Quick statistics |
| `-n` | Line number | Tampilkan nomor baris | Reference lokasi data |
| `-r` | Recursive | Search rekursif dalam direktori | Search across multiple files |
| `-l` | Files with matches | Tampilkan nama file yang match | Find files containing pattern |
| `-A N` | After context | Tampilkan N baris setelah match | Context untuk debugging |
| `-B N` | Before context | Tampilkan N baris sebelum match | Context untuk debugging |
| `-E` | Extended regexp | Extended regex (egrep) | Complex pattern |
| `-o` | Only matching | Hanya tampilkan bagian yang match | Extract specific data |

**Use case data engineering:** Filter log, search error, extract pattern dari data, validasi isi file.

### [LOG LATIHAN DASAR PENCARIAN POLOLA DAN TEXT](log/02-pencarian-dan-filtering/2-2_pencarian-pola-text/latihan-dasar.md)

---

## 2.3 Statistik & agregasi

### wc (word count)

**How to use:**
```bash
wc [options] [file...]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-l` | Lines | Hitung jumlah baris | Count records dalam file data |
| `-w` | Words | Hitung jumlah kata | Text analysis |
| `-c` | Bytes | Hitung jumlah bytes | Validasi file size |
| `-m` | Characters | Hitung jumlah karakter | Character count |
| `-L` | Max line length | Panjang baris terpanjang | Validasi line length |

**Use case data engineering:** Count records, validasi jumlah baris setelah processing, quick data profiling.

---

### nl (numbering lines)

**How to use:**
```bash
nl [options] [file...]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-b a` | Body numbering all | Nomori semua baris | Add line numbers untuk tracking |
| `-b t` | Body numbering non-empty | Nomori hanya baris non-empty | Skip blank lines |
| `-s SEP` | Separator | Separator antara nomor dan teks | Custom format output |
| `-w N` | Width | Lebar field untuk nomor baris | Format alignment |

**Use case data engineering:** Add line numbers untuk referencing, debugging data dengan line reference.

### [LOG LATIHAN DASAR STATISTIK DAN AGREGASI](log/02-pencarian-dan-filtering/2-3_statistik-dan-aregasi/latihan-dasar.md)

---

## 2.4 Sorting & deduplikasi

### sort (urutkan baris)

**How to use:**
```bash
sort [options] [file...]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-n` | Numeric | Sort numerik (bukan string) | Sort ID atau angka dengan benar |
| `-r` | Reverse | Reverse order | Descending sort |
| `-u` | Unique | Hapus duplikat sambil sort | Sort + deduplikasi sekaligus |
| `-t CHAR` | Field separator | Delimiter untuk field (default TAB) | Sort CSV/TSV by field |
| `-k N` | Key | Sort berdasarkan kolom ke-N | Sort multi-column data |
| `-h` | Human numeric | Sort human-readable size (1K, 2M) | Sort file size output |
| `-o file` | Output | Write output ke file | In-place sort |

**Use case data engineering:** Sort data sebelum join, prepare data untuk uniq, order data by key.

---

### uniq (hapus duplikat berurutan)

**How to use:**
```bash
uniq [options] [input [output]]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-c` | Count | Hitung jumlah occurrence | Aggregate dan count duplicates |
| `-d` | Duplicated | Tampilkan hanya baris duplikat | Find duplicate records |
| `-u` | Unique | Tampilkan hanya baris unik (non-duplikat) | Filter duplicate records |
| `-i` | Ignore case | Case-insensitive comparison | Deduplicate tanpa peduli case |
| `-f N` | Skip fields | Skip N field pertama | Deduplicate based on specific fields |

**Use case data engineering:** Deduplikasi data, count occurrences, find duplicates untuk data quality.

**Note:** `uniq` hanya deteksi duplikat yang **berurutan**. Gunakan `sort` dulu sebelum `uniq`.

### [LOG LATIHAN DASAR SORTING DAN DEDUPLIKASI](log/02-pencarian-dan-filtering/2-4_sorting-dan-deduplikasi/latihan-dasar.md)

---

## 2.5 Ekstraksi kolom

### cut (potong kolom berdasarkan delimiter)

**How to use:**
```bash
cut [options] [file...]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-d CHAR` | Delimiter | Delimiter (default TAB) | Specify delimiter untuk CSV/TSV |
| `-f N` | Fields | Kolom ke-N (1-based) | Extract specific columns |
| `-f N-M` | Field range | Kolom N sampai M | Extract range of columns |
| `-f N,M` | Field list | Kolom N dan M | Extract multiple specific columns |
| `--complement` | Complement | Kebalikan dari field yang dipilih | Exclude specific columns |
| `--output-delimiter=STR` | Output delimiter | Custom output delimiter | Change delimiter in output |

**Use case data engineering:** Extract kolom dari CSV/TSV, select fields untuk processing, reformat data.

### [LOG LATIHAN DASAR EKSTRAKSI KOLOM](log/02-pencarian-dan-filtering/2-5_ekstraksi-kolom/latihan-dasar.md)

---

## 2.6 Perbandingan file

### diff (bandingkan 2 file)

**How to use:**
```bash
diff [options] file1 file2
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-q` | Brief | Hanya report apakah file berbeda | Quick check equality |
| `-y` | Side by side | Tampilkan side-by-side | Visual comparison |
| `-u` | Unified | Unified diff format | Standard diff format |
| `-i` | Ignore case | Case-insensitive comparison | Compare tanpa peduli case |
| `-w` | Ignore whitespace | Ignore whitespace differences | Focus on content |
| `-r` | Recursive | Compare direktori rekursif | Compare data directories |

**Use case data engineering:** Validasi hasil processing, compare source vs output, detect data changes.

---

### comm (bandingkan 2 file terurut)

**How to use:**
```bash
comm [options] file1 file2
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-1` | Suppress column 1 | Jangan tampilkan kolom 1 (hanya di file1) | Focus pada kolom lain |
| `-2` | Suppress column 2 | Jangan tampilkan kolom 2 (hanya di file2) | Focus pada kolom lain |
| `-3` | Suppress column 3 | Jangan tampilkan kolom 3 (di kedua file) | Focus pada kolom lain |
| `-1 -2` | Only in both | Tampilkan hanya yang ada di kedua file | Find intersection |
| `-1 -3` | Only in file2 | Tampilkan hanya yang ada di file2 | Find new records |
| `-2 -3` | Only in file1 | Tampilkan hanya yang ada di file1 | Find deleted records |

**Use case data engineering:** Compare sorted lists, find new/deleted records, set operations (intersection, difference).

**Note:** `comm` memerlukan file input yang sudah **sorted**. Output 3 kolom: (1) hanya di file1, (2) hanya di file2, (3) di keduanya.

---

**Yang harus dikuasai:**

> Mampu melakukan *filter early* sebelum data diproses lebih lanjut, menemukan data dengan cepat, dan melakukan agregasi sederhana.

---

# BAB 3: PIPING & REDIRECTION

**Konsep inti:** aliran data antar proses

---

## 3.1 Standard stream (konsep)

### stdin (standard input)

**Konsep:**
```
File descriptor 0
Input stream untuk command
Default: keyboard
Bisa di-redirect dari file
```

**Use case data engineering:** Terima data dari upstream process, baca dari file untuk processing.

---

### stdout (standard output)

**Konsep:**
```
File descriptor 1
Output stream normal
Default: terminal
Bisa di-redirect ke file/pipe
```

**Use case data engineering:** Kirim hasil processing ke downstream, output data hasil transformasi.

---

### stderr (standard error)

**Konsep:**
```
File descriptor 2
Error & diagnostic messages
Default: terminal (sama dengan stdout)
HARUS dipisah dari stdout
```

**Use case data engineering:** Logging error terpisah dari data, debugging tanpa corrupt output data.

**Best practice:** Jangan mix stdout (data) dengan stderr (log). Konsumen harus bisa distinguish keduanya.

---

## 3.2 Redirection

### > (redirect output, overwrite)

**How to use:**
```bash
command > file
```

**Behavior:**

| Aspek | Penjelasan |
|-------|------------|
| **Target** | Redirect stdout ke file |
| **Mode** | Overwrite (truncate file jika ada) |
| **Risiko** | Data loss jika file sudah ada |
| **Atomic** | ❌ Tidak atomic |

**Use case data engineering:** Save hasil processing ke file, output final dari pipeline.

**⚠️ WARNING:** `>` akan **overwrite** file tanpa konfirmasi. Gunakan temp file + `mv` untuk atomic write.

---

### >> (redirect output, append)

**How to use:**
```bash
command >> file
```

**Behavior:**

| Aspek | Penjelasan |
|-------|------------|
| **Target** | Redirect stdout ke file |
| **Mode** | Append (tambah di akhir file) |
| **Safety** | Tidak overwrite data existing |
| **Use case** | Accumulation, incremental log |

**Use case data engineering:** Append log, accumulate hasil processing incremental, streaming append.

**Note:** Untuk data append, pastikan ada **deduplikasi** atau **idempotency check** agar tidak duplikat saat retry.

---

### < (redirect input)

**How to use:**
```bash
command < file
```

**Behavior:**

| Aspek | Penjelasan |
|-------|------------|
| **Source** | Redirect file ke stdin |
| **Equivalent** | `cat file \| command` tapi lebih efisien |
| **Use case** | Feed file ke command yang expect stdin |

**Use case data engineering:** Feed data file ke command, batch processing dari file.

---

### 2> (redirect stderr)

**How to use:**
```bash
command 2> error.log
```

**Behavior:**

| Aspek | Penjelasan |
|-------|------------|
| **Target** | Redirect stderr ke file |
| **stdout** | Tetap ke terminal |
| **Use case** | Pisahkan error dari output data |

**Use case data engineering:** Log error terpisah dari data, debugging tanpa corrupt stdout.

---

### &> (redirect stdout & stderr)

**How to use:**
```bash
command &> output.log
```

**Behavior:**

| Aspek | Penjelasan |
|-------|------------|
| **Target** | Redirect stdout DAN stderr ke file yang sama |
| **Equivalent** | `command > file 2>&1` |
| **Use case** | Capture semua output untuk logging |

**Use case data engineering:** Full logging untuk audit, capture semua output termasuk error.

**Note:** Urutan penting: `command > file 2>&1` (benar) vs `command 2>&1 > file` (salah).

---

### 2>&1 (redirect stderr ke stdout)

**How to use:**
```bash
command 2>&1
```

**Behavior:**

| Aspek | Penjelasan |
|-------|------------|
| **Effect** | stderr diarahkan ke stdout |
| **Use case** | Pipe error ke downstream command |
| **Kombinasi** | `command 2>&1 \| tee log.txt` |

**Use case data engineering:** Pipe semua output (data + error) untuk unified processing, tee ke file dan terminal.

---

## 3.3 Piping

### | (pipe)

**How to use:**
```bash
command1 | command2 | command3
```

**Behavior:**

| Aspek | Penjelasan |
|-------|------------|
| **Mekanisme** | stdout command1 → stdin command2 |
| **Streaming** | Data mengalir real-time, tidak perlu tunggu selesai |
| **Memory** | Tidak perlu intermediate file |
| **Exit code** | Default: exit code dari command terakhir |

**Use case data engineering:** Chain transformasi data, streaming processing, filter → transform → load.

**Philosophy:** Pipeline adalah **aliran data**, bukan kumpulan command terpisah. Data mengalir seperti air di pipa.

---

### set -o pipefail (robust pipeline)

**How to use:**
```bash
set -o pipefail
command1 | command2 | command3
```

**Behavior:**

| Aspek | Penjelasan |
|-------|------------|
| **Default** | Exit code = exit code command terakhir |
| **Dengan pipefail** | Exit code = exit code command pertama yang gagal |
| **Best practice** | ✅ SELALU gunakan dalam production script |

**Use case data engineering:** Detect failure di tengah pipeline, fail fast untuk data quality.

**Example:**
```bash
set -o pipefail
cat missing.csv | grep ERROR | wc -l
# Tanpa pipefail: exit 0 (wc berhasil)
# Dengan pipefail: exit non-zero (cat gagal)
```

---

## 3.4 Kontrol output

### tee (duplikasi output)

**How to use:**
```bash
command | tee [options] file
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-a` | Append | Append ke file (tidak overwrite) | Accumulate log incremental |
| `-i` | Ignore interrupt | Ignore interrupt signals | Robust terhadap SIGINT |

**Use case data engineering:** Save intermediate result sambil lanjut processing, logging sambil monitor real-time.

**Example:**
```bash
cat data.csv | process.sh | tee intermediate.csv | validate.sh
# intermediate.csv tersimpan DAN data lanjut ke validate.sh
```

---

### /dev/null (black hole)

**How to use:**
```bash
command > /dev/null
command 2> /dev/null
command &> /dev/null
```

**Behavior:**

| Aspek | Penjelasan |
|-------|------------|
| **Fungsi** | Buang semua data yang ditulis ke sini |
| **Use case** | Suppress output yang tidak dibutuhkan |
| **Warning** | Jangan buang stderr di production (silent failure!) |

**Use case data engineering:** Suppress verbose output, buang data yang tidak dibutuhkan, focus pada stderr.

**Best practice:** `command > /dev/null` (buang stdout, keep stderr) lebih baik dari `command &> /dev/null` (buang semua).

---

## 3.5 Here document & here string

### << (here document)

**How to use:**
```bash
command << DELIMITER
content line 1
content line 2
DELIMITER
```

**Behavior:**

| Aspek | Penjelasan |
|-------|------------|
| **Fungsi** | Multi-line string sebagai stdin |
| **Delimiter** | Custom delimiter (biasa EOF, END) |
| **Variable expansion** | ✅ Variable di-expand |
| **Escape** | `<<'DELIMITER'` untuk literal (no expansion) |

**Use case data engineering:** Generate config file, create SQL script inline, template generation.

**Example:**
```bash
cat << EOF > config.txt
DATABASE=$DB_NAME
HOST=$DB_HOST
EOF
```

---

### <<< (here string)

**How to use:**
```bash
command <<< "string"
```

**Behavior:**

| Aspek | Penjelasan |
|-------|------------|
| **Fungsi** | Single-line string sebagai stdin |
| **Equivalent** | `echo "string" \| command` tapi lebih efisien |
| **Variable expansion** | ✅ Variable di-expand |

**Use case data engineering:** Feed string ke command, testing command dengan sample input.

**Example:**
```bash
grep ERROR <<< "$log_line"
# Lebih efisien dari: echo "$log_line" | grep ERROR
```

---

**Yang harus dikuasai:**

> Memahami bahwa pipeline adalah *aliran data*, bukan kumpulan command terpisah. Mampu memisahkan stdout (data) dari stderr (log), dan membangun pipeline yang fail fast dengan `set -o pipefail`.

---

# BAB 4: TEXT PROCESSING & DATA SHAPE

**Konsep inti:** transformasi data berbasis stream dan bentuk data

---

## 4.1 Stream editor

### sed (stream editor)

**How to use:**
```bash
sed [options] 'command' file
sed [options] -e 'command1' -e 'command2' file
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-i` | In-place | Edit file langsung (buat backup dulu!) | Transform data file in-place |
| `-i.bak` | In-place with backup | Edit file + buat backup | Safe in-place edit |
| `-n` | Quiet | Suppress default output | Output hanya yang match |
| `-e` | Expression | Multiple expression | Chain multiple transformations |
| `-E` | Extended regex | Extended regex (ERE) | Complex pattern |
| `-r` | Extended regex | Sama dengan -E | Alias untuk -E |

**Common sed commands:**

| Command | Fungsi | Contoh | Use Case Data Engineering |
|---------|--------|--------|---------------------------|
| `s/pattern/replacement/` | Substitute | `sed 's/old/new/'` | Replace text, clean data |
| `s/pattern/replacement/g` | Global substitute | `sed 's/old/new/g'` | Replace all occurrences |
| `d` | Delete line | `sed '/pattern/d'` | Filter out unwanted lines |
| `p` | Print | `sed -n '/pattern/p'` | Extract matching lines |
| `N;d` | Delete range | `sed '1d'` (delete line 1) | Skip header |
| `N,Md` | Delete range | `sed '1,10d'` | Skip N lines |

**Use case data engineering:** Text replacement, data cleaning, format conversion, remove header, filter lines.

---

## 4.2 Pattern scanning & processing

### awk (pattern scanning & processing language)

**How to use:**
```bash
awk [options] 'pattern { action }' file
awk [options] -F 'delimiter' '{ action }' file
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-F` | Field separator | Set field delimiter | Process CSV/TSV dengan delimiter custom |
| `-v var=value` | Variable | Set variable | Pass parameter dari shell ke awk |
| `-f file` | File | Read awk script dari file | Complex awk program |

**Built-in variables:**

| Variable | Fungsi | Use Case Data Engineering |
|----------|--------|---------------------------|
| `$0` | Entire line | Process full record |
| `$1, $2, $N` | Field N (1-based) | Extract specific columns |
| `NR` | Number of records (line number) | Add line number, filter by row |
| `NF` | Number of fields | Validate column count |
| `FS` | Field separator (input) | Define delimiter |
| `OFS` | Output field separator | Format output delimiter |
| `BEGIN { }` | Execute before processing | Initialize, print header |
| `END { }` | Execute after processing | Summary, aggregation |

**Use case data engineering:** Column extraction, aggregation, filtering by field, data validation, format transformation, summary statistics.

**Common patterns:**
```bash
awk -F',' '{print $1, $3}'              # Extract column 1 & 3
awk -F',' 'NR>1 {print}'                # Skip header
awk -F',' '{sum+=$2} END {print sum}'   # Sum column 2
awk -F',' 'NF==5'                       # Filter rows with 5 fields
```

---

## 4.3 Transformasi karakter

### tr (translate/delete characters)

**How to use:**
```bash
tr [options] SET1 [SET2]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-d` | Delete | Hapus karakter dalam SET1 | Remove unwanted characters |
| `-s` | Squeeze | Squeeze multiple karakter jadi satu | Remove duplicate spaces/chars |
| `-c` | Complement | Complement dari SET1 | Invert selection |
| `-t` | Truncate | Truncate SET1 ke length SET2 | Safe character mapping |

**Common use cases:**

| Pattern | Fungsi | Use Case Data Engineering |
|---------|--------|---------------------------|
| `tr 'a-z' 'A-Z'` | Lowercase to uppercase | Standardize case |
| `tr -d '\r'` | Remove carriage return | Windows to Unix line ending |
| `tr -s ' '` | Squeeze spaces | Normalize whitespace |
| `tr ',' '\t'` | CSV to TSV | Change delimiter |
| `tr -d '[:punct:]'` | Remove punctuation | Clean text data |
| `tr -cd '[:alnum:]'` | Keep only alphanumeric | Extract alphanumeric |

**Use case data engineering:** Case conversion, delimiter change, remove special characters, normalize whitespace, line ending conversion.

---

## 4.4 Argument expansion

### xargs (build and execute command)

**How to use:**
```bash
command | xargs [options] [command]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-n N` | Max args | Execute command dengan N arguments per batch | Batch processing |
| `-I {}` | Replace string | Replace {} dengan input | Custom command construction |
| `-P N` | Parallel | Run N commands in parallel | Parallel processing |
| `-t` | Verbose | Print command sebelum execute | Debugging, logging |
| `-0` | Null separator | Input separator null (untuk find -print0) | Handle filename dengan space |
| `-d delim` | Delimiter | Custom delimiter | Non-standard delimiter |
| `-r` | No run if empty | Jangan jalankan jika input kosong | Safety check |

**Use case data engineering:** Batch processing files, parallel execution, build complex commands from input, process hasil find.

**Common patterns:**
```bash
find . -name "*.csv" | xargs -n 1 process.sh     # Process each file
find . -name "*.csv" | xargs -P 4 process.sh     # Parallel (4 jobs)
cat files.txt | xargs -I {} mv {} processed/     # Move files
```

---

## 4.5 Text manipulation lanjutan

### paste (merge lines from files)

**How to use:**
```bash
paste [options] file1 file2 ...
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-d delim` | Delimiter | Delimiter antar file (default TAB) | Custom output delimiter |
| `-s` | Serial | Paste satu file per line (horizontal) | Transpose data |

**Use case data engineering:** Join files side-by-side, combine columns dari multiple files, create TSV dari single-column files.

---

### join (join lines berdasarkan common field)

**How to use:**
```bash
join [options] file1 file2
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-t CHAR` | Field separator | Delimiter (default whitespace) | Join CSV/TSV files |
| `-1 N` | File 1 field | Join field dari file1 | Specify key column file1 |
| `-2 N` | File 2 field | Join field dari file2 | Specify key column file2 |
| `-a N` | Print unpairable | Print unmatched dari fileN | Left/right outer join |
| `-o FORMAT` | Output format | Custom output format | Select specific fields |
| `-i` | Ignore case | Case-insensitive comparison | Flexible matching |

**Use case data engineering:** Join datasets by key, merge data from multiple sources, relational join operation.

**Note:** `join` memerlukan file input yang sudah **sorted** by join field.

---

### column (columnate output)

**How to use:**
```bash
column [options]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-t` | Table | Create table (auto-detect delimiter) | Pretty print tabular data |
| `-s CHAR` | Separator | Input delimiter | Specify delimiter |
| `-n` | No merge | Jangan merge multiple delimiters | Preserve empty fields |
| `-o CHAR` | Output separator | Output delimiter | Custom output format |

**Use case data engineering:** Pretty print CSV/TSV, format output untuk human readability, alignment.

---

### expand (convert tabs to spaces)

**How to use:**
```bash
expand [options] [file]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-t N` | Tab stops | Set tab stop to N spaces | Custom tab width |
| `-i` | Initial | Only expand leading tabs | Preserve internal tabs |

**Use case data engineering:** Convert TSV to fixed-width, normalize tab spacing, fix indentation.

---

### unexpand (convert spaces to tabs)

**How to use:**
```bash
unexpand [options] [file]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-t N` | Tab stops | Set tab stop to N spaces | Custom tab width |
| `-a` | All | Convert all spaces (not just leading) | Full conversion |
| `--first-only` | First only | Only leading spaces | Preserve internal spaces |

**Use case data engineering:** Convert fixed-width to TSV, compress whitespace, standardize format.

---

## 4.6 Data format & shape (konsep)

### CSV (Comma-Separated Values)

| Aspek | Karakteristik | Challenge |
|-------|---------------|-----------|
| **Delimiter** | Comma `,` | Comma dalam data harus di-quote |
| **Quote** | Double quote `"` | Escape quote dalam quote: `""` |
| **Header** | Optional, usually line 1 | Harus handle dengan/tanpa header |
| **Multiline** | Bisa (dalam quote) | Parsing kompleks |

**Use case data engineering:** Universal format, interoperability, export dari spreadsheet/database.

---

### TSV (Tab-Separated Values)

| Aspek | Karakteristik | Advantage over CSV |
|-------|---------------|---------------------|
| **Delimiter** | Tab `\t` | Tab jarang muncul dalam data |
| **Quote** | Usually tidak perlu | Simpler parsing |
| **Shell-friendly** | ✅ Mudah di-process dengan cut, awk | Native tool support |

**Use case data engineering:** Pipeline internal, shell scripting, log format.

---

### JSON (JavaScript Object Notation)

| Aspek | Karakteristik | Challenge |
|-------|---------------|-----------|
| **Structure** | Hierarchical, nested | Tidak flat, butuh parser |
| **Schema** | Flexible | Bisa berbeda antar record |
| **Array** | Support array | Unnesting untuk tabular |
| **Multiline** | Pretty-printed bisa multiline | Single-line lebih shell-friendly |

**Use case data engineering:** API response, semi-structured data, config file.

---

### NDJSON (Newline Delimited JSON)

| Aspek | Karakteristik | Advantage over JSON |
|-------|---------------|---------------------|
| **Format** | 1 JSON object per line | Streamable, line-based processing |
| **Parsing** | Line by line | Memory efficient |
| **Shell-friendly** | ✅ Compatible dengan line-based tools | grep, head, tail work |
| **Append** | Easy append | Log-like format |

**Use case data engineering:** Streaming data, log dengan structured format, big data processing.

---

### Delimiter Problem

| Problem | Contoh | Solution |
|---------|--------|----------|
| **Delimiter dalam data** | `"Smith, John",30` | Quote atau escape |
| **Quote dalam data** | `"He said ""Hi"""` | Double quote escape |
| **Newline dalam data** | Multiline address | Quote + handle multiline |
| **Encoding issue** | UTF-8 vs ASCII | Validate encoding |

**Best practice:** Pilih delimiter yang jarang muncul dalam data (misal `|`, `\t`).

---

### Header Handling

| Scenario | Strategy | Implementation |
|----------|----------|----------------|
| **Skip header** | Process data only | `tail -n +2`, `awk 'NR>1'` |
| **Extract header** | Get column names | `head -n 1` |
| **Preserve header** | Keep in output | Process header separately |
| **Add header** | Generate header | Prepend header ke data |

**Use case data engineering:** Schema detection, column mapping, data validation.

---

### Multiline Record

| Challenge | Contoh | Solution |
|-----------|--------|----------|
| **CSV multiline** | Quoted field dengan newline | Parser aware of quote context |
| **Log multiline** | Stack trace | Pattern-based grouping |
| **JSON multiline** | Pretty-printed JSON | Use NDJSON atau parse full object |

**Best practice:** Hindari multiline jika bisa. Gunakan escape sequence (`\n`) atau NDJSON.

---

## 4.7 Tool untuk data semi-structured

### jq (JSON processor)

**How to use:**
```bash
jq [options] 'filter' [file]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-r` | Raw output | Output tanpa quote (raw string) | Shell-friendly output |
| `-c` | Compact | Compact JSON (single line) | Convert ke NDJSON |
| `-n` | Null input | Jangan baca input | Construct JSON from scratch |
| `-e` | Exit status | Exit non-zero jika output null/false | Validation dalam script |
| `-s` | Slurp | Read entire input ke array | Aggregate multiple JSON objects |
| `-M` | Monochrome | Disable color output | Script/pipeline friendly |

**Common jq filters:**

| Filter | Fungsi | Use Case Data Engineering |
|--------|--------|---------------------------|
| `.` | Identity (entire JSON) | Pretty print JSON |
| `.field` | Extract field | Get specific field |
| `.[]` | Iterate array | Process each element |
| `.[N]` | Array element N | Get specific element |
| `.field1.field2` | Nested field | Navigate hierarchy |
| `\| length` | Array/object length | Count elements |
| `\| keys` | Object keys | Get all keys |
| `select(.field == value)` | Filter | Filter records |
| `map(.field)` | Map | Transform array |
| `group_by(.field)` | Group | Aggregate data |

**Use case data engineering:** Parse API response, extract JSON fields, convert JSON to CSV, filter/transform JSON data, validate JSON structure.

**Common patterns:**
```bash
jq '.data[]' file.json                    # Iterate array
jq -r '.name' file.json                   # Extract field (raw)
jq '.[] | select(.age > 30)' file.json    # Filter
jq -r '.[] | [.id, .name] | @csv'         # JSON to CSV
```

---

**Yang harus dikuasai:**

> Mampu mengenali dan memanipulasi *bentuk data*, bukan hanya isinya. Memahami trade-off antar format (CSV/TSV/JSON/NDJSON), dan mampu transform data antar format dengan tools yang tepat.

---

# BAB 5: COMPRESSION & TRANSFER

**Konsep inti:** efisiensi dan distribusi data

---

## 5.1 Arsip

### tar (tape archive)

**How to use:**
```bash
tar [options] archive.tar [files/directories]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-c` | Create | Buat archive baru | Archive data untuk transfer/backup |
| `-x` | Extract | Ekstrak archive | Restore data dari archive |
| `-t` | List | List isi archive tanpa ekstrak | Preview archive content |
| `-f file` | File | Specify archive filename | Nama file archive |
| `-v` | Verbose | Tampilkan files yang diproses | Logging dalam script |
| `-z` | Gzip | Kompresi dengan gzip (.tar.gz) | Archive + kompresi sekaligus |
| `-j` | Bzip2 | Kompresi dengan bzip2 (.tar.bz2) | Better compression ratio |
| `-C dir` | Change directory | Extract ke direktori tertentu | Specify extraction target |
| `--exclude pattern` | Exclude | Exclude files by pattern | Skip temp/log files |
| `-p` | Preserve permissions | Preserve permissions | Maintain file metadata |

**Use case data engineering:** Archive dataset untuk transfer, backup data lake, package deployment, distribute data bundle.

**Common patterns:**
```bash
tar -czf data.tar.gz data/              # Create compressed archive
tar -xzf data.tar.gz -C /target/        # Extract to target
tar -tzf data.tar.gz                    # List content
tar -czf backup.tar.gz --exclude='*.log' data/  # Exclude logs
```

---

## 5.2 Kompresi

### gzip (GNU zip compression)

**How to use:**
```bash
gzip [options] file
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-k` | Keep | Keep original file | Preserve source file |
| `-c` | Stdout | Output ke stdout | Pipe compression |
| `-d` | Decompress | Decompress (sama dengan gunzip) | Decompress file |
| `-r` | Recursive | Kompresi rekursif dalam direktori | Compress directory |
| `-[1-9]` | Compression level | Level 1 (fast) to 9 (best) | Balance speed vs ratio |
| `-v` | Verbose | Tampilkan compression ratio | Monitor compression |
| `-t` | Test | Test integrity | Validate compressed file |

**Use case data engineering:** Compress log files, reduce data transfer size, save storage space.

**Note:** `gzip` mengganti file original dengan `.gz`. Gunakan `-k` untuk keep original.

---

### gunzip (decompress gzip files)

**How to use:**
```bash
gunzip [options] file.gz
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-k` | Keep | Keep compressed file | Preserve .gz file |
| `-c` | Stdout | Output ke stdout | Pipe decompression |
| `-t` | Test | Test integrity tanpa decompress | Validate before extract |
| `-v` | Verbose | Tampilkan info | Monitor decompression |

**Use case data engineering:** Extract compressed data, decompress untuk processing, validate compressed files.

---

### bzip2 (better compression)

**How to use:**
```bash
bzip2 [options] file
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-k` | Keep | Keep original file | Preserve source |
| `-c` | Stdout | Output ke stdout | Pipe compression |
| `-d` | Decompress | Decompress (sama dengan bunzip2) | Decompress file |
| `-z` | Compress | Force compression | Explicit compress |
| `-[1-9]` | Block size | Block size 100k-900k | Memory vs compression trade-off |
| `-v` | Verbose | Tampilkan compression ratio | Monitor progress |
| `-t` | Test | Test integrity | Validate file |

**Use case data engineering:** Better compression ratio untuk large data, archive storage, slow network transfer.

**Note:** `bzip2` lebih lambat tapi compression ratio lebih baik dari `gzip`.

---

### bunzip2 (decompress bzip2 files)

**How to use:**
```bash
bunzip2 [options] file.bz2
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-k` | Keep | Keep compressed file | Preserve .bz2 file |
| `-c` | Stdout | Output ke stdout | Pipe decompression |
| `-t` | Test | Test integrity | Validate before extract |
| `-v` | Verbose | Tampilkan info | Monitor decompression |

**Use case data engineering:** Extract highly compressed data, decompress archives.

---

### zip (create zip archive)

**How to use:**
```bash
zip [options] archive.zip files/directories
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-r` | Recursive | Rekursif include directories | Archive directory |
| `-[0-9]` | Compression level | 0 (store) to 9 (best) | Balance speed vs size |
| `-q` | Quiet | Suppress output | Silent mode untuk script |
| `-v` | Verbose | Verbose output | Logging |
| `-u` | Update | Update existing archive | Incremental archive |
| `-d` | Delete | Delete dari archive | Remove files from archive |
| `-T` | Test | Test archive integrity | Validate archive |
| `-e` | Encrypt | Encrypt archive | Secure data transfer |

**Use case data engineering:** Cross-platform archive, distribute data ke Windows, password-protected archive.

---

### unzip (extract zip archive)

**How to use:**
```bash
unzip [options] archive.zip
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-l` | List | List isi archive | Preview content |
| `-d dir` | Directory | Extract ke directory tertentu | Specify target |
| `-q` | Quiet | Suppress output | Silent mode |
| `-o` | Overwrite | Overwrite tanpa prompt | Automation |
| `-n` | Never overwrite | Jangan overwrite existing | Protect existing |
| `-t` | Test | Test integrity | Validate before extract |
| `-v` | Verbose | Verbose output | Detailed info |

**Use case data engineering:** Extract data dari external source, unpack data bundle, restore archive.

---

## 5.3 Transfer remote

### scp (secure copy via SSH)

**How to use:**
```bash
scp [options] source destination
scp [options] file user@host:/path
scp [options] user@host:/path local_path
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-r` | Recursive | Copy directory rekursif | Transfer directory |
| `-P port` | Port | Specify SSH port | Non-standard SSH port |
| `-p` | Preserve | Preserve timestamps & permissions | Maintain metadata |
| `-q` | Quiet | Suppress progress | Silent mode |
| `-v` | Verbose | Verbose output | Debug connection |
| `-C` | Compression | Enable compression | Faster transfer |
| `-i keyfile` | Identity | Specify SSH key | Key-based auth |
| `-l limit` | Limit | Limit bandwidth (Kbit/s) | Rate limiting |

**Use case data engineering:** Transfer data antar server, backup ke remote, pull data dari source.

**Note:** `scp` simple tapi tidak resume. Untuk large file, gunakan `rsync`.

---

### rsync (remote sync)

**How to use:**
```bash
rsync [options] source destination
rsync [options] source user@host:/path
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-a` | Archive | Archive mode (preserve all) | Complete backup |
| `-v` | Verbose | Verbose output | Monitor progress |
| `-z` | Compress | Compress during transfer | Faster transfer |
| `-r` | Recursive | Recursive | Sync directory |
| `-n` | Dry run | Dry run (no changes) | Preview changes |
| `--delete` | Delete | Delete di destination jika tidak ada di source | Mirror sync |
| `--exclude pattern` | Exclude | Exclude files by pattern | Skip temp files |
| `--progress` | Progress | Show progress per file | Monitor transfer |
| `--partial` | Partial | Keep partial transfers (resume) | Resume interrupted transfer |
| `-e ssh` | Remote shell | Specify remote shell | SSH transport |

**Use case data engineering:** Incremental backup, sync data lake, mirror directories, resume large transfers.

**Best practice:** Always dry run (`-n`) dulu sebelum sync real.

---

## 5.4 HTTP client

### curl (transfer data via URL)

**How to use:**
```bash
curl [options] URL
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-o file` | Output | Save output ke file | Download file |
| `-O` | Remote name | Save dengan nama remote | Download preserving name |
| `-L` | Location | Follow redirects | Handle redirect |
| `-f` | Fail | Fail silently on HTTP error | Detect HTTP error |
| `-s` | Silent | Silent mode | Suppress progress |
| `-S` | Show error | Show error bahkan dengan -s | Silent tapi show error |
| `-H header` | Header | Custom HTTP header | Authentication, API key |
| `-d data` | Data | POST data | API request |
| `-X method` | Request | HTTP method (GET, POST, PUT, DELETE) | RESTful API |
| `-u user:pass` | User | Authentication | Basic auth |
| `-C -` | Continue | Resume download | Resume partial download |

**Use case data engineering:** Download data dari API, HTTP-based ingestion, webhook integration, test API endpoint.

**Common patterns:**
```bash
curl -fsSL https://api.example.com/data.json -o data.json
curl -X POST -H "Content-Type: application/json" -d '{"key":"value"}' https://api.example.com
```

---

### wget (non-interactive network downloader)

**How to use:**
```bash
wget [options] URL
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-O file` | Output document | Save ke file tertentu | Specify output name |
| `-c` | Continue | Resume download | Resume partial download |
| `-q` | Quiet | Quiet mode | Silent download |
| `-b` | Background | Background download | Non-blocking download |
| `-r` | Recursive | Download rekursif | Download website/directory |
| `-np` | No parent | Jangan ascend ke parent | Limit recursion |
| `-N` | Timestamping | Download hanya jika lebih baru | Incremental download |
| `--limit-rate=RATE` | Limit rate | Limit download speed | Bandwidth control |
| `--user=USER` | User | HTTP/FTP username | Authentication |
| `--password=PASS` | Password | HTTP/FTP password | Authentication |
| `-P prefix` | Directory prefix | Save ke direktori tertentu | Target directory |

**Use case data engineering:** Scheduled download, bulk download, mirror website data, incremental download.

**Note:** `wget` lebih baik untuk recursive download dan resume. `curl` lebih flexible untuk API.

---

**Yang harus dikuasai:**

> Mampu memindahkan data besar secara efisien dan aman. Memahami trade-off compression (speed vs ratio), dan memilih tool transfer yang tepat (scp vs rsync vs curl/wget).

---

# BAB 6: PERMISSIONS & SECURITY

**Konsep inti:** kontrol akses & integritas data

---

## 6.1 Permission dasar

### Konsep: Linux File Permission

**Permission format:** `rwxrwxrwx` (3 grup: owner, group, others)

| Symbol | Permission | Numeric | File | Directory |
|--------|------------|---------|------|----------|
| `r` | Read | 4 | Read file | List directory |
| `w` | Write | 2 | Write file | Create/delete files |
| `x` | Execute | 1 | Execute file | Access directory |
| `-` | No permission | 0 | - | - |

**Common permission:**
- `644` (rw-r--r--): File biasa (owner write, others read)
- `755` (rwxr-xr-x): Executable/directory (owner write+execute, others read+execute)
- `600` (rw-------): Private file (hanya owner)
- `700` (rwx------): Private directory (hanya owner)

---

### chmod (change mode)

**How to use:**
```bash
chmod [options] mode file
chmod [options] u+x file        # Symbolic
chmod [options] 755 file        # Numeric
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-R` | Recursive | Apply rekursif ke subdirectories | Change permission directory |
| `-v` | Verbose | Tampilkan setiap file yang diubah | Logging |
| `-c` | Changes | Tampilkan hanya yang berubah | Filter output |
| `--reference=FILE` | Reference | Copy permission dari file lain | Replicate permission |

**Symbolic mode:**

| Format | Makna | Contoh | Effect |
|--------|-------|--------|--------|
| `u+x` | User add execute | `chmod u+x script.sh` | Owner dapat execute |
| `g-w` | Group remove write | `chmod g-w file` | Group tidak bisa write |
| `o=r` | Others set read | `chmod o=r file` | Others hanya read |
| `a+r` | All add read | `chmod a+r file` | Semua bisa read |
| `u+rwx,go-rwx` | Multi | `chmod u+rwx,go-rwx file` | Private to owner (700) |

**Use case data engineering:** Set script executable, protect sensitive data, control data access, secure config files.

**Best practice:** Data file = `640` (owner+group read, owner write), Script = `750` (owner all, group read+execute).

---

### chown (change owner)

**How to use:**
```bash
chown [options] owner[:group] file
chown [options] user file
chown [options] user:group file
chown [options] :group file      # Change group only
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-R` | Recursive | Change owner rekursif | Change ownership directory |
| `-v` | Verbose | Tampilkan setiap file yang diubah | Logging |
| `-c` | Changes | Tampilkan hanya yang berubah | Filter output |
| `--reference=FILE` | Reference | Copy ownership dari file lain | Replicate ownership |

**Use case data engineering:** Transfer ownership setelah ETL, setup data directories, multi-user access control.

**Note:** Hanya root atau owner yang bisa change ownership.

---

### chgrp (change group)

**How to use:**
```bash
chgrp [options] group file
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-R` | Recursive | Change group rekursif | Change group directory |
| `-v` | Verbose | Tampilkan setiap file yang diubah | Logging |
| `-c` | Changes | Tampilkan hanya yang berubah | Filter output |
| `--reference=FILE` | Reference | Copy group dari file lain | Replicate group |

**Use case data engineering:** Shared data access untuk team, group-based permission, collaborative workspace.

---

### umask (default permission mask)

**How to use:**
```bash
umask [mode]
umask           # Show current umask
umask 022       # Set umask
```

**Behavior:**

| umask | File (666 - mask) | Directory (777 - mask) | Use Case |
|-------|-------------------|------------------------|----------|
| `022` | `644` (rw-r--r--) | `755` (rwxr-xr-x) | Default: readable by all |
| `027` | `640` (rw-r-----) | `750` (rwxr-x---) | Group readable, others no access |
| `077` | `600` (rw-------) | `700` (rwx------) | Private: only owner |

**Use case data engineering:** Set default permission untuk file baru, security policy, automated file creation.

**Note:** umask di-substract dari default permission (file: 666, dir: 777).

---

## 6.2 Melihat permission & ownership

### ls -l (list with permissions)

**How to use:**
```bash
ls -l file
ls -ld directory
```

**Output format:**
```
-rw-r--r--
1 user group 1024 Jan 01 12:00 file.txt
│││││││││  │  │    │    │    │             │
│││││││││  │  │    │    │    │             └─ filename
│││││││││  │  │    │    │    └─ timestamp
│││││││││  │  │    │    └─ size
│││││││││  │  │    └─ group
│││││││││  │  └─ owner
│││││││││  └─ link count
│││││││││
││││││││└─ others execute
│││││││└─ others write
││││││└─ others read
│││││└─ group execute
││││└─ group write
│││└─ group read
││└─ owner execute
│└─ owner write
└─ owner read
```

**Use case data engineering:** Audit file permission, verify ownership, troubleshoot access issues.

---

### id (user and group information)

**How to use:**
```bash
id [username]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-u` | User | Show user ID only | Get UID |
| `-g` | Group | Show primary group ID only | Get GID |
| `-G` | Groups | Show all group IDs | Get all groups |
| `-n` | Name | Show names instead of IDs | Human-readable |

**Use case data engineering:** Verify user identity, check group membership, troubleshoot permission.

---

### whoami (current user)

**How to use:**
```bash
whoami
```

**Use case data engineering:** Validate user context dalam script, logging, sanity check sebelum operasi sensitif.

---

### groups (group membership)

**How to use:**
```bash
groups [username]
```

**Use case data engineering:** Check group membership, verify access rights, troubleshoot group permission.

---

## 6.3 Akses remote

### ssh (secure shell)

**How to use:**
```bash
ssh [options] user@host
ssh [options] user@host command
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-p port` | Port | Specify SSH port | Non-standard port |
| `-i keyfile` | Identity | Specify private key | Key-based auth |
| `-L local:remote` | Local forward | Local port forwarding | Tunnel connection |
| `-R remote:local` | Remote forward | Remote port forwarding | Reverse tunnel |
| `-N` | No command | No remote command (forwarding only) | Port forwarding only |
| `-f` | Background | Background mode | Non-interactive |
| `-v` | Verbose | Verbose mode | Debug connection |
| `-o option` | Option | Set SSH option | Custom config |

**Use case data engineering:** Remote server access, execute remote commands, secure tunneling, automation.

**Common patterns:**
```bash
ssh user@host "cd /data && ./process.sh"    # Remote command
ssh -L 5432:localhost:5432 user@host        # Port forward
```

---

### ssh-keygen (generate SSH key pair)

**How to use:**
```bash
ssh-keygen [options]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-t type` | Type | Key type (rsa, ed25519, ecdsa) | Specify algorithm |
| `-b bits` | Bits | Key length | Security strength |
| `-f file` | File | Output filename | Custom key location |
| `-C comment` | Comment | Comment (usually email) | Identify key |
| `-N passphrase` | New passphrase | Set passphrase | Secure key |
| `-p` | Change passphrase | Change key passphrase | Update security |

**Use case data engineering:** Setup passwordless authentication, secure automation, CI/CD deployment.

**Best practice:** Use `ed25519` for new keys: `ssh-keygen -t ed25519 -C "email@example.com"`

---

### ssh-copy-id (install SSH key)

**How to use:**
```bash
ssh-copy-id [options] user@host
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-i keyfile` | Identity | Specify key file | Custom key |
| `-p port` | Port | SSH port | Non-standard port |
| `-f` | Force | Force copy | Overwrite existing |

**Use case data engineering:** Setup automated access, deploy SSH keys, enable passwordless SSH.

---

## 6.4 Integritas data

### md5sum (MD5 checksum)

**How to use:**
```bash
md5sum file
md5sum -c checksum.md5
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-c file` | Check | Verify checksums dari file | Validate integrity |
| `-b` | Binary | Binary mode | Binary files |
| `-t` | Text | Text mode | Text files |

**Use case data engineering:** Verify data integrity, detect corruption, validate file transfer.

**Note:** MD5 tidak aman untuk security (collision attack), gunakan untuk integrity check saja.

---

### sha256sum (SHA-256 checksum)

**How to use:**
```bash
sha256sum file
sha256sum -c checksum.sha256
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-c file` | Check | Verify checksums dari file | Validate integrity |
| `-b` | Binary | Binary mode | Binary files |
| `-t` | Text | Text mode | Text files |

**Use case data engineering:** Secure integrity check, verify downloads, detect tampering, compliance requirements.

**Best practice:** SHA-256 lebih secure dari MD5/SHA-1 untuk integrity verification.

---

### sha1sum (SHA-1 checksum)

**How to use:**
```bash
sha1sum file
sha1sum -c checksum.sha1
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-c file` | Check | Verify checksums dari file | Validate integrity |
| `-b` | Binary | Binary mode | Binary files |
| `-t` | Text | Text mode | Text files |

**Use case data engineering:** Integrity check (legacy systems), verify file consistency.

**Note:** SHA-1 deprecated untuk security purposes, gunakan SHA-256 atau lebih tinggi.

---

### Checksum workflow

**Generate checksum:**
```bash
sha256sum data.csv > data.csv.sha256
```

**Verify checksum:**
```bash
sha256sum -c data.csv.sha256
# Output: data.csv: OK
```

**Batch checksum:**
```bash
find /data -name "*.csv" -exec sha256sum {} \; > checksums.txt
```

**Use case:** Validate data sebelum/setelah transfer, detect silent corruption, audit trail.

---

**Yang harus dikuasai:**

> Menjamin data tidak rusak dan tidak diakses oleh pihak yang salah. Memahami permission model Linux, setup secure access, dan validate data integrity dengan checksum.

---

# BAB 7: ENVIRONMENT MANAGEMENT

**Konsep inti:** kontrol lingkungan eksekusi

---

## 7.1 Environment variable

### Konsep: Environment Variable

**Environment variable** adalah key-value pairs yang tersedia untuk process dan child processes.

| Scope | Deskripsi | Set dengan | Akses |
|-------|-----------|------------|-------|
| **Shell variable** | Hanya di shell saat ini | `VAR=value` | `$VAR` |
| **Environment variable** | Di shell dan child processes | `export VAR=value` | `$VAR`, `printenv` |
| **Inheritance** | Child process inherit parent env | - | - |

**Common environment variables:**

| Variable | Fungsi | Contoh |
|----------|--------|--------|
| `PATH` | Lokasi executable | `/usr/bin:/usr/local/bin` |
| `HOME` | Home directory | `/home/username` |
| `USER` | Username | `dataeng` |
| `SHELL` | Shell saat ini | `/bin/bash` |
| `PWD` | Current directory | `/data/pipeline` |
| `LANG` | Locale settings | `en_US.UTF-8` |
| `TZ` | Timezone | `Asia/Jakarta` |

---

### export (set environment variable)

**How to use:**
```bash
export VAR=value
export VAR="value with space"
export VAR=$OTHER_VAR
export -p                    # List all exported variables
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-p` | Print | List all exported variables | Audit environment |
| `-n VAR` | Unexport | Remove variable dari environment | Cleanup variable |
| `-f` | Function | Export function | Share function ke child |

**Use case data engineering:** Set config untuk pipeline, pass credentials ke script, configure runtime behavior.

**Best practice:**
```bash
# BAD: Hard-coded
DB_HOST="localhost"

# GOOD: From environment
export DB_HOST="${DB_HOST:-localhost}"  # Default to localhost
```

---

### printenv (print environment variables)

**How to use:**
```bash
printenv                # Print all env vars
printenv PATH           # Print specific var
printenv PATH HOME      # Print multiple vars
```

**Use case data engineering:** Debug environment issues, verify config, audit environment state.

**Note:** `printenv VAR` sama dengan `echo $VAR`, tapi `printenv` lebih explicit untuk environment variable.

---

### env (print or run with environment)

**How to use:**
```bash
env                                    # Print all env vars
env VAR=value command                  # Run command dengan env tertentu
env -i command                         # Run dengan clean environment
env -u VAR command                     # Run tanpa VAR
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-i` | Ignore | Start dengan empty environment | Isolated execution |
| `-u VAR` | Unset | Unset VAR untuk command | Remove specific var |
| `-C dir` | Chdir | Change directory sebelum run | Run from specific dir |
| `-0` | Null separator | Null-separated output | Script-friendly |

**Use case data engineering:** Run script dengan config tertentu tanpa pollute shell environment, testing dengan different env.

**Common patterns:**
```bash
env DB_HOST=prod DB_PORT=5432 ./etl.sh    # Override env
env -i PATH=/usr/bin ./clean_env.sh       # Clean environment
```

---

### echo (print variable)

**How to use:**
```bash
echo $VAR
echo "$VAR"
echo "Value: $VAR"
echo ${VAR:-default}          # Default value
echo ${VAR:?error message}    # Error jika unset
```

**Variable expansion:**

| Syntax | Behavior | Use Case |
|--------|----------|----------|
| `$VAR` | Value atau empty | Basic expansion |
| `${VAR}` | Explicit boundary | `${VAR}_suffix` |
| `${VAR:-default}` | Default jika unset/empty | Fallback value |
| `${VAR:=default}` | Set default jika unset | Initialize variable |
| `${VAR:?error}` | Error jika unset | Validate required var |
| `${VAR:+value}` | Value jika set | Conditional value |

**Use case data engineering:** Debug variables, logging, validate environment, script output.

---

### unset (remove variable)

**How to use:**
```bash
unset VAR
unset VAR1 VAR2
unset -v VAR           # Unset variable
unset -f FUNC          # Unset function
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-v` | Variable | Unset variable (default) | Remove variable |
| `-f` | Function | Unset function | Remove function |

**Use case data engineering:** Cleanup environment, remove sensitive data dari memory, reset state.

**Best practice:** Unset sensitive variables (credentials) setelah digunakan.

---

## 7.2 Shell context

### source (execute script in current shell)

**How to use:**
```bash
source script.sh
source /path/to/config.sh
. script.sh                # Alias untuk source
```

**Behavior:**

| Aspect | `source script.sh` | `./script.sh` |
|--------|-------------------|---------------|
| **Execution** | Current shell | New subprocess |
| **Variables** | Affect current shell | Tidak affect parent |
| **cd** | Change dir di current shell | Tidak affect parent |
| **exit** | Exit current shell | Exit subprocess only |

**Use case data engineering:** Load config file, setup environment, initialize shell session, activate virtual env.

**Common patterns:**
```bash
source ~/.bashrc                    # Reload config
source config/database.env          # Load database config
source venv/bin/activate            # Activate Python venv
```

---

### . (alias untuk source)

**How to use:**
```bash
. script.sh
. /path/to/config.sh
```

**Use case data engineering:** Same as `source`, more POSIX-compatible.

**Note:** `.` lebih portable (POSIX), `source` lebih readable (Bash-specific).

---

## 7.3 Binary & command resolution

### which (locate command)

**How to use:**
```bash
which command
which -a command          # Show all matches
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-a` | All | Show all matches in PATH | Find all instances |

**Use case data engineering:** Verify which binary akan dijalankan, troubleshoot PATH issues, validate installation.

**Example:**
```bash
which python              # /usr/bin/python
which -a python           # /usr/bin/python, /usr/local/bin/python
```

---

### type (identify command type)

**How to use:**
```bash
type command
type -a command           # Show all types
type -t command           # Show type only
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-a` | All | Show all definitions | Find all types |
| `-t` | Type | Show type only (alias, file, builtin, function) | Script-friendly output |
| `-p` | Path | Show path for files | Get executable path |

**Command types:**

| Type | Deskripsi | Contoh |
|------|-----------|--------|
| **alias** | Alias command | `ll` → `ls -l` |
| **builtin** | Shell builtin | `cd`, `echo` |
| **file** | External executable | `/usr/bin/python` |
| **function** | Shell function | User-defined function |
| **keyword** | Shell keyword | `if`, `for` |

**Use case data engineering:** Understand command resolution, debug alias conflicts, verify command type.

---

### whereis (locate binary, source, manual)

**How to use:**
```bash
whereis command
whereis -b command        # Binary only
whereis -m command        # Manual only
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-b` | Binary | Search binaries only | Find executable |
| `-m` | Manual | Search manuals only | Find documentation |
| `-s` | Source | Search sources only | Find source code |

**Use case data engineering:** Find installation locations, locate documentation, comprehensive search.

**Note:** `whereis` search di standard locations, tidak terbatas di PATH.

---

## 7.4 Path management

### PATH (executable search path)

**Konsep:**
```
PATH adalah colon-separated list of directories tempat shell mencari executable.
```

**How to use:**
```bash
echo $PATH
# Output: /usr/local/bin:/usr/bin:/bin

# Add to PATH
export PATH="$PATH:/new/path"           # Append
export PATH="/new/path:$PATH"           # Prepend

# Set PATH
export PATH="/usr/bin:/bin"             # Replace
```

**Best practice:**

| Pattern | When | Why |
|---------|------|-----|
| Prepend | Custom tools | Higher priority |
| Append | Optional tools | Fallback |
| Replace | Strict control | Security, isolation |

**Use case data engineering:** Add custom scripts to PATH, setup tool directories, isolate execution environment.

**Common patterns:**
```bash
# Add project bin to PATH
export PATH="$HOME/project/bin:$PATH"

# Add multiple paths
export PATH="$PATH:/opt/app/bin:/opt/tools/bin"

# Persistent PATH (dalam ~/.bashrc)
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi
```

**Security note:** Jangan prepend `.` (current directory) ke PATH! Risiko: execute malicious script.

---

### Environment configuration strategy

**File loading order (Bash):**

| File | When | Purpose |
|------|------|----------|
| `/etc/profile` | Login shell | System-wide profile |
| `~/.bash_profile` | Login shell | User profile |
| `~/.bashrc` | Interactive non-login | Shell config |
| `~/.bash_logout` | Logout | Cleanup |

**Data engineering setup pattern:**

```bash
# ~/.bashrc atau project env file
# 1. Base paths
export PROJECT_ROOT="/data/pipeline"
export DATA_DIR="$PROJECT_ROOT/data"
export LOG_DIR="$PROJECT_ROOT/logs"

# 2. Tool paths
export PATH="$PROJECT_ROOT/bin:$PATH"

# 3. Config
export ENV="${ENV:-development}"
export DB_HOST="${DB_HOST:-localhost}"

# 4. Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# 5. Timezone
export TZ="Asia/Jakarta"
```

**Best practice:**
- Gunakan `${VAR:-default}` untuk fallback
- Validate required variables
- Separate secret dari code (use `.env` file, gitignore)
- Document expected variables

---

**Yang harus dikuasai:**

> Memastikan pipeline berjalan konsisten di environment berbeda. Memahami variable scope, PATH resolution, dan environment setup untuk reproducible execution.

---

# BAB 8: PROCESS & DATA-AWARE MONITORING

**Konsep inti:** observasi runtime dan aliran data

---

## 8.1 Process inspection

### ps (process status)

**How to use:**
```bash
ps [options]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `aux` | All users, user-oriented | Show all processes | Full process list |
| `-ef` | Everything, full | Show all processes (POSIX) | Full process tree |
| `-u user` | User | Show processes untuk user tertentu | Filter by user |
| `-p PID` | Process ID | Show specific PID | Check specific process |
| `--sort=-rss` | Sort | Sort by memory usage | Find memory hogs |
| `--sort=-cpu` | Sort | Sort by CPU usage | Find CPU intensive |
| `-o format` | Output | Custom output format | Custom columns |

**Common patterns:**
```bash
ps aux | grep python                    # Find Python processes
ps -ef | grep etl                       # Find ETL processes
ps aux --sort=-rss | head               # Top memory users
ps -eo pid,comm,%cpu,%mem,rss           # Custom format
```

**Use case data engineering:** Monitor ETL processes, find resource leaks, troubleshoot hung processes.

---

### top (real-time process monitor)

**How to use:**
```bash
top
top -u username           # Show user processes
top -p PID               # Monitor specific PID
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-d N` | Delay | Update every N seconds | Adjust refresh rate |
| `-n N` | Number | Run N iterations then exit | Batch mode |
| `-u user` | User | Show processes for user | Filter by user |
| `-p PID` | PID | Monitor specific PIDs | Track specific processes |
| `-b` | Batch | Batch mode (no input) | Script-friendly |

**Interactive commands:**

| Key | Fungsi | Use Case |
|-----|--------|----------|
| `k` | Kill process | Terminate process |
| `r` | Renice | Change priority |
| `M` | Sort by memory | Find memory issues |
| `P` | Sort by CPU | Find CPU issues |
| `1` | Show all CPUs | Per-CPU view |
| `c` | Command line | Full command |
| `q` | Quit | Exit top |

**Use case data engineering:** Monitor pipeline real-time, identify bottlenecks, watch resource consumption.

---

### htop (interactive process viewer)

**How to use:**
```bash
htop
htop -u username
```

**Features:**
- Color-coded output
- Mouse support
- Scrollable list
- Tree view
- Easier to use than `top`

**Interactive keys:**

| Key | Fungsi | Use Case |
|-----|--------|----------|
| `F3` | Search | Find process |
| `F4` | Filter | Filter by string |
| `F5` | Tree view | Process hierarchy |
| `F6` | Sort | Change sort |
| `F9` | Kill | Send signal |
| `F10` | Quit | Exit |
| `Space` | Tag | Tag process |

**Use case data engineering:** Better UX untuk monitoring, easier kill process, visual resource monitoring.

**Note:** `htop` mungkin perlu install (`apt install htop` / `yum install htop`).

---

### pgrep (find process by name)

**How to use:**
```bash
pgrep pattern
pgrep -u username pattern
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-l` | List | Show PID and name | Human-readable |
| `-u user` | User | Filter by user | User-specific processes |
| `-f` | Full | Match full command line | Match arguments |
| `-x` | Exact | Exact match | Precise match |
| `-n` | Newest | Show newest process | Latest instance |
| `-o` | Oldest | Show oldest process | Original instance |
| `-c` | Count | Count matches | Count processes |

**Use case data engineering:** Find process PID untuk monitoring, check if process running, scripting process management.

**Common patterns:**
```bash
pgrep -f "etl.py"                      # Find ETL script
pgrep -u dataeng python               # User's Python processes
if pgrep -x "process.sh" > /dev/null; then echo "Running"; fi
```

---

### pidof (find PID by name)

**How to use:**
```bash
pidof program_name
pidof python
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-s` | Single | Return only one PID | Get single instance |
| `-x` | Scripts | Also find scripts | Include shell scripts |

**Use case data engineering:** Quick PID lookup, check if daemon running, scripting.

**Note:** `pidof` cari by exact binary name, `pgrep` lebih flexible.

---

## 8.2 Process control

### kill (send signal to process)

**How to use:**
```bash
kill PID
kill -SIGNAL PID
kill -9 PID              # Force kill
kill -l                  # List signals
```

**Common signals:**

| Signal | Number | Nama | Behavior | Use Case |
|--------|--------|------|----------|----------|
| `SIGTERM` | 15 | Terminate | Graceful termination (default) | Normal stop |
| `SIGKILL` | 9 | Kill | Force kill (tidak bisa di-catch) | Force stop |
| `SIGHUP` | 1 | Hangup | Reload config | Reload without restart |
| `SIGINT` | 2 | Interrupt | Ctrl+C | User interrupt |
| `SIGSTOP` | 19 | Stop | Pause process | Temporarily pause |
| `SIGCONT` | 18 | Continue | Resume process | Resume paused |

**Use case data engineering:** Stop hung ETL, graceful shutdown pipeline, reload config without restart.

**Best practice:**
1. Try `kill PID` (SIGTERM) first -
graceful
2. Wait a few seconds
3. `kill -9 PID` (SIGKILL) jika masih tidak stop -
force

**Common patterns:**
```bash
kill $(pgrep -f etl.py)              # Kill ETL process
kill -HUP $(cat /var/run/app.pid)    # Reload config
kill -TERM $PID || kill -KILL $PID   # Graceful then force
```

---

### killall (kill by process name)

**How to use:**
```bash
killall process_name
killall -9 process_name
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-s SIGNAL` | Signal | Specify signal | Custom signal |
| `-u user` | User | Kill user's processes only | User-specific |
| `-i` | Interactive | Confirm before kill | Safety |
| `-v` | Verbose | Verbose output | Logging |
| `-w` | Wait | Wait until processes die | Synchronous |

**Use case data engineering:** Kill all instances of stuck process, cleanup hung workers.

**⚠️ WARNING:** `killall` akan kill ALL processes dengan nama itu. Hati-hati!

---

### pkill (kill by pattern)

**How to use:**
```bash
pkill pattern
pkill -f "script.py arg"
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-f` | Full | Match full command line | Match with arguments |
| `-u user` | User | Kill user's processes | User-specific |
| `-x` | Exact | Exact match | Precise match |
| `-SIGNAL` | Signal | Send specific signal | Custom signal |
| `-n` | Newest | Kill newest | Latest instance |
| `-o` | Oldest | Kill oldest | Original instance |

**Use case data engineering:** Kill processes by pattern, flexible process management.

**Common patterns:**
```bash
pkill -f "etl.py --env=dev"          # Kill dev ETL
pkill -u dataeng python              # Kill user's Python
pkill -9 -f "stuck_process"          # Force kill pattern
```

---

### nohup (run immune to hangup)

**How to use:**
```bash
nohup command &
nohup command > output.log 2>&1 &
```

**Behavior:**

| Aspect | Tanpa nohup | Dengan nohup |
|--------|-------------|-------------|
| **SIGHUP** | Process terminated | Process continues |
| **Output** | Terminal | `nohup.out` |
| **Background** | Must use `&` | Usually with `&` |
| **Logout** | Process dies | Process survives |

**Use case data engineering:** Long-running ETL, background jobs, processes yang survive logout.

**Best practice:**
```bash
nohup ./long_etl.sh > etl.log 2>&1 &
echo $! > etl.pid    # Save PID untuk kill nanti
```

---

### bg (background job)

**How to use:**
```bash
command
# Press Ctrl+Z (suspend)
bg                    # Resume in background
bg %1                 # Resume job 1 in background
```

**Use case data engineering:** Move long process ke background tanpa kill, continue shell usage.

---

### fg (foreground job)

**How to use:**
```bash
fg                    # Bring latest job to foreground
fg %1                 # Bring job 1 to foreground
```

**Use case data engineering:** Bring background process ke foreground untuk interact/monitor.

---

### jobs (list background jobs)

**How to use:**
```bash
jobs
jobs -l               # Show PID
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-l` | List | Show PID | Get process ID |
| `-p` | PID | Show PID only | Script-friendly |
| `-r` | Running | Show running jobs | Filter running |
| `-s` | Stopped | Show stopped jobs | Filter stopped |

**Job control:**

| Symbol | Status | Action |
|--------|--------|--------|
| `%1` | Job 1 | Reference job |
| `%+` | Current job | Latest job |
| `%-` | Previous job | Previous job |
| `%%` | Current job | Same as %+ |

**Use case data engineering:** Manage multiple background processes, monitor job status.

---

## 8.3 Resource monitoring

### free (memory usage)

**How to use:**
```bash
free
free -h               # Human-readable
free -s 5             # Update every 5 seconds
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-h` | Human | KB, MB, GB format | Human-readable |
| `-s N` | Seconds | Update every N seconds | Monitor over time |
| `-t` | Total | Show total | Include total row |
| `-w` | Wide | Wide mode | More details |

**Understanding output:**
```
              total        used        free      shared  buff/cache   available
Mem:           16GB         8GB         2GB       500MB         6GB         7GB
Swap:           8GB         1GB         7GB
```

| Column | Makna | Concern |
|--------|-------|----------|
| `used` | Used by processes | High = memory pressure |
| `free` | Truly free | Low is normal (cache uses free) |
| `available` | Available untuk start app baru | **This matters!** |
| `buff/cache` | Used for caching | Akan dirilis jika butuh |
| `Swap used` | Using swap | High = thrashing, slow |

**Use case data engineering:** Pre-check sebelum ETL besar, monitor memory leaks, capacity planning.

**Red flag:** `available` rendah + swap usage tinggi = memory pressure, slow processing.

---

### vmstat (virtual memory statistics)

**How to use:**
```bash
vmstat
vmstat 5              # Update every 5 seconds
vmstat 5 10           # 10 updates, every 5 seconds
```

**Output columns:**

| Column | Makna | Watch for |
|--------|-------|----------|
| `r` | Processes waiting for CPU | > CPU count = CPU bottleneck |
| `b` | Processes in uninterruptible sleep | High = I/O wait |
| `swpd` | Swap used | Increasing = memory pressure |
| `free` | Free memory | Decreasing trend |
| `si` | Swap in (from disk) | > 0 = swapping (bad!) |
| `so` | Swap out (to disk) | > 0 = swapping (bad!) |
| `bi` | Blocks in (read) | Disk read rate |
| `bo` | Blocks out (write) | Disk write rate |
| `wa` | I/O wait % | High = I/O bottleneck |

**Use case data engineering:** Diagnose performance issues, identify bottleneck (CPU vs I/O vs memory).

**Interpretation:**
- High `r`, low `wa` → CPU bottleneck
- High `b`, high `wa` → I/O bottleneck
- High `si`/`so` → Memory pressure (swapping)

---

### iostat (I/O statistics)

**How to use:**
```bash
iostat
iostat -x             # Extended statistics
iostat -x 5           # Update every 5 seconds
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-x` | Extended | Extended stats | Detailed I/O metrics |
| `-h` | Human | Human-readable | KB/MB/GB |
| `-d` | Disk | Disk stats only | Focus on disk |
| `-p` | Partition | Per-partition stats | Specific disk |

**Key metrics:**

| Metric | Makna | Red flag |
|--------|-------|----------|
| `%util` | Device utilization | > 80% = saturated |
| `await` | Average wait time | High = slow I/O |
| `r/s` | Reads per second | Workload pattern |
| `w/s` | Writes per second | Workload pattern |
| `rkB/s` | KB read per second | Read throughput |
| `wkB/s` | KB write per second | Write throughput |

**Use case data engineering:** Diagnose slow ETL, identify I/O bottleneck, monitor disk performance.

**Note:** May need install: `apt install sysstat` / `yum install sysstat`

---

### uptime (system uptime and load)

**How to use:**
```bash
uptime
```

**Output:**
```
14:23:45 up 10 days, 3:45, 2 users, load average: 2.5, 1.8, 1.2
         |          |       |        |
         |          |       |        └─ 1, 5, 15 minute load avg
         |          |       └─ users logged in
         |          └─ uptime
         └─ current time
```

**Load average interpretation:**

| Scenario | Load vs CPU count | Status |
|----------|-------------------|--------|
| 4 CPUs, load 2.0 | < CPU count | OK, system not busy |
| 4 CPUs, load 4.0 | = CPU count | Fully utilized |
| 4 CPUs, load 8.0 | > CPU count | Overloaded, queue building |

**Trend matters:**
- `0.5, 1.0, 2.0` → Load increasing (investigate)
- `2.0, 1.5, 1.0` → Load decreasing (recovering)
- `2.0, 2.0, 2.0` → Stable high load

**Use case data engineering:** Quick health check, assess system load, capacity planning.

---

## 8.4 Network & port usage

### lsof (list open files)

**How to use:**
```bash
lsof
lsof -u username
lsof -i :8080
lsof -p PID
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-u user` | User | Show user's open files | User-specific |
| `-i` | Internet | Network connections | Port usage |
| `-i :PORT` | Port | Connections on port | Who uses port |
| `-p PID` | PID | Files opened by PID | Process's files |
| `-t` | Tersoe | Output PID only | Script-friendly |
| `+D dir` | Directory | Files open in directory | Directory usage |

**Use case data engineering:** Find who uses port, diagnose "address already in use", check file locks, troubleshoot connection issues.

**Common patterns:**
```bash
lsof -i :5432                        # Who uses PostgreSQL port
lsof -u dataeng                      # User's open files
lsof +D /data                        # Who accessing /data
lsof -p $(pgrep python) | grep data  # Python's data files
```

---

### ss (socket statistics)

**How to use:**
```bash
ss
ss -tulpn            # TCP/UDP, listening, process, numeric
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-t` | TCP | TCP sockets | TCP connections |
| `-u` | UDP | UDP sockets | UDP connections |
| `-l` | Listening | Listening sockets | Open ports |
| `-p` | Process | Show process | Who listening |
| `-n` | Numeric | Don't resolve names | Fast, script-friendly |
| `-a` | All | All sockets | Full view |
| `-s` | Summary | Statistics summary | Quick overview |

**Use case data engineering:** Check open ports, verify service listening, troubleshoot network issues.

**Common patterns:**
```bash
ss -tulpn | grep :8080               # Check port 8080
ss -t state established              # Established TCP connections
ss -s                                # Connection summary
```

---

### netstat (network statistics)

**How to use:**
```bash
netstat -tulpn
netstat -an | grep :8080
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-t` | TCP | TCP connections | TCP sockets |
| `-u` | UDP | UDP connections | UDP sockets |
| `-l` | Listening | Listening ports | Open ports |
| `-p` | Program | Show program | Who listening |
| `-n` | Numeric | Numeric addresses | Fast output |
| `-a` | All | All connections | Full list |
| `-r` | Route | Routing table | Network routes |

**Use case data engineering:** Legacy alternative to `ss`, check network connections, verify ports.

**Note:** `ss` lebih modern dan faster dari `netstat`. Prefer `ss` jika available.

---

## 8.5 Data-oriented monitoring (konsep)

### Disk I/O Bottleneck

**Symptoms:**
- High `%util` di iostat (> 80%)
- High `await` (> 10ms for SSD, > 100ms for HDD)
- High `wa` (I/O wait) di vmstat/top
- Slow file operations

**Diagnosis:**
```bash
iostat -x 5                         # Watch %util dan await
lsof +D /data                       # Who accessing data
du -sh /data/* | sort -h            # Find large directories
```

**Solutions:**
- Optimize I/O patterns (batch reads/writes)
- Use faster disk (SSD vs HDD)
- Reduce I/O (compression, sampling)
- Parallelize across disks

---

### Pertumbuhan Ukuran Data

**Monitoring strategy:**
```bash
# Daily size check
du -sh /data >> size_log.txt
date >> size_log.txt

# Alert on threshold
SIZE=$(du -s /data | cut -f1)
if [ $SIZE -gt 100000000 ]; then
    echo "Data size exceeded 100GB" | mail -s "Alert" admin@example.com
fi
```

**Metrics to track:**
- Total size per directory
- Growth rate (bytes/day)
- File count growth
- Oldest files (candidates for archival)

**Use case:** Prevent disk full, plan capacity, trigger archival.

---

### Backpressure Sederhana

**Konsep:** Producer lebih cepat dari consumer → data accumulates.

**Detection:**
```bash
# Monitor staging file count
watch 'ls /data/staging | wc -l'

# Monitor queue size
watch 'ls /data/queue | wc -l'

# Alert jika backlog besar
COUNT=$(ls /data/staging | wc -l)
if [ $COUNT -gt 1000 ]; then
    echo "Backpressure detected: $COUNT files in staging"
fi
```

**Symptoms:**
- File count increasing di staging
- Disk usage growing
- Processing lag increasing

**Solutions:**
- Slow down producer
- Speed up consumer (parallelize)
- Add capacity
- Implement flow control

---

### Data Pipeline Observability

**Key metrics:**

| Metric | How to measure | Alert condition |
|--------|----------------|------------------|
| **Throughput** | Records/second | Dropping below SLA |
| **Latency** | End-to-end time | Exceeding target |
| **Error rate** | Errors/total | Above threshold |
| **Data size** | du, df | Disk > 80% |
| **File age** | find -mtime | Stale data |
| **Queue depth** | File count | Backlog building |

**Monitoring script pattern:**
```bash
#!/bin/bash
# pipeline_monitor.sh

# Timestamp
echo "[$(date)] Pipeline health check"

# Disk usage
DF=$(df /data | tail -1 | awk '{print $5}' | tr -d '%')
echo "Disk usage: ${DF}%"
[ $DF -gt 80 ] && echo "WARNING: Disk usage high"

# Staging backlog
STAGING=$(ls /data/staging | wc -l)
echo "Staging files: $STAGING"
[ $STAGING -gt 1000 ] && echo "WARNING: Backpressure detected"

# Latest file age
LATEST=$(find /data/staging -type f -printf '%T@\n' | sort -n | tail -1)
NOW=$(date +%s)
AGE=$((NOW -
${LATEST%.*}))
echo "Latest file age: ${AGE}s"
[ $AGE -gt 3600 ] && echo "WARNING: No new data for 1 hour"

# Process check
if ! pgrep -f "etl.py" > /dev/null; then
    echo "ERROR: ETL process not running"
fi
```

---

**Yang harus dikuasai:**

> Mampu mendeteksi *di mana data macet*, bukan hanya CPU/RAM. Understand process lifecycle, interpret resource metrics, dan monitor data flow untuk identify bottlenecks dalam pipeline.

---

# BAB 9: AUTOMATION & SCHEDULING

**Konsep inti:** eksekusi rutin & observabilitas

---

## 9.1 Scheduling

### Konsep: Cron

**Cron** adalah daemon untuk scheduled task execution. Setiap user punya crontab (cron table) sendiri.

**Cron vs manual execution:**

| Aspek | Manual | Cron |
|-------|--------|------|
| **Execution** | Manual trigger | Automatic scheduled |
| **Reliability** | Human error | Consistent |
| **Time** | Whenever run | Exact time |
| **Logging** | Manual | Automatic (mail/log) |
| **Scaling** | Not scalable | Scalable |

---

### crontab (edit cron jobs)

**How to use:**
```bash
crontab -e                # Edit your crontab
crontab -l                # List your crontab
crontab -r                # Remove your crontab
crontab -u user -e        # Edit user's crontab (root only)
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-e` | Edit | Edit crontab | Add/modify jobs |
| `-l` | List | List crontab | View scheduled jobs |
| `-r` | Remove | Remove all crontab entries | Clean slate |
| `-u user` | User | Specify user (root only) | Manage others' crontab |
| `-i` | Interactive | Prompt before remove | Safety |

**Crontab format:**
```
# ┌───────────── minute (0 -
59)
# │ ┌───────────── hour (0 -
23)
# │ │ ┌───────────── day of month (1 -
31)
# │ │ │ ┌───────────── month (1 -
12)
# │ │ │ │ ┌───────────── day of week (0 -
7) (Sunday=0 or 7)
# │ │ │ │ │
# * * * * * command
```

**Common patterns:**

| Pattern | Schedule | Use Case |
|---------|----------|----------|
| `0 0 * * *` | Daily at midnight | Daily ETL |
| `0 2 * * *` | Daily at 2 AM | Off-peak processing |
| `*/15 * * * *` | Every 15 minutes | Frequent ingestion |
| `0 */4 * * *` | Every 4 hours | Regular sync |
| `0 9 * * 1` | Monday 9 AM | Weekly report |
| `0 0 1 * *` | 1st of month | Monthly archival |
| `0 0 * * 0` | Sunday midnight | Weekly backup |
| `*/5 * * * *` | Every 5 minutes | Real-time-ish monitoring |
| `@reboot` | At system startup | Initialize services |
| `@daily` | Daily at midnight | Same as `0 0 * * *` |
| `@hourly` | Every hour | Same as `0 * * * *` |

**Special strings:**

| String | Equivalent | Use Case |
|--------|------------|----------|
| `@reboot` | At startup | Initialize pipeline |
| `@yearly` | `0 0 1 1 *` | Annual tasks |
| `@annually` | `0 0 1 1 *` | Same as @yearly |
| `@monthly` | `0 0 1 * *` | Monthly report |
| `@weekly` | `0 0 * * 0` | Weekly backup |
| `@daily` | `0 0 * * *` | Daily ETL |
| `@midnight` | `0 0 * * *` | Same as @daily |
| `@hourly` | `0 * * * *` | Hourly sync |

**Crontab examples:**
```bash
# Daily ETL at 2 AM
0 2 * * * /data/pipeline/daily_etl.sh >> /data/logs/etl.log 2>&1

# Every 15 minutes ingestion
*/15 * * * * /data/pipeline/ingest.sh

# Weekly backup on Sunday 3 AM
0 3 * * 0 /data/pipeline/backup.sh

# Monthly archival on 1st at midnight
0 0 1 * * /data/pipeline/archive.sh

# Startup initialization
@reboot /data/pipeline/init.sh

# Environment variables in crontab
PATH=/usr/local/bin:/usr/bin:/bin
SHELL=/bin/bash

0 2 * * * /data/pipeline/etl.sh
```

**Use case data engineering:** Schedule ETL jobs, automate backups, periodic cleanup, regular reports.

**Best practices:**
1. **Absolute paths:** Always use absolute paths
2. **Output redirection:** Redirect stdout/stderr to log file
3. **Environment:** Set PATH, SHELL explicitly
4. **Logging:** Always log with timestamps
5. **Idempotency:** Jobs should be safe to re-run
6. **Timeout:** Use `timeout` command for max runtime
7. **Locking:** Prevent concurrent runs (flock)

**Production crontab pattern:**
```bash
# Set environment
PATH=/usr/local/bin:/usr/bin:/bin
SHELL=/bin/bash
MAILTO=dataeng@example.com

# Daily ETL with timeout and locking
0 2 * * * flock -n /tmp/etl.lock timeout 2h /data/pipeline/etl.sh >> /data/logs/etl_$(date +\%Y\%m\%d).log 2>&1
```

---

### cron (daemon service)

**Cron directories (system-wide):**

| Directory | Schedule | Use Case |
|-----------|----------|----------|
| `/etc/cron.d/` | Custom schedule | System jobs with custom schedule |
| `/etc/cron.hourly/` | Hourly | Scripts run hourly |
| `/etc/cron.daily/` | Daily | Daily maintenance |
| `/etc/cron.weekly/` | Weekly | Weekly tasks |
| `/etc/cron.monthly/` | Monthly | Monthly tasks |

**Use case:** Drop executable scripts di directory ini untuk auto-schedule (no crontab edit needed).

---

### at (one-time scheduled task)

**How to use:**
```bash
at TIME
at> command
at> Ctrl+D

# or
echo "command" | at TIME
at -f script.sh TIME
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-f file` | File | Read commands from file | Schedule script |
| `-l` | List | List pending jobs | View queue |
| `-r job` | Remove | Remove job | Cancel scheduled |
| `-c job` | Cat | Show job content | Inspect job |
| `-q queue` | Queue | Specify queue (a-z) | Priority |

**Time formats:**

| Format | Example | Execution |
|--------|---------|----------|
| `HH:MM` | `at 14:30` | Today 14:30 (or tomorrow if passed) |
| `now + N units` | `at now + 2 hours` | 2 hours from now |
| `midnight` | `at midnight` | Next midnight |
| `noon` | `at noon` | Next noon |
| `teatime` | `at teatime` | 16:00 |
| `tomorrow` | `at tomorrow` | Tomorrow same time |
| `MMDDYY` | `at 123123` | Dec 31, 2023 |

**Common patterns:**
```bash
# Run in 1 hour
echo "/data/pipeline/process.sh" | at now + 1 hour

# Run tomorrow at 2 AM
at 02:00 tomorrow -f /data/pipeline/etl.sh

# Run at specific time
at 14:30 <<EOF
cd /data\n./cleanup.sh\nEOF

# List at jobs
at -l
atq          # Same as at -l

# Remove job
at -r 5
atrm 5       # Same as at -r
```

**Use case data engineering:** One-time data processing, ad-hoc tasks, delayed execution, emergency jobs.

**Note:** `at` daemon (atd) harus running: `systemctl start atd`

---

### batch (run when system load low)

**How to use:**
```bash
batch
batch> command
batch> Ctrl+D
```

**Behavior:**-
Execute ketika system load average turun di bawah threshold (default 1.5)-
Same syntax dengan `at`-
Automatically queue sampai system idle enough

**Use case data engineering:** Resource-intensive non-urgent tasks, background processing, low-priority jobs.

**Example:**
```bash
echo "/data/pipeline/heavy_processing.sh" | batch
```

---

## 9.2 Service management

### systemctl (control systemd services)

**How to use:**
```bash
systemctl COMMAND SERVICE\nsystemctl status nginx\nsystemctl start myservice
```

**Common commands:**

| Command | Fungsi | Use Case Data Engineering |
|---------|--------|---------------------------|
| `start SERVICE` | Start service | Start data service |
| `stop SERVICE` | Stop service | Stop service |
| `restart SERVICE` | Restart service | Apply config changes |
| `reload SERVICE` | Reload config | Reload tanpa downtime |
| `status SERVICE` | Show status | Check service health |
| `enable SERVICE` | Enable auto-start | Start on boot |
| `disable SERVICE` | Disable auto-start | Prevent auto-start |
| `is-active SERVICE` | Check if running | Script check |
| `is-enabled SERVICE` | Check if enabled | Verify auto-start |
| `list-units --type=service` | List all services | Service inventory |
| `daemon-reload` | Reload systemd | After unit file changes |

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `--user` | User | User services | Per-user daemons |
| `--now` | Now | Enable and start immediately | Quick enable+start |
| `-a` | All | Show all units | Complete list |
| `-l` | Full | Don't truncate output | Full output |
| `--failed` | Failed | Show failed units | Troubleshooting |

**Use case data engineering:** Manage data services (databases, message queues), control pipeline daemons, ensure services start on boot.

**Create custom service:**
```bash
# /etc/systemd/system/etl-pipeline.service
[Unit]
Description=ETL Pipeline Service
After=network.target

[Service]
Type=simple
User=dataeng
WorkingDirectory=/data/pipeline
ExecStart=/data/pipeline/daemon.sh
Restart=on-failure
RestartSec=10
StandardOutput=append:/var/log/etl/output.log
StandardError=append:/var/log/etl/error.log

[Install]
WantedBy=multi-user.target
```

**Enable and start:**
```bash
sudo systemctl daemon-reload\nsudo systemctl enable --now etl-pipeline\nsudo systemctl status etl-pipeline
```

---

## 9.3 Logging sistem

### journalctl (query systemd journal)

**How to use:**
```bash
journalctl [options]
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-u SERVICE` | Unit | Show logs for service | Service-specific logs |
| `-f` | Follow | Follow logs real-time | Live monitoring |
| `-n N` | Lines | Show last N lines | Recent logs |
| `--since TIME` | Since | Logs since time | Time range |
| `--until TIME` | Until | Logs until time | Time range |
| `-p PRIORITY` | Priority | Filter by priority | Error/warning only |
| `-b` | Boot | Logs from current boot | Current session |
| `-k` | Kernel | Kernel messages | Kernel issues |
| `--no-pager` | No pager | Direct output | Pipe-friendly |
| `-o format` | Output | Format output | JSON, etc |

**Priority levels:**

| Level | Numeric | Use Case |
|-------|---------|----------|
| `emerg` | 0 | System unusable |
| `alert` | 1 | Action required |
| `crit` | 2 | Critical |
| `err` | 3 | Error conditions |
| `warning` | 4 | Warning |
| `notice` | 5 | Normal but significant |
| `info` | 6 | Informational |
| `debug` | 7 | Debug messages |

**Common patterns:**
```bash
# Follow service logs
journalctl -u etl-pipeline -f

# Last 100 lines
journalctl -u nginx -n 100

# Today's logs
journalctl --since today

# Last hour
journalctl --since "1 hour ago"

# Date range
journalctl --since "2024-01-01" --until "2024-01-31"

# Errors only
journalctl -p err

# JSON output
journalctl -u myservice -o json

# Specific boot
journalctl -b -1     # Previous boot
```

**Use case data engineering:** Monitor service logs, troubleshoot service failures, audit system activity, debug pipeline issues.

---

### dmesg (kernel ring buffer)

**How to use:**
```bash
dmesg
dmesg -T              # Human-readable timestamps
dmesg -w              # Follow mode
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-T` | Timestamps | Human-readable timestamps | Readable time |
| `-w` | Follow | Follow mode (like tail -f) | Live monitoring |
| `-H` | Human | Human-readable format | Better formatting |
| `-l LEVEL` | Level | Filter by level | Errors only |
| `-f FACILITY` | Facility | Filter by facility | Specific subsystem |
| `-c` | Clear | Clear ring buffer | Clean buffer |

**Use case data engineering:** Diagnose hardware issues, disk errors, network problems, kernel-level troubleshooting.

**Common patterns:**
```bash
# Disk errors
dmesg | grep -i "error\\|fail"

# USB device detection
dmesg | grep -i usb

# Network interface
dmesg | grep eth0

# Out of memory
dmesg | grep -i "out of memory"
```

---

### logger (log to syslog)

**How to use:**
```bash
logger "message"
logger -t TAG "message"
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-t TAG` | Tag | Add tag to message | Identify source |
| `-p PRIORITY` | Priority | Set priority (facility.level) | Categorize message |
| `-s` | Stderr | Also output to stderr | Echo to terminal |
| `-f FILE` | File | Log file content | Log file to syslog |

**Priority format:** `facility.level`

**Facilities:** `user`, `local0`-`local7`, `daemon`, `auth`, etc.
**Levels:** `emerg`, `alert`, `crit`, `err`, `warning`, `notice`, `info`, `debug`

**Common patterns:**
```bash
# Simple log
logger "ETL job completed"

# With tag
logger -t ETL "Processing started"

# With priority
logger -p user.error -t ETL "Processing failed"

# Log file content
logger -t ETL -f /data/logs/summary.txt

# In script
logger -t ETL "Daily ETL started at $(date)"
./etl.sh
if [ $? -eq 0 ]; then
    logger -p user.info -t ETL "ETL completed successfully"
else
    logger -p user.err -t ETL "ETL failed"
fi
```

**Use case data engineering:** Centralized logging dari scripts, integrate dengan syslog, standardize logging, audit trail.

---

## 9.4 Time & date

### date (print/set system date & time)

**How to use:**
```bash
date
date "+FORMAT"
date -d "STRING"
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `+FORMAT` | Format | Custom output format | Timestamps, filenames |
| `-d STRING` | Date | Parse date string | Date arithmetic |
| `-u` | UTC | Show UTC time | Timezone-neutral |
| `-R` | RFC 2822 | RFC format | Standard format |
| `-I` | ISO 8601 | ISO format | ISO standard |
| `--date=STRING` | Date | Same as -d | Date calculation |

**Format codes:**

| Code | Output | Example |
|------|--------|----------|
| `%Y` | Year (4 digit) | 2024 |
| `%y` | Year (2 digit) | 24 |
| `%m` | Month (01-12) | 01 |
| `%d` | Day (01-31) | 15 |
| `%H` | Hour (00-23) | 14 |
| `%M` | Minute (00-59) | 30 |
| `%S` | Second (00-59) | 45 |
| `%s` | Unix timestamp | 1704124800 |
| `%F` | Full date (YYYY-MM-DD) | 2024-01-15 |
| `%T` | Full time (HH:MM:SS) | 14:30:45 |
| `%Y%m%d` | Compact date | 20240115 |
| `%Y%m%d_%H%M%S` | Timestamp | 20240115_143045 |

**Common patterns:**
```bash
# Timestamp untuk filename
date "+%Y%m%d_%H%M%S"
# Output: 20240115_143045

# ISO format
date -I
# Output: 2024-01-15

# Full ISO timestamp
date -Iseconds
# Output: 2024-01-15T14:30:45+07:00

# Unix timestamp
date +%s
# Output: 1704124800

# Date arithmetic
date -d "yesterday"
date -d "tomorrow"
date -d "next monday"
date -d "7 days ago"
date -d "2 hours ago"
date -d "@1704124800"      # Unix timestamp to date

# Log filename dengan date
LOG="/data/logs/etl_$(date +%Y%m%d).log"

# Data partition path
PARTITION="/data/year=$(date +%Y)/month=$(date +%m)/day=$(date +%d)"

# Age calculation
FILE_DATE=$(stat -c %Y file.txt)
NOW=$(date +%s)
AGE=$((NOW -
FILE_DATE))
echo "File age: $AGE seconds"
```

**Use case data engineering:** Timestamp logs, dated filenames, partitioning by date, age calculation, scheduling logic.

---

### timedatectl (control system time)

**How to use:**
```bash
timedatectl
timedatectl status
timedatectl set-timezone TIMEZONE
```

**Commands:**

| Command | Fungsi | Use Case |
|---------|--------|----------|
| `status` | Show time settings | Current config |
| `set-time TIME` | Set system time | Manual time set |
| `set-timezone TZ` | Set timezone | Change timezone |
| `list-timezones` | List available timezones | Find timezone |
| `set-ntp BOOL` | Enable/disable NTP | Auto time sync |

**Common patterns:**
```bash
# Show status
timedatectl status

# Set timezone
sudo timedatectl set-timezone Asia/Jakarta

# List timezones
timedatectl list-timezones | grep Asia

# Enable NTP
sudo timedatectl set-ntp true

# Set time (NTP disabled)
sudo timedatectl set-ntp false
sudo timedatectl set-time "2024-01-15 14:30:00"
```

**Use case data engineering:** Ensure correct timezone untuk data timestamps, synchronize time across servers, validate time settings.

**Best practice:**-
Use NTP untuk time sync-
Use UTC di servers, convert di application layer-
Validate timezone di pipeline startup-
Store timestamps in UTC or with timezone info

---

### Time & Timezone Best Practices

**Data Engineering time handling:**

| Scenario | Strategy | Implementation |
|----------|----------|----------------|
| **Data storage** | Store in UTC | `date -u` |
| **Log timestamps** | ISO 8601 with TZ | `date -Iseconds` |
| **Filenames** | UTC or local | `date -u +%Y%m%d` |
| **Processing** | Explicit timezone | `TZ=UTC date` |
| **Comparison** | Unix timestamp | `date +%s` |

**Script time handling pattern:**
```bash
#!/bin/bash
set -euo pipefail

# Explicit UTC
export TZ=UTC

# Timestamp logging
log() {
    echo "[$(date -Iseconds)] $*"
}

log "ETL started"

# Dated output file
OUTPUT="/data/processed/data_$(date +%Y%m%d).csv"

# Process with timeout
log "Processing..."
timeout 1h ./process.sh > "$OUTPUT"

log "ETL completed"

# Timestamp validation
FILE_AGE=$(( $(date +%s) -
$(stat -c %Y "$OUTPUT") ))
if [ $FILE_AGE -lt 300 ]; then
    log "Output file fresh (${FILE_AGE}s old)"
else
    log "WARNING: Output file stale"
fi
```

---

**Yang harus dikuasai:**

> Mampu menjalankan pipeline secara otomatis dan terlacak. Memahami cron scheduling, service management, centralized logging, dan time handling untuk production data pipelines.

---

# BAB 10: SHELL SCRIPTING UNTUK DATA PIPELINE

**Konsep inti:** glue logic & kontrol alur

---

## 10.1 Bash basics

### bash (Bourne Again Shell)

**Bash** adalah shell yang paling umum di Linux. Script bash adalah file text dengan perintah yang dieksekusi secara berurutan.

**Shebang:** `#!/bin/bash` - baris pertama script yang menentukan interpreter.

**Basic script structure:**
```bash
#!/bin/bash
# Script: etl_daily.sh
# Purpose: Daily ETL pipeline

# Script content here
echo "Pipeline started"
```

**Run script:**
```bash
chmod +x script.sh    # Make executable
./script.sh           # Run script
bash script.sh        # Explicit bash
```

**Best practice:**
- Always use shebang
- Add comments for purpose
- Use meaningful filenames
- Make scripts executable

---

### sh vs bash

**Comparison:**

| Aspect | sh (POSIX) | bash |
|--------|------------|------|
| **Compatibility** | Universal | Linux/macOS |
| **Features** | Basic | Extended |
| **Arrays** | No | Yes |
| **[[ ]]** | No | Yes |
| **Process substitution** | No | Yes |

**For data engineering:** Use `#!/bin/bash` untuk features, use `#!/bin/sh` untuk portability.

---

## 10.2 Variables & expansion

### Variable assignment

**How to use:**
```bash
VAR="value"              # No spaces around =
VAR=$(command)           # Command substitution
VAR=$((1 + 2))          # Arithmetic
```

**Rules:**
- No spaces around `=`
- Variable names: letters, numbers, underscore
- Convention: UPPERCASE for environment, lowercase for local

**Common patterns:**
```bash
# Configuration
DATA_DIR="/data"
LOG_FILE="/var/log/etl.log"
DATE=$(date +%Y%m%d)

# File paths
INPUT="${DATA_DIR}/input_${DATE}.csv"
OUTPUT="${DATA_DIR}/output_${DATE}.csv"
```

---

### Variable expansion

**Syntax:**

| Syntax | Use Case | Example |
|--------|----------|---------|
| `$VAR` | Simple expansion | `echo $PATH` |
| `${VAR}` | Explicit boundary | `${FILE}_backup` |
| `"$VAR"` | Preserve spaces | `"$FILENAME"` |
| `'$VAR'` | Literal (no expansion) | `echo '$HOME'` |

**Command substitution:**
```bash
# Modern: $()
FILES=$(ls *.csv)
COUNT=$(wc -l < file.txt)

# Old: backticks (avoid)
FILES=`ls *.csv`
```

**Arithmetic expansion:**
```bash
COUNT=$((COUNT + 1))
TOTAL=$((ROWS * COLS))
PERCENT=$((SUCCESS * 100 / TOTAL))
```

**Use case data engineering:**
```bash
#!/bin/bash
# ETL with date-based paths

DATE=$(date +%Y%m%d)
INPUT="/data/raw/${DATE}/data.csv"
OUTPUT="/data/processed/${DATE}/result.csv"

# Count lines
LINES=$(wc -l < "$INPUT")
echo "Processing $LINES records"

# Calculate progress
PROCESSED=$((LINES * 100 / TOTAL))
echo "Progress: ${PROCESSED}%"
```

---

### Quoting rules

**Quote types:**

| Type | Behavior | Use Case |
|------|----------|----------|
| `""` | Expands variables | Most common |
| `''` | Literal text | No expansion needed |
| No quotes | Word splitting | Avoid for variables |

**Examples:**
```bash
FILE="data file.csv"      # Has space

echo $FILE                # Wrong: splits into 2 words
echo "$FILE"              # Correct: preserves space
echo '$FILE'              # Literal: prints $FILE

# Best practice
rm "$FILE"                # Always quote variables
cp "$SOURCE" "$DEST"      # Prevents word splitting
```

---

## 10.3 Control flow

### if statement

**How to use:**
```bash
if CONDITION; then
    # commands
elif OTHER_CONDITION; then
    # commands
else
    # commands
fi
```

**Common patterns:**
```bash
# File check
if [ -f "$FILE" ]; then
    echo "File exists"
fi

# Exit code check
if grep "ERROR" "$LOG"; then
    echo "Errors found"
fi

# Multiple conditions
if [ -f "$FILE" ] && [ -r "$FILE" ]; then
    echo "File exists and readable"
fi

# Numeric comparison
if [ $COUNT -gt 0 ]; then
    echo "Records found: $COUNT"
fi
```

**Use case data engineering:**
```bash
#!/bin/bash
INPUT="$1"

if [ ! -f "$INPUT" ]; then
    echo "ERROR: Input file not found: $INPUT"
    exit 1
fi

if [ ! -r "$INPUT" ]; then
    echo "ERROR: Input file not readable"
    exit 1
fi

LINES=$(wc -l < "$INPUT")
if [ $LINES -eq 0 ]; then
    echo "WARNING: Empty file"
    exit 0
fi

echo "Processing $LINES records"
```

---

### case statement

**How to use:**
```bash
case "$VAR" in
    pattern1)
        # commands
        ;;
    pattern2)
        # commands
        ;;
    *)
        # default
        ;;
esac
```

**Common patterns:**
```bash
# File extension
case "$FILE" in
    *.csv)
        echo "CSV file"
        ;;
    *.json)
        echo "JSON file"
        ;;
    *)
        echo "Unknown format"
        ;;
esac

# Environment
case "$ENV" in
    prod|production)
        DATA_DIR="/data/prod"
        ;;
    dev|development)
        DATA_DIR="/data/dev"
        ;;
    *)
        echo "ERROR: Unknown environment: $ENV"
        exit 1
        ;;
esac
```

---

### Loops

#### for loop

**How to use:**
```bash
for VAR in LIST; do
    # commands
done
```

**Common patterns:**
```bash
# File iteration
for FILE in /data/*.csv; do
    echo "Processing $FILE"
    ./process.sh "$FILE"
done

# Number range
for i in {1..10}; do
    echo "Iteration $i"
done

# Array iteration
FILES=(file1.csv file2.csv file3.csv)
for FILE in "${FILES[@]}"; do
    echo "$FILE"
done

# Command output
for USER in $(cat users.txt); do
    echo "User: $USER"
done
```

---

#### while loop

**How to use:**
```bash
while CONDITION; do
    # commands
done
```

**Common patterns:**
```bash
# Read file line by line
while IFS= read -r LINE; do
    echo "Line: $LINE"
done < file.txt

# Counter
COUNT=0
while [ $COUNT -lt 10 ]; do
    echo "Count: $COUNT"
    COUNT=$((COUNT + 1))
done

# Wait for file
while [ ! -f /data/ready.flag ]; do
    echo "Waiting for ready flag..."
    sleep 5
done
```

---

#### until loop

**How to use:**
```bash
until CONDITION; do
    # commands (run while condition is FALSE)
done
```

**Example:**
```bash
# Wait until file appears
until [ -f /data/complete.flag ]; do
    echo "Waiting..."
    sleep 10
done
```

---

#### Loop control

**Commands:**

| Command | Function | Use Case |
|---------|----------|----------|
| `break` | Exit loop | Stop processing |
| `continue` | Skip to next iteration | Skip invalid data |

**Examples:**
```bash
# break
for FILE in /data/*.csv; do
    if [ ! -r "$FILE" ]; then
        echo "ERROR: Cannot read $FILE"
        break
    fi
    echo "Processing $FILE"
done

# continue
for FILE in /data/*.csv; do
    if [ ! -r "$FILE" ]; then
        echo "WARNING: Skipping $FILE"
        continue
    fi
    echo "Processing $FILE"
done
```

---

## 10.4 Test & comparison

### Test operators

**File tests:**

| Operator | Test | Example |
|----------|------|---------|
| `-f FILE` | Regular file exists | `[ -f data.csv ]` |
| `-d DIR` | Directory exists | `[ -d /data ]` |
| `-e PATH` | Path exists | `[ -e /tmp/flag ]` |
| `-r FILE` | Readable | `[ -r config.txt ]` |
| `-w FILE` | Writable | `[ -w output.csv ]` |
| `-x FILE` | Executable | `[ -x script.sh ]` |
| `-s FILE` | Non-empty file | `[ -s data.csv ]` |

**String tests:**

| Operator | Test | Example |
|----------|------|---------|
| `-z STR` | Empty string | `[ -z "$VAR" ]` |
| `-n STR` | Non-empty string | `[ -n "$VAR" ]` |
| `STR1 = STR2` | Equal | `[ "$A" = "$B" ]` |
| `STR1 != STR2` | Not equal | `[ "$A" != "$B" ]` |

**Numeric comparison:**

| Operator | Test | Example |
|----------|------|---------|
| `-eq` | Equal | `[ $A -eq $B ]` |
| `-ne` | Not equal | `[ $A -ne $B ]` |
| `-lt` | Less than | `[ $A -lt 100 ]` |
| `-le` | Less or equal | `[ $A -le 100 ]` |
| `-gt` | Greater than | `[ $A -gt 0 ]` |
| `-ge` | Greater or equal | `[ $A -ge 0 ]` |

---

### [ ] vs [[ ]]

**Comparison:**

| Feature | `[ ]` | `[[ ]]` |
|---------|-------|---------|
| **Type** | Command | Bash keyword |
| **Portability** | POSIX (sh) | Bash only |
| **Pattern matching** | No | Yes |
| **Regex** | No | Yes |
| **&& and \|\|** | Outside only | Inside allowed |
| **Word splitting** | Yes (need quotes) | No (safer) |

**Examples:**
```bash
# [ ] requires quotes
[ -f "$FILE" ]

# [[ ]] doesn't require quotes (but still good practice)
[[ -f $FILE ]]

# Pattern matching (bash only)
[[ $FILE == *.csv ]]

# Regex (bash only)
[[ $EMAIL =~ ^[a-z]+@[a-z]+\.[a-z]+$ ]]

# Multiple conditions (bash only)
[[ -f $FILE && -r $FILE ]]
```

**For data engineering:** Use `[[ ]]` in bash scripts for safety and features.

---

### Common test patterns

```bash
# Validate input file
if [[ ! -f "$INPUT" ]]; then
    echo "ERROR: Input not found"
    exit 1
fi

# Check file size
if [[ ! -s "$INPUT" ]]; then
    echo "WARNING: Empty input file"
fi

# Validate number
if [[ ! "$COUNT" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Not a number: $COUNT"
    exit 1
fi

# Check required variable
if [[ -z "$DATA_DIR" ]]; then
    echo "ERROR: DATA_DIR not set"
    exit 1
fi

# File extension check
if [[ "$FILE" == *.csv ]]; then
    echo "CSV file"
elif [[ "$FILE" == *.json ]]; then
    echo "JSON file"
else
    echo "ERROR: Unsupported format"
    exit 1
fi
```

---

## 10.5 Functions

### Function definition

**How to use:**
```bash
# Style 1
function name {
    # commands
}

# Style 2 (preferred)
name() {
    # commands
}
```

**Function with return:**
```bash
is_valid_file() {
    local FILE="$1"
    
    if [[ ! -f "$FILE" ]]; then
        return 1
    fi
    
    if [[ ! -r "$FILE" ]]; then
        return 1
    fi
    
    return 0
}

# Usage
if is_valid_file "$INPUT"; then
    echo "File is valid"
fi
```

---

### Function patterns for data engineering

**Logging function:**
```bash
log() {
    echo "[$(date -Iseconds)] $*"
}

log_error() {
    echo "[$(date -Iseconds)] ERROR: $*" >&2
}

# Usage
log "Pipeline started"
log_error "Failed to process file"
```

**Validation function:**
```bash
validate_csv() {
    local FILE="$1"
    local MIN_COLS="$2"
    
    if [[ ! -f "$FILE" ]]; then
        log_error "File not found: $FILE"
        return 1
    fi
    
    local COLS=$(head -1 "$FILE" | awk -F',' '{print NF}')
    if [[ $COLS -lt $MIN_COLS ]]; then
        log_error "Expected $MIN_COLS columns, got $COLS"
        return 1
    fi
    
    log "File valid: $FILE ($COLS columns)"
    return 0
}
```

**Cleanup function:**
```bash
cleanup() {
    log "Cleaning up temporary files"
    rm -rf "$TEMP_DIR"
}

# Register cleanup on exit
trap cleanup EXIT
```

---

## 10.6 Arguments & exit codes

### Positional parameters

**Special variables:**

| Variable | Meaning | Example |
|----------|---------|---------|
| `$0` | Script name | `my_script.sh` |
| `$1, $2, ...` | Positional args | First, second arg |
| `$#` | Argument count | Number of args |
| `$@` | All arguments (array) | Proper iteration |
| `$*` | All arguments (string) | Single string |
| `$?` | Exit status of last command | 0 = success |

**Usage:**
```bash
#!/bin/bash
# script.sh INPUT OUTPUT

INPUT="$1"
OUTPUT="$2"

if [ $# -ne 2 ]; then
    echo "Usage: $0 INPUT OUTPUT"
    exit 1
fi

echo "Processing $INPUT -> $OUTPUT"
```

---

### shift command

**How to use:**
```bash
shift       # Remove $1, shift all args left
shift N     # Remove first N args
```

**Example:**
```bash
#!/bin/bash
# process_files.sh file1 file2 file3 ...

while [ $# -gt 0 ]; do
    FILE="$1"
    echo "Processing $FILE"
    ./process.sh "$FILE"
    shift
done
```

---

### Exit codes

**Convention:**

| Code | Meaning | Use Case |
|------|---------|----------|
| `0` | Success | Everything OK |
| `1` | General error | Generic failure |
| `2` | Misuse | Wrong arguments |
| `3-125` | Custom | Specific errors |
| `126` | Cannot execute | Permission denied |
| `127` | Command not found | Missing command |
| `128+N` | Signal N | Killed by signal |

**Usage:**
```bash
#!/bin/bash
set -e

# Explicit exit
if [ ! -f "$INPUT" ]; then
    echo "ERROR: Input not found"
    exit 1
fi

# Check last command
grep "ERROR" log.txt
if [ $? -ne 0 ]; then
    echo "No errors found (good)"
fi

# Success
exit 0
```

---

### Argument parsing pattern

```bash
#!/bin/bash
# etl.sh --input FILE --output FILE [--verbose]

INPUT=""
OUTPUT=""
VERBOSE=0

while [ $# -gt 0 ]; do
    case "$1" in
        --input)
            INPUT="$2"
            shift 2
            ;;
        --output)
            OUTPUT="$2"
            shift 2
            ;;
        --verbose)
            VERBOSE=1
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 2
            ;;
    esac
done

if [[ -z "$INPUT" ]] || [[ -z "$OUTPUT" ]]; then
    echo "Usage: $0 --input FILE --output FILE [--verbose]"
    exit 2
fi

[[ $VERBOSE -eq 1 ]] && echo "Verbose mode ON"
echo "Processing $INPUT -> $OUTPUT"
```

---

## 10.7 Robust shell behavior

### set options for safety

**Critical options:**

| Option | Effect | Use Case |
|--------|--------|----------|
| `set -e` | Exit on error | Stop on first failure |
| `set -u` | Exit on undefined variable | Catch typos |
| `set -o pipefail` | Pipe fails if any command fails | Catch pipeline errors |
| `set -x` | Print commands | Debugging |

**Usage:**
```bash
#!/bin/bash
set -euo pipefail

# Script will exit immediately on any error
# Catches undefined variables
# Pipeline failures propagate
```

**Example with set -e:**
```bash
#!/bin/bash
set -e

# If this fails, script exits immediately
wget http://example.com/data.csv

# This won't run if wget failed
./process.sh data.csv
```

---

### trap command

**How to use:**
```bash
trap COMMAND SIGNAL
trap - SIGNAL    # Remove trap
```

**Common signals:**

| Signal | Meaning | Use Case |
|--------|---------|----------|
| `EXIT` | Script exit | Cleanup |
| `INT` | Ctrl+C | User interrupt |
| `TERM` | Kill signal | Graceful shutdown |
| `ERR` | Command error | Error handling |

**Cleanup pattern:**
```bash
#!/bin/bash
set -euo pipefail

TEMP_DIR=$(mktemp -d)

cleanup() {
    echo "Cleaning up..."
    rm -rf "$TEMP_DIR"
}

trap cleanup EXIT

# Do work
echo "Working in $TEMP_DIR"
# ... processing ...

# cleanup() runs automatically on exit
```

**Error handling pattern:**
```bash
#!/bin/bash
set -euo pipefail

error_handler() {
    echo "ERROR at line $1"
    echo "Command: $2"
    exit 1
}

trap 'error_handler $LINENO "$BASH_COMMAND"' ERR

# Any error triggers error_handler
```

---

## 10.8 Input/Output in scripts

### read command

**How to use:**
```bash
read VAR              # Read one line
read -r VAR           # Raw (don't escape \)
read -p "Prompt: " VAR  # With prompt
```

**Common patterns:**
```bash
# Read file line by line
while IFS= read -r LINE; do
    echo "Processing: $LINE"
done < input.txt

# Read CSV
while IFS=, read -r COL1 COL2 COL3; do
    echo "Name: $COL1, Age: $COL2"
done < data.csv

# Skip header
{
    read  # Skip first line
    while IFS=, read -r COL1 COL2; do
        echo "$COL1: $COL2"
    done
} < data.csv
```

---

### echo vs printf

**Comparison:**

| Feature | echo | printf |
|---------|------|--------|
| **Portability** | Varies | Standard |
| **Formatting** | No | Yes |
| **Newline** | Automatic | Manual |
| **Use case** | Simple output | Formatted output |

**Examples:**
```bash
# echo
echo "Simple message"
echo -n "No newline"
echo -e "With\ttab"

# printf (better control)
printf "Name: %s\n" "$NAME"
printf "Count: %d\n" "$COUNT"
printf "%-10s %5d\n" "$NAME" "$COUNT"
```

---

## 10.9 Arrays

### Array basics

**Declaration:**
```bash
# Empty array
ARRAY=()

# With values
ARRAY=(value1 value2 value3)

# From command
FILES=($(ls *.csv))
```

**Access:**
```bash
# Single element
echo "${ARRAY[0]}"    # First element
echo "${ARRAY[2]}"    # Third element

# All elements
echo "${ARRAY[@]}"    # All (properly quoted)
echo "${ARRAY[*]}"    # All (single string)

# Array length
echo "${#ARRAY[@]}"
```

**Iteration:**
```bash
FILES=(file1.csv file2.csv file3.csv)

for FILE in "${FILES[@]}"; do
    echo "Processing $FILE"
done
```

---

### Array operations

**Add elements:**
```bash
ARRAY+=(new_element)
ARRAY+=("element 1" "element 2")
```

**Slice:**
```bash
# Elements from index 1, length 3
echo "${ARRAY[@]:1:3}"
```

**Use case data engineering:**
```bash
#!/bin/bash
# Process multiple input files

INPUTS=("$@")

if [ ${#INPUTS[@]} -eq 0 ]; then
    echo "Usage: $0 FILE [FILE...]"
    exit 1
fi

FAILED=()

for INPUT in "${INPUTS[@]}"; do
    echo "Processing $INPUT"
    if ! ./process.sh "$INPUT"; then
        FAILED+=("$INPUT")
    fi
done

if [ ${#FAILED[@]} -gt 0 ]; then
    echo "Failed files:"
    printf "  %s\n" "${FAILED[@]}"
    exit 1
fi
```

---

## 10.10 String manipulation

### String operations

**Length:**
```bash
STR="hello"
echo "${#STR}"     # Output: 5
```

**Substring:**
```bash
STR="20240115_data.csv"

# From position
echo "${STR:0:8}"      # 20240115

# From end
echo "${STR: -7}"      # data.csv
```

**Replace:**
```bash
FILE="data.csv"

# Replace first
echo "${FILE/.csv/.json}"    # data.json

# Replace all
PATH="/data/raw/raw/file"
echo "${PATH//raw/processed}"  # /data/processed/processed/file
```

**Remove prefix/suffix:**
```bash
FILE="path/to/file.tar.gz"

# Remove prefix
echo "${FILE#*/}"        # to/file.tar.gz
echo "${FILE##*/}"       # file.tar.gz (greedy)

# Remove suffix
echo "${FILE%.gz}"       # path/to/file.tar
echo "${FILE%%.*}"       # path/to/file (greedy)
```

---

### String manipulation patterns

**Extract filename:**
```bash
PATH="/data/raw/20240115_sales.csv"

FILENAME="${PATH##*/}"        # 20240115_sales.csv
BASENAME="${FILENAME%.csv}"   # 20240115_sales
EXTENSION="${FILENAME##*.}"   # csv
```

**Date extraction:**
```bash
FILE="sales_20240115.csv"
DATE="${FILE#*_}"        # 20240115.csv
DATE="${DATE%.csv}"      # 20240115
```

**Path manipulation:**
```bash
INPUT="/data/raw/file.csv"
OUTPUT="${INPUT/raw/processed}"      # /data/processed/file.csv
OUTPUT="${OUTPUT%.csv}.json"         # /data/processed/file.json
```

---

## 10.11 Subshell & grouping

### Subshell ( )

**Behavior:** Runs commands in child shell, doesn't affect parent environment.

**Usage:**
```bash
# Subshell
(
    cd /tmp
    echo "In tmp: $PWD"
)
echo "Still in: $PWD"    # Original directory

# Variable isolation
VAR=1
(VAR=2; echo "Inside: $VAR")   # Inside: 2
echo "Outside: $VAR"            # Outside: 1
```

---

### Command grouping { }

**Behavior:** Runs commands in current shell.

**Usage:**
```bash
# Redirect group
{
    echo "Line 1"
    echo "Line 2"
} > output.txt

# Skip CSV header
{
    read    # Skip header
    while IFS=, read -r COL1 COL2; do
        echo "$COL1: $COL2"
    done
} < data.csv
```

---

## 10.12 Temporary files

### mktemp (create temp file)

**How to use:**
```bash
mktemp                  # Create temp file
mktemp -d               # Create temp directory
mktemp -t prefix.XXX    # With template
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-d` | Directory | Create directory | Temp workspace |
| `-t template` | Template | Name template | Custom naming |
| `-p DIR` | tmpdir | Specify location | Custom temp location |

**Best practice:**
```bash
#!/bin/bash
set -euo pipefail

# Create temp file
TEMP_FILE=$(mktemp)

# Create temp directory
TEMP_DIR=$(mktemp -d)

# Cleanup on exit
cleanup() {
    rm -f "$TEMP_FILE"
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

# Use temp file
echo "data" > "$TEMP_FILE"

# Use temp directory
cp input.csv "$TEMP_DIR/"
cd "$TEMP_DIR"
# ... process ...
```

**Use case data engineering:**
```bash
#!/bin/bash
set -euo pipefail

INPUT="$1"
OUTPUT="$2"

# Work in temp directory
TEMP_DIR=$(mktemp -d)
trap "rm -rf '$TEMP_DIR'" EXIT

# Copy input to temp
cp "$INPUT" "$TEMP_DIR/input.csv"

# Process in temp
cd "$TEMP_DIR"
./transform.sh input.csv > output.csv

# Atomic move to final location
mv output.csv "$OUTPUT"

# Cleanup happens automatically via trap
```

---

## 10.13 Complete script example

**Production ETL script:**
```bash
#!/bin/bash
set -euo pipefail

# Configuration
readonly SCRIPT_NAME=$(basename "$0")
readonly DATA_DIR="/data"
readonly LOG_DIR="/var/log/etl"
readonly DATE=$(date +%Y%m%d)

# Functions
log() {
    echo "[$(date -Iseconds)] $*" | tee -a "$LOG_FILE"
}

log_error() {
    echo "[$(date -Iseconds)] ERROR: $*" | tee -a "$LOG_FILE" >&2
}

die() {
    log_error "$*"
    exit 1
}

cleanup() {
    if [[ -n "${TEMP_DIR:-}" ]]; then
        log "Cleaning up $TEMP_DIR"
        rm -rf "$TEMP_DIR"
    fi
}

validate_file() {
    local FILE="$1"
    local MIN_SIZE="${2:-1}"
    
    [[ -f "$FILE" ]] || die "File not found: $FILE"
    [[ -r "$FILE" ]] || die "File not readable: $FILE"
    
    local SIZE=$(stat -c%s "$FILE")
    [[ $SIZE -ge $MIN_SIZE ]] || die "File too small: $SIZE bytes"
    
    log "File valid: $FILE ($SIZE bytes)"
}

# Main
main() {
    # Parse arguments
    if [[ $# -ne 2 ]]; then
        echo "Usage: $0 INPUT OUTPUT"
        exit 2
    fi
    
    local INPUT="$1"
    local OUTPUT="$2"
    
    # Setup
    LOG_FILE="${LOG_DIR}/${SCRIPT_NAME%.sh}_${DATE}.log"
    mkdir -p "$LOG_DIR"
    
    TEMP_DIR=$(mktemp -d)
    trap cleanup EXIT
    
    log "=== ETL Pipeline Started ==="
    log "Input: $INPUT"
    log "Output: $OUTPUT"
    
    # Validate
    validate_file "$INPUT" 100
    
    # Process
    log "Processing..."
    local TEMP_OUTPUT="${TEMP_DIR}/output.csv"
    
    # Transform (example)
    awk -F',' 'NR>1 {print $1","$2}' "$INPUT" > "$TEMP_OUTPUT"
    
    # Validate output
    validate_file "$TEMP_OUTPUT" 1
    
    # Atomic move
    log "Moving to final location"
    mv "$TEMP_OUTPUT" "$OUTPUT"
    
    # Stats
    local INPUT_LINES=$(wc -l < "$INPUT")
    local OUTPUT_LINES=$(wc -l < "$OUTPUT")
    log "Processed $INPUT_LINES lines -> $OUTPUT_LINES lines"
    
    log "=== Pipeline Completed Successfully ==="
}

# Run
main "$@"
```

---

**Yang harus dikuasai:**

> Menulis script yang *jujur gagal* dan tidak menyembunyikan error. Understand set -e, trap, exit codes, dan proper error handling untuk production reliability.

---

# BAB 11: RELIABLE / PRODUCTION DATA PIPELINE

**Konsep inti:** reliability, idempotency, dan failure handling

---

## 11.1 Data validation

### Konsep: Validation types

**Data validation layers:**

| Layer | Check | Implementation | Failure action |
|-------|-------|----------------|----------------|
| **File level** | Exists, readable, non-empty | test -f, test -s | Exit immediately |
| **Format level** | Valid CSV/JSON structure | wc -l, head, jq | Reject file |
| **Schema level** | Column count, names | awk, head | Reject file |
| **Data level** | Types, ranges, nulls | awk, grep | Reject/filter rows |
| **Business level** | Logic rules | Custom checks | Alert + continue |

---

### File validation pattern

**Basic checks:**
```bash
#!/bin/bash
set -euo pipefail

INPUT="$1"

# File exists
if [[ ! -f "$INPUT" ]]; then
    echo "ERROR: File not found: $INPUT"
    exit 1
fi

# File readable
if [[ ! -r "$INPUT" ]]; then
    echo "ERROR: File not readable: $INPUT"
    exit 1
fi

# File non-empty
if [[ ! -s "$INPUT" ]]; then
    echo "ERROR: File is empty: $INPUT"
    exit 1
fi

# File size reasonable (example: < 10GB)
SIZE=$(stat -c%s "$INPUT")
MAX_SIZE=$((10 * 1024 * 1024 * 1024))
if [[ $SIZE -gt $MAX_SIZE ]]; then
    echo "ERROR: File too large: $SIZE bytes"
    exit 1
fi

echo "File validation passed: $INPUT"
```

---

### Schema validation (CSV)

**Column count check:**
```bash
#!/bin/bash
validate_csv_schema() {
    local FILE="$1"
    local EXPECTED_COLS="$2"
    
    # Get column count from header
    local ACTUAL_COLS=$(head -1 "$FILE" | awk -F',' '{print NF}')
    
    if [[ $ACTUAL_COLS -ne $EXPECTED_COLS ]]; then
        echo "ERROR: Expected $EXPECTED_COLS columns, got $ACTUAL_COLS"
        return 1
    fi
    
    # Check all rows have same column count
    local BAD_ROWS=$(awk -F',' -v expected="$EXPECTED_COLS" \
        'NF != expected {print NR}' "$FILE")
    
    if [[ -n "$BAD_ROWS" ]]; then
        echo "ERROR: Inconsistent columns at rows: $BAD_ROWS"
        return 1
    fi
    
    echo "Schema validation passed: $ACTUAL_COLS columns"
    return 0
}

# Usage
validate_csv_schema "data.csv" 5
```

**Column name validation:**
```bash
validate_csv_headers() {
    local FILE="$1"
    shift
    local EXPECTED_HEADERS=("$@")
    
    # Get actual headers
    local HEADER_LINE=$(head -1 "$FILE")
    IFS=, read -ra ACTUAL_HEADERS <<< "$HEADER_LINE"
    
    # Compare count
    if [[ ${#ACTUAL_HEADERS[@]} -ne ${#EXPECTED_HEADERS[@]} ]]; then
        echo "ERROR: Header count mismatch"
        return 1
    fi
    
    # Compare names
    for i in "${!EXPECTED_HEADERS[@]}"; do
        if [[ "${ACTUAL_HEADERS[$i]}" != "${EXPECTED_HEADERS[$i]}" ]]; then
            echo "ERROR: Expected header '${EXPECTED_HEADERS[$i]}', got '${ACTUAL_HEADERS[$i]}'"
            return 1
        fi
    done
    
    echo "Header validation passed"
    return 0
}

# Usage
validate_csv_headers "sales.csv" "date" "product" "amount" "quantity"
```

---

### Data type validation

**Numeric validation:**
```bash
# Check column is numeric
awk -F',' 'NR>1 && $3 !~ /^[0-9]+(\.[0-9]+)?$/ {
    print "ERROR: Non-numeric value at row " NR ": " $3
    exit 1
}' data.csv
```

**Date validation:**
```bash
# Check date format YYYY-MM-DD
awk -F',' 'NR>1 && $1 !~ /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/ {
    print "ERROR: Invalid date at row " NR ": " $1
    exit 1
}' data.csv
```

**NULL/empty check:**
```bash
# Check for empty required fields
awk -F',' 'NR>1 && ($1 == "" || $2 == "") {
    print "ERROR: Empty required field at row " NR
    exit 1
}' data.csv
```

**Range validation:**
```bash
# Check value in range
awk -F',' 'NR>1 && ($3 < 0 || $3 > 1000000) {
    print "ERROR: Amount out of range at row " NR ": " $3
    exit 1
}' data.csv
```

---

### Complete validation script

```bash
#!/bin/bash
set -euo pipefail

validate_sales_data() {
    local INPUT="$1"
    
    echo "=== Validating $INPUT ==="
    
    # 1. File validation
    [[ -f "$INPUT" ]] || { echo "ERROR: File not found"; return 1; }
    [[ -s "$INPUT" ]] || { echo "ERROR: File empty"; return 1; }
    
    # 2. Schema validation
    local EXPECTED_COLS=4
    local ACTUAL_COLS=$(head -1 "$INPUT" | awk -F',' '{print NF}')
    if [[ $ACTUAL_COLS -ne $EXPECTED_COLS ]]; then
        echo "ERROR: Expected $EXPECTED_COLS columns, got $ACTUAL_COLS"
        return 1
    fi
    
    # 3. Data validation
    local ERRORS=$(awk -F',' '
    NR == 1 { next }  # Skip header
    {
        # Date format check
        if ($1 !~ /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/) {
            print "Row " NR ": Invalid date: " $1
        }
        
        # Product not empty
        if ($2 == "") {
            print "Row " NR ": Empty product"
        }
        
        # Amount numeric and positive
        if ($3 !~ /^[0-9]+(\.[0-9]+)?$/ || $3 <= 0) {
            print "Row " NR ": Invalid amount: " $3
        }
        
        # Quantity positive integer
        if ($4 !~ /^[0-9]+$/ || $4 <= 0) {
            print "Row " NR ": Invalid quantity: " $4
        }
    }
    ' "$INPUT")
    
    if [[ -n "$ERRORS" ]]; then
        echo "Validation errors found:"
        echo "$ERRORS"
        return 1
    fi
    
    local TOTAL_ROWS=$(($(wc -l < "$INPUT") - 1))
    echo "Validation passed: $TOTAL_ROWS records"
    return 0
}

# Usage
validate_sales_data "sales.csv" || exit 1
```

---

## 11.2 Pipeline orchestration

### Konsep: Sequential execution

**Pipeline stages:**

| Stage | Input | Output | Failure handling |
|-------|-------|--------|------------------|
| **Extract** | Source | Raw files | Retry |
| **Validate** | Raw files | Validated flag | Reject |
| **Transform** | Raw files | Processed files | Retry with smaller batch |
| **Load** | Processed | Final location | Atomic move |
| **Archive** | All | Archive | Continue on error |
| **Cleanup** | Temp files | - | Always run |

---

### Sequential pipeline pattern

```bash
#!/bin/bash
set -euo pipefail

# Configuration
readonly INPUT_DIR="/data/input"
readonly OUTPUT_DIR="/data/output"
readonly ARCHIVE_DIR="/data/archive"
readonly DATE=$(date +%Y%m%d)

# Logging
log() {
    echo "[$(date -Iseconds)] $*"
}

log_error() {
    echo "[$(date -Iseconds)] ERROR: $*" >&2
}

# Pipeline stages
stage_extract() {
    log "Stage 1: Extract"
    # Copy from source
    cp /source/*.csv "$INPUT_DIR/"
}

stage_validate() {
    log "Stage 2: Validate"
    for FILE in "$INPUT_DIR"/*.csv; do
        ./validate.sh "$FILE" || {
            log_error "Validation failed: $FILE"
            return 1
        }
    done
}

stage_transform() {
    log "Stage 3: Transform"
    for FILE in "$INPUT_DIR"/*.csv; do
        local BASENAME=$(basename "$FILE")
        ./transform.sh "$FILE" "$OUTPUT_DIR/$BASENAME"
    done
}

stage_load() {
    log "Stage 4: Load"
    mv "$OUTPUT_DIR"/*.csv /data/final/
}

stage_archive() {
    log "Stage 5: Archive"
    tar -czf "$ARCHIVE_DIR/backup_${DATE}.tar.gz" "$INPUT_DIR"/*.csv || {
        log_error "Archive failed (non-critical)"
    }
}

stage_cleanup() {
    log "Stage 6: Cleanup"
    rm -f "$INPUT_DIR"/*.csv
    rm -f "$OUTPUT_DIR"/*.csv
}

# Main pipeline
main() {
    log "=== Pipeline started ==="
    
    stage_extract    || { log_error "Extract failed"; exit 1; }
    stage_validate   || { log_error "Validate failed"; exit 1; }
    stage_transform  || { log_error "Transform failed"; exit 1; }
    stage_load       || { log_error "Load failed"; exit 1; }
    stage_archive    # Non-critical
    stage_cleanup
    
    log "=== Pipeline completed ==="
}

main "$@"
```

---

### Dependency management

**Wait for file pattern:**
```bash
#!/bin/bash
# Wait for input file before processing

TIMEOUT=3600  # 1 hour
INTERVAL=10   # Check every 10 seconds
ELAPSED=0

INPUT="/data/input/data.csv"

while [[ ! -f "$INPUT" ]]; do
    if [[ $ELAPSED -ge $TIMEOUT ]]; then
        echo "ERROR: Timeout waiting for $INPUT"
        exit 1
    fi
    
    echo "Waiting for $INPUT... (${ELAPSED}s)"
    sleep $INTERVAL
    ELAPSED=$((ELAPSED + INTERVAL))
done

echo "File arrived: $INPUT"
./process.sh "$INPUT"
```

**Wait for flag file:**
```bash
# Upstream process creates flag when done
while [[ ! -f /data/upstream.done ]]; do
    sleep 30
done

# Process data
./process.sh /data/input.csv

# Create own flag
touch /data/downstream.done
```

---

### Parallel processing with dependencies

```bash
#!/bin/bash
set -euo pipefail

# Process multiple files in parallel, wait for all
FILES=(/data/input/*.csv)

PIDS=()

for FILE in "${FILES[@]}"; do
    ./process.sh "$FILE" &
    PIDS+=($!)
done

# Wait for all processes
FAILED=0
for PID in "${PIDS[@]}"; do
    if ! wait "$PID"; then
        echo "ERROR: Process $PID failed"
        FAILED=$((FAILED + 1))
    fi
done

if [[ $FAILED -gt 0 ]]; then
    echo "ERROR: $FAILED processes failed"
    exit 1
fi

echo "All processes completed successfully"
```

---

## 11.3 Error handling

### Exit code patterns

**Check and handle:**
```bash
#!/bin/bash

# Pattern 1: Immediate check
wget http://example.com/data.csv
if [[ $? -ne 0 ]]; then
    echo "ERROR: Download failed"
    exit 1
fi

# Pattern 2: OR operator
wget http://example.com/data.csv || {
    echo "ERROR: Download failed"
    exit 1
}

# Pattern 3: AND operator (with set -e)
set -e
wget http://example.com/data.csv  # Auto-exit on failure
echo "Download successful"
```

---

### Retry pattern

**Simple retry:**
```bash
retry() {
    local MAX_ATTEMPTS=3
    local ATTEMPT=1
    
    while [[ $ATTEMPT -le $MAX_ATTEMPTS ]]; do
        echo "Attempt $ATTEMPT of $MAX_ATTEMPTS"
        
        if "$@"; then
            echo "Success"
            return 0
        fi
        
        echo "Failed, retrying..."
        ATTEMPT=$((ATTEMPT + 1))
        sleep 5
    done
    
    echo "ERROR: All attempts failed"
    return 1
}

# Usage
retry wget http://example.com/data.csv
```

**Retry with exponential backoff:**
```bash
retry_backoff() {
    local MAX_ATTEMPTS=5
    local ATTEMPT=1
    local DELAY=1
    
    while [[ $ATTEMPT -le $MAX_ATTEMPTS ]]; do
        echo "Attempt $ATTEMPT of $MAX_ATTEMPTS"
        
        if "$@"; then
            return 0
        fi
        
        if [[ $ATTEMPT -lt $MAX_ATTEMPTS ]]; then
            echo "Failed, waiting ${DELAY}s before retry..."
            sleep $DELAY
            DELAY=$((DELAY * 2))
        fi
        
        ATTEMPT=$((ATTEMPT + 1))
    done
    
    echo "ERROR: All retry attempts exhausted"
    return 1
}

# Usage
retry_backoff curl -f http://api.example.com/data
```

---

### Fallback pattern

**Primary/fallback sources:**
```bash
#!/bin/bash
set -euo pipefail

PRIMARY_URL="http://primary.example.com/data.csv"
FALLBACK_URL="http://backup.example.com/data.csv"
OUTPUT="data.csv"

# Try primary
if wget -O "$OUTPUT" "$PRIMARY_URL"; then
    echo "Downloaded from primary source"
elif wget -O "$OUTPUT" "$FALLBACK_URL"; then
    echo "WARNING: Used fallback source"
else
    echo "ERROR: Both sources failed"
    exit 1
fi
```

**Fallback to cached data:**
```bash
#!/bin/bash
CACHE="/data/cache/latest.csv"
URL="http://example.com/data.csv"
OUTPUT="data.csv"

if wget -O "$OUTPUT" "$URL"; then
    echo "Downloaded fresh data"
    cp "$OUTPUT" "$CACHE"  # Update cache
elif [[ -f "$CACHE" ]]; then
    echo "WARNING: Using cached data"
    cp "$CACHE" "$OUTPUT"
else
    echo "ERROR: No data available"
    exit 1
fi
```

---

### timeout command

**How to use:**
```bash
timeout DURATION COMMAND
timeout 30s command          # 30 seconds
timeout 5m command           # 5 minutes
timeout 1h command           # 1 hour
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-s SIGNAL` | Signal | Send specific signal | Custom termination |
| `-k DURATION` | Kill | Send KILL after duration | Force kill |
| `--preserve-status` | Preserve status | Return command's exit code | Distinguish timeout from failure |

**Examples:**
```bash
# Basic timeout
timeout 30s ./long_process.sh

# Timeout with kill
timeout -k 10s 60s ./process.sh  # TERM after 60s, KILL after 70s

# Check if timed out
timeout 10s ./process.sh
EXIT_CODE=$?
if [[ $EXIT_CODE -eq 124 ]]; then
    echo "Process timed out"
elif [[ $EXIT_CODE -eq 0 ]]; then
    echo "Process completed"
else
    echo "Process failed"
fi
```

**Use case data engineering:**
```bash
#!/bin/bash
# ETL with timeout protection

MAX_TIME="2h"

if timeout "$MAX_TIME" ./etl.sh; then
    echo "ETL completed within time limit"
else
    EXIT_CODE=$?
    if [[ $EXIT_CODE -eq 124 ]]; then
        echo "ERROR: ETL timed out after $MAX_TIME"
        # Alert, cleanup, etc
    else
        echo "ERROR: ETL failed with code $EXIT_CODE"
    fi
    exit 1
fi
```

---

## 11.4 Logging & audit trail

### Structured logging

**Log format pattern:**
```bash
#!/bin/bash

# Structured log function
log() {
    local LEVEL="$1"
    shift
    local MESSAGE="$*"
    local TIMESTAMP=$(date -Iseconds)
    
    echo "{\"timestamp\":\"$TIMESTAMP\",\"level\":\"$LEVEL\",\"message\":\"$MESSAGE\"}"
}

log_info() {
    log "INFO" "$@"
}

log_warn() {
    log "WARN" "$@"
}

log_error() {
    log "ERROR" "$@" >&2
}

# Usage
log_info "Pipeline started"
log_warn "Using fallback source"
log_error "Validation failed"
```

**Key-value logging:**
```bash
log_kv() {
    local TIMESTAMP=$(date -Iseconds)
    echo "[$TIMESTAMP] $*"
}

# Usage
log_kv "event=pipeline_start" "input_file=data.csv" "rows=1000"
log_kv "event=validation_complete" "status=success" "duration=5s"
```

---

### Audit trail pattern

**Complete audit log:**
```bash
#!/bin/bash
set -euo pipefail

# Configuration
readonly LOG_FILE="/var/log/etl/audit_$(date +%Y%m%d).log"
readonly PIPELINE_ID="$(date +%s)_$$"

audit() {
    local EVENT="$1"
    shift
    local METADATA="$*"
    
    local ENTRY="[$(date -Iseconds)] pipeline_id=$PIPELINE_ID event=$EVENT $METADATA"
    echo "$ENTRY" | tee -a "$LOG_FILE"
}

# Usage in pipeline
audit "pipeline_start" "input=$INPUT"

ROWS_IN=$(wc -l < "$INPUT")
audit "validation_start" "input_rows=$ROWS_IN"

if ! validate "$INPUT"; then
    audit "validation_failed" "input=$INPUT"
    exit 1
fi
audit "validation_success"

# Process
START=$(date +%s)
./transform.sh "$INPUT" "$OUTPUT"
END=$(date +%s)
DURATION=$((END - START))

ROWS_OUT=$(wc -l < "$OUTPUT")
audit "transform_complete" "output_rows=$ROWS_OUT duration=${DURATION}s"

audit "pipeline_complete" "status=success"
```

---

### Log rotation consideration

**Daily log files:**
```bash
LOG_FILE="/var/log/etl/pipeline_$(date +%Y%m%d).log"

log() {
    echo "[$(date -Iseconds)] $*" | tee -a "$LOG_FILE"
}
```

**Cleanup old logs:**
```bash
# Keep logs for 30 days
find /var/log/etl -name "*.log" -mtime +30 -delete
```

---

## 11.5 Idempotency & safe pipelines

### Konsep: Idempotency

**Idempotent operation:** Running multiple times produces same result as running once.

**Idempotent vs non-idempotent:**

| Operation | Idempotent? | Why |
|-----------|-------------|-----|
| `cp source dest` (overwrite) | Yes | Same result every time |
| `cat file >> output` (append) | No | Duplicates data |
| `mv source dest` | Yes | Source gone after first run |
| Processing to temp + atomic move | Yes | Either complete or nothing |
| Counting files | Yes | Same count every time |
| Incrementing counter | No | Different every time |

---

### Temp file strategy

**Pattern: Process to temp, then atomic move:**
```bash
#!/bin/bash
set -euo pipefail

INPUT="$1"
FINAL_OUTPUT="$2"

# Work in temp directory
TEMP_DIR=$(mktemp -d)
trap "rm -rf '$TEMP_DIR'" EXIT

TEMP_OUTPUT="$TEMP_DIR/output.csv"

# Process (can fail safely)
echo "Processing..."
awk -F',' 'NR>1 {print $1","$2}' "$INPUT" > "$TEMP_OUTPUT"

# Validate output
if [[ ! -s "$TEMP_OUTPUT" ]]; then
    echo "ERROR: Output empty"
    exit 1
fi

# Atomic move (commit)
echo "Committing..."
mv "$TEMP_OUTPUT" "$FINAL_OUTPUT"

echo "Success: $FINAL_OUTPUT"
```

**Why this is safe:**
1. If processing fails, $FINAL_OUTPUT unchanged
2. If script crashes, temp dir cleaned up
3. Move is atomic - no partial writes
4. Re-running is safe - overwrites cleanly

---

### Overwrite vs append

**Overwrite (idempotent):**
```bash
# Safe to re-run
echo "data" > output.txt
```

**Append (NOT idempotent):**
```bash
# Danger: creates duplicates if re-run
echo "data" >> output.txt
```

**Safe append with deduplication:**
```bash
#!/bin/bash
# Append only if not already present

INPUT="$1"
LOG="/data/processed_files.log"

if grep -Fxq "$INPUT" "$LOG" 2>/dev/null; then
    echo "Already processed: $INPUT"
    exit 0
fi

# Process file
./process.sh "$INPUT"

# Record as processed
echo "$INPUT" >> "$LOG"
```

---

### Atomic operations

**File operations:**

| Operation | Atomic? | Safe for production? |
|-----------|---------|----------------------|
| `mv file dest` | Yes | ✓ (same filesystem) |
| `cp file dest` | No | Use temp + mv |
| `> file` (truncate) | No | Use temp + mv |
| `>> file` (append) | No | Need locking |
| `ln -s source dest` | Yes | ✓ |

**Safe update pattern:**
```bash
#!/bin/bash
# Safe config file update

CONFIG="/etc/app/config.json"
NEW_CONFIG="$1"

# Validate new config
jq empty "$NEW_CONFIG" || {
    echo "ERROR: Invalid JSON"
    exit 1
}

# Create backup
cp "$CONFIG" "${CONFIG}.backup"

# Atomic replace
TEMP=$(mktemp)
cp "$NEW_CONFIG" "$TEMP"
mv "$TEMP" "$CONFIG"

echo "Config updated safely"
```

---

### Locking for concurrency

**Simple lock with flock:**
```bash
#!/bin/bash
# Prevent concurrent execution

LOCKFILE="/tmp/pipeline.lock"

# Try to acquire lock
exec 200>"$LOCKFILE"
flock -n 200 || {
    echo "ERROR: Another instance is running"
    exit 1
}

# Do work
echo "Processing..."
sleep 10

# Lock released automatically on exit
```

**Lock with timeout:**
```bash
#!/bin/bash
LOCKFILE="/tmp/pipeline.lock"

exec 200>"$LOCKFILE"

if ! flock -w 300 200; then
    echo "ERROR: Could not acquire lock after 5 minutes"
    exit 1
fi

# Do work
./pipeline.sh

# Cleanup
rm -f "$LOCKFILE"
```

---

## 11.6 Real-world failure scenarios

### Scenario 1: Partial failure

**Problem:** Pipeline processes 1000 files, fails on file #500.

**Bad approach:**
```bash
# Start from scratch - wastes time
for FILE in *.csv; do
    ./process.sh "$FILE"
done
```

**Good approach:**
```bash
#!/bin/bash
# Track progress, resume on failure

PROGRESS_LOG="/data/.progress"

for FILE in *.csv; do
    # Skip if already processed
    if grep -Fxq "$FILE" "$PROGRESS_LOG" 2>/dev/null; then
        echo "Skipping (already done): $FILE"
        continue
    fi
    
    # Process
    if ./process.sh "$FILE"; then
        echo "$FILE" >> "$PROGRESS_LOG"
        echo "Success: $FILE"
    else
        echo "ERROR: Failed on $FILE"
        exit 1
    fi
done
```

---

### Scenario 2: Corrupt input data

**Problem:** One bad row crashes entire pipeline.

**Bad approach:**
```bash
# Dies on first bad row
awk -F',' '{print $1 + $2}' data.csv
```

**Good approach:**
```bash
#!/bin/bash
# Validate each row, skip bad rows

GOOD_ROWS=0
BAD_ROWS=0

while IFS=, read -r COL1 COL2 COL3; do
    # Validate
    if [[ ! "$COL1" =~ ^[0-9]+$ ]] || [[ ! "$COL2" =~ ^[0-9]+$ ]]; then
        echo "WARNING: Bad row: $COL1,$COL2,$COL3" >&2
        BAD_ROWS=$((BAD_ROWS + 1))
        continue
    fi
    
    # Process good row
    echo "$COL1,$COL2,$COL3"
    GOOD_ROWS=$((GOOD_ROWS + 1))
done < data.csv

echo "Processed: $GOOD_ROWS good, $BAD_ROWS bad" >&2

# Fail if too many bad rows
if [[ $BAD_ROWS -gt 100 ]]; then
    echo "ERROR: Too many bad rows ($BAD_ROWS)"
    exit 1
fi
```

---

### Scenario 3: Duplicate ingestion

**Problem:** Same file processed multiple times, creates duplicates.

**Solution: Idempotency tracking:**
```bash
#!/bin/bash
# Track processed files by checksum

INPUT="$1"
CHECKSUM_FILE="/data/.checksums"

# Calculate checksum
CHECKSUM=$(sha256sum "$INPUT" | awk '{print $1}')

# Check if already processed
if grep -q "^$CHECKSUM " "$CHECKSUM_FILE" 2>/dev/null; then
    echo "Already processed: $INPUT (checksum: $CHECKSUM)"
    exit 0
fi

# Process file
echo "Processing $INPUT"
./process.sh "$INPUT"

# Record checksum
echo "$CHECKSUM $INPUT $(date -Iseconds)" >> "$CHECKSUM_FILE"
echo "Success: $INPUT"
```

---

### Scenario 4: Late-arriving data

**Problem:** Data arrives after processing window closed.

**Detection pattern:**
```bash
#!/bin/bash
# Detect late data based on file modification time

CUTOFF=$(date -d "today 00:00:00" +%s)

for FILE in /data/input/*.csv; do
    FILE_TIME=$(stat -c%Y "$FILE")
    
    if [[ $FILE_TIME -lt $CUTOFF ]]; then
        echo "WARNING: Late data detected: $FILE"
        echo "File timestamp: $(date -d@$FILE_TIME)"
        echo "Expected before: $(date -d@$CUTOFF)"
        
        # Move to late-data directory for manual review
        mkdir -p /data/late-arrivals
        mv "$FILE" /data/late-arrivals/
    fi
done
```

---

## 11.7 Production utility commands

### sleep (delay execution)

**How to use:**
```bash
sleep NUMBER[SUFFIX]
sleep 5           # 5 seconds
sleep 5s          # 5 seconds
sleep 5m          # 5 minutes
sleep 1h          # 1 hour
sleep 1d          # 1 day
```

**Use cases:**
```bash
# Rate limiting
for i in {1..10}; do
    curl http://api.example.com/data/$i
    sleep 1
done

# Retry with delay
for ATTEMPT in {1..3}; do
    wget http://example.com/data.csv && break
    echo "Failed, retrying in 10s..."
    sleep 10
done

# Scheduled execution
sleep 3600  # Wait 1 hour
./process.sh
```

---

### watch (periodic execution)

**How to use:**
```bash
watch [OPTIONS] COMMAND
watch -n 5 ls /data        # Every 5 seconds
watch -d df -h             # Highlight differences
```

**Options:**

| Option | Kepanjangan | Fungsi | Digunakan oleh Data Engineer untuk |
|--------|-------------|--------|-------------------------------------|
| `-n SEC` | Interval | Update interval | Control frequency |
| `-d` | Differences | Highlight changes | Spot changes |
| `-t` | No title | No header | Clean output |
| `-g` | chgexit | Exit on change | Wait for change |

**Use cases:**
```bash
# Monitor queue
watch -n 10 'ls /data/queue | wc -l'

# Monitor disk usage
watch -d 'df -h /data'

# Monitor process
watch -n 5 'ps aux | grep etl'
```

---

### true / false (always succeed/fail)

**How to use:**
```bash
true        # Exit code 0 (success)
false       # Exit code 1 (failure)
```

**Use cases:**
```bash
# Infinite loop
while true; do
    ./check_queue.sh
    sleep 10
done

# Test error handling
if false; then
    echo "This won't run"
else
    echo "This runs"
fi

# Placeholder
if [[ "$ENV" == "prod" ]]; then
    ./deploy.sh
else
    true  # Do nothing in non-prod
fi
```

---

### yes (repeat string)

**How to use:**
```bash
yes [STRING]
yes           # Repeat 'y'
yes "hello"   # Repeat 'hello'
```

**Use cases:**
```bash
# Auto-confirm (use carefully!)
yes | rm -i *.tmp

# Generate test data
yes "test data" | head -1000 > test.txt

# Stress test
yes "data" | ./process_stream.sh
```

---

## 11.8 Complete production pipeline example

```bash
#!/bin/bash
# Production-ready ETL pipeline
# Features: validation, logging, idempotency, error handling, monitoring

set -euo pipefail

#=============================================================================
# Configuration
#=============================================================================

readonly SCRIPT_NAME=$(basename "$0")
readonly SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
readonly PIPELINE_ID="$(date +%s)_$$"

readonly DATA_DIR="/data"
readonly INPUT_DIR="$DATA_DIR/input"
readonly OUTPUT_DIR="$DATA_DIR/output"
readonly ARCHIVE_DIR="$DATA_DIR/archive"
readonly LOG_DIR="/var/log/etl"

readonly DATE=$(date +%Y%m%d)
readonly LOG_FILE="$LOG_DIR/${SCRIPT_NAME%.sh}_${DATE}.log"
readonly AUDIT_FILE="$LOG_DIR/audit_${DATE}.log"
readonly PROGRESS_FILE="$DATA_DIR/.progress_${DATE}"
readonly LOCK_FILE="/tmp/etl_pipeline.lock"

readonly MAX_RETRIES=3
readonly TIMEOUT="2h"

#=============================================================================
# Logging functions
#=============================================================================

log() {
    echo "[$(date -Iseconds)] [INFO] $*" | tee -a "$LOG_FILE"
}

log_error() {
    echo "[$(date -Iseconds)] [ERROR] $*" | tee -a "$LOG_FILE" >&2
}

log_warn() {
    echo "[$(date -Iseconds)] [WARN] $*" | tee -a "$LOG_FILE"
}

audit() {
    local EVENT="$1"
    shift
    echo "[$(date -Iseconds)] pipeline_id=$PIPELINE_ID event=$EVENT $*" >> "$AUDIT_FILE"
}

die() {
    log_error "$*"
    audit "pipeline_failed" "reason=$*"
    exit 1
}

#=============================================================================
# Utility functions
#=============================================================================

cleanup() {
    log "Cleaning up..."
    if [[ -n "${TEMP_DIR:-}" ]] && [[ -d "$TEMP_DIR" ]]; then
        rm -rf "$TEMP_DIR"
    fi
    
    # Release lock
    if [[ -n "${LOCK_FD:-}" ]]; then
        flock -u "$LOCK_FD"
    fi
}

acquire_lock() {
    exec 200>"$LOCK_FILE"
    if ! flock -n 200; then
        die "Another instance is already running"
    fi
    LOCK_FD=200
}

retry() {
    local COMMAND=("$@")
    local ATTEMPT=1
    
    while [[ $ATTEMPT -le $MAX_RETRIES ]]; do
        log "Attempt $ATTEMPT of $MAX_RETRIES: ${COMMAND[*]}"
        
        if "${COMMAND[@]}"; then
            return 0
        fi
        
        if [[ $ATTEMPT -lt $MAX_RETRIES ]]; then
            local DELAY=$((ATTEMPT * 5))
            log_warn "Failed, retrying in ${DELAY}s..."
            sleep $DELAY
        fi
        
        ATTEMPT=$((ATTEMPT + 1))
    done
    
    log_error "All retry attempts failed: ${COMMAND[*]}"
    return 1
}

#=============================================================================
# Validation functions
#=============================================================================

validate_file() {
    local FILE="$1"
    local MIN_SIZE="${2:-1}"
    
    [[ -f "$FILE" ]] || { log_error "Not a file: $FILE"; return 1; }
    [[ -r "$FILE" ]] || { log_error "Not readable: $FILE"; return 1; }
    
    local SIZE=$(stat -c%s "$FILE")
    [[ $SIZE -ge $MIN_SIZE ]] || {
        log_error "File too small: $FILE ($SIZE bytes)"
        return 1
    }
    
    log "File validation passed: $FILE ($SIZE bytes)"
    return 0
}

validate_csv_schema() {
    local FILE="$1"
    local EXPECTED_COLS="$2"
    
    # Check column count
    local ACTUAL_COLS=$(head -1 "$FILE" | awk -F',' '{print NF}')
    if [[ $ACTUAL_COLS -ne $EXPECTED_COLS ]]; then
        log_error "Schema mismatch: expected $EXPECTED_COLS columns, got $ACTUAL_COLS"
        return 1
    fi
    
    # Check for empty required fields
    local BAD_ROWS=$(awk -F',' -v cols="$EXPECTED_COLS" '
        NR > 1 && NF != cols { print NR }
    ' "$FILE" | head -10)
    
    if [[ -n "$BAD_ROWS" ]]; then
        log_error "Inconsistent columns at rows: $BAD_ROWS"
        return 1
    fi
    
    log "Schema validation passed: $ACTUAL_COLS columns"
    return 0
}

#=============================================================================
# Pipeline stages
#=============================================================================

stage_validate() {
    log "=== Stage: Validation ==="
    audit "stage_start" "stage=validate"
    
    local FILES=("$INPUT_DIR"/*.csv)
    if [[ ${#FILES[@]} -eq 0 ]] || [[ ! -f "${FILES[0]}" ]]; then
        die "No input files found in $INPUT_DIR"
    fi
    
    for FILE in "${FILES[@]}"; do
        validate_file "$FILE" 100 || die "Validation failed: $FILE"
        validate_csv_schema "$FILE" 4 || die "Schema validation failed: $FILE"
    done
    
    audit "stage_complete" "stage=validate files=${#FILES[@]}"
}

stage_transform() {
    log "=== Stage: Transform ==="
    audit "stage_start" "stage=transform"
    
    local PROCESSED=0
    local FAILED=0
    
    for INPUT in "$INPUT_DIR"/*.csv; do
        local BASENAME=$(basename "$INPUT")
        local OUTPUT="$OUTPUT_DIR/$BASENAME"
        
        # Skip if already processed
        if grep -Fxq "$BASENAME" "$PROGRESS_FILE" 2>/dev/null; then
            log "Already processed: $BASENAME"
            continue
        fi
        
        log "Processing: $BASENAME"
        
        # Process to temp file
        local TEMP_OUTPUT="$TEMP_DIR/$(basename "$OUTPUT")"
        
        if timeout "$TIMEOUT" awk -F',' 'NR>1 {print $1","$2","$3","$4}' \
            "$INPUT" > "$TEMP_OUTPUT"; then
            
            # Atomic move
            mv "$TEMP_OUTPUT" "$OUTPUT"
            
            # Mark as done
            echo "$BASENAME" >> "$PROGRESS_FILE"
            
            PROCESSED=$((PROCESSED + 1))
            log "Success: $BASENAME"
        else
            log_error "Transform failed: $BASENAME"
            FAILED=$((FAILED + 1))
        fi
    done
    
    audit "stage_complete" "stage=transform processed=$PROCESSED failed=$FAILED"
    
    [[ $FAILED -eq 0 ]] || die "Transform stage had $FAILED failures"
}

stage_load() {
    log "=== Stage: Load ==="
    audit "stage_start" "stage=load"
    
    local FINAL_DIR="$DATA_DIR/final"
    mkdir -p "$FINAL_DIR"
    
    local COUNT=0
    for FILE in "$OUTPUT_DIR"/*.csv; do
        [[ -f "$FILE" ]] || continue
        
        local BASENAME=$(basename "$FILE")
        local DEST="$FINAL_DIR/${DATE}_$BASENAME"
        
        # Atomic move
        mv "$FILE" "$DEST"
        COUNT=$((COUNT + 1))
        log "Loaded: $DEST"
    done
    
    audit "stage_complete" "stage=load files=$COUNT"
}

stage_archive() {
    log "=== Stage: Archive ==="
    audit "stage_start" "stage=archive"
    
    mkdir -p "$ARCHIVE_DIR"
    
    local ARCHIVE="$ARCHIVE_DIR/input_${DATE}.tar.gz"
    
    if tar -czf "$ARCHIVE" -C "$INPUT_DIR" . 2>/dev/null; then
        log "Archived to: $ARCHIVE"
        audit "stage_complete" "stage=archive file=$ARCHIVE"
    else
        log_warn "Archive failed (non-critical)"
        audit "stage_failed" "stage=archive reason=tar_failed"
    fi
}

stage_cleanup() {
    log "=== Stage: Cleanup ==="
    
    # Remove processed input files
    rm -f "$INPUT_DIR"/*.csv
    
    log "Cleanup complete"
}

#=============================================================================
# Main
#=============================================================================

main() {
    # Setup
    mkdir -p "$LOG_DIR" "$INPUT_DIR" "$OUTPUT_DIR" "$ARCHIVE_DIR"
    
    log "========================================="
    log "Pipeline started: $PIPELINE_ID"
    log "========================================="
    audit "pipeline_start" "script=$SCRIPT_NAME"
    
    # Acquire lock
    acquire_lock
    
    # Create temp directory
    TEMP_DIR=$(mktemp -d)
    trap cleanup EXIT
    
    # Run pipeline stages
    stage_validate
    stage_transform
    stage_load
    stage_archive
    stage_cleanup
    
    log "========================================="
    log "Pipeline completed successfully"
    log "========================================="
    audit "pipeline_complete" "status=success"
}

# Execute
main "$@"
```

---

**Yang harus dikuasai:**

> Mampu menjelaskan *apa yang terjadi pada data saat pipeline gagal*. Understand validation strategies, idempotency patterns, error recovery, dan production best practices untuk reliable data pipelines.

---
