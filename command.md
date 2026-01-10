## NAVIGASI & INFORMASI DIREKTORI

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| pwd | Menampilkan direktori kerja saat ini | Memverifikasi lokasi saat bekerja dengan multiple direktori data | `pwd` | Tidak ada opsi umum |
| cd | Berpindah direktori | Navigasi antar folder data/project | `cd /data/warehouse` | `cd ~` (home), `cd -` (direktori sebelumnya), `cd ..` (parent) |
| ls | Melihat isi direktori | Melihat file data yang tersedia | `ls /data/raw` | `-l` (detail), `-a` (semua file termasuk hidden), `-h` (human-readable size), `-t` (sort by time), `-R` (recursive) |
| tree | Menampilkan struktur direktori berbentuk pohon | Visualisasi struktur data lake/warehouse | `tree /data -L 2` | `-L n` (limit level), `-d` (direktori saja), `-h` (human-readable size) |

## MANAJEMEN FILE & DIREKTORI

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| mkdir | Membuat direktori baru | Membuat folder untuk partisi data | `mkdir -p /data/year=2024/month=01` | `-p` (create parent directories), `-m` (set permission) |
| touch | Membuat file kosong atau update timestamp | Membuat file marker/flag untuk pipeline | `touch /data/processed/_SUCCESS` | `-t` (set specific time), `-c` (no create) |
| rm | Menghapus file/direktori | Cleanup data temporary atau outdated | `rm -rf /tmp/staging/*` | `-r` (recursive), `-f` (force), `-i` (interactive confirmation) |
| cp | Menyalin file/direktori | Backup data sebelum processing | `cp -r /data/raw /data/backup` | `-r` (recursive), `-p` (preserve attributes), `-u` (update only), `-v` (verbose) |
| mv | Memindah atau rename file | Reorganisasi struktur data | `mv old_data.csv new_data.csv` | `-i` (interactive), `-u` (update only), `-v` (verbose) |
| ln | Membuat link file | Membuat symlink untuk data sharing | `ln -s /data/main/file.csv /shortcuts/` | `-s` (symbolic link), `-f` (force) |

## MELIHAT ISI FILE

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| cat | Menampilkan seluruh isi file | Melihat isi file konfigurasi atau sample data | `cat config.yaml` | `-n` (number lines), `-b` (number non-blank lines) |
| head | Menampilkan baris awal file | Preview data tanpa load semua | `head -n 100 large_file.csv` | `-n` (number of lines), `-c` (number of bytes) |
| tail | Menampilkan baris akhir file | Monitoring log file real-time | `tail -f /var/log/spark.log` | `-f` (follow/real-time), `-n` (number of lines), `-F` (follow with retry) |
| less | Membaca file dengan scrolling | Explorasi file besar interaktif | `less huge_dataset.csv` | `/pattern` (search), `G` (end), `g` (start), `-S` (no wrap) |
| more | Membaca file halaman per halaman | Quick view file sederhana | `more data.txt` | `-n` (number of lines per page) |
| nl | Menampilkan file dengan nomor baris | Tracking posisi baris dalam data | `nl data.csv` | `-b a` (number all), `-s` (separator) |

## INFORMASI FILE & SISTEM

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| file | Mendeteksi tipe file | Identifikasi format file tanpa ekstensi | `file unknown_data` | `-b` (brief mode), `-i` (MIME type) |
| stat | Informasi detail file | Cek metadata file untuk audit | `stat dataset.parquet` | `-c` (custom format), `--format` |
| du | Penggunaan disk per direktori | Monitor storage usage data | `du -sh /data/*` | `-s` (summary), `-h` (human-readable), `-a` (all files), `--max-depth=n` |
| df | Kapasitas disk sistem | Monitoring kapasitas storage | `df -h` | `-h` (human-readable), `-T` (filesystem type), `-i` (inodes) |
| wc | Menghitung baris/kata/karakter | Hitung jumlah record dalam file | `wc -l data.csv` | `-l` (lines), `-w` (words), `-c` (bytes), `-m` (characters) |

## PENCARIAN

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| find | Mencari file/direktori | Mencari file data berdasarkan kriteria | `find /data -name "*.csv" -mtime -7` | `-name` (pattern), `-type` (f/d), `-mtime` (modified time), `-size`, `-exec` |
| locate | Mencari file dari database | Quick search file dalam sistem | `locate dataset.csv` | `-i` (ignore case), `-r` (regex) |
| grep | Mencari pola teks dalam file | Filter log atau search pattern dalam data | `grep "ERROR" app.log` | `-i` (ignore case), `-r` (recursive), `-n` (line number), `-v` (invert), `-c` (count) |
| which | Lokasi executable command | Verifikasi binary yang digunakan | `which python` | `-a` (show all matches) |
| type | Informasi tipe command | Cek apakah command adalah alias/function | `type ls` | `-a` (all), `-t` (type only) |
| whereis | Lokasi binary, source, manual | Lokasi lengkap program | `whereis python` | `-b` (binary), `-m` (manual), `-s` (source) |

## MANIPULASI TEKS

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| sort | Mengurutkan baris | Sorting data sebelum processing | `sort -t',' -k2 data.csv` | `-n` (numeric), `-r` (reverse), `-t` (delimiter), `-k` (key/column), `-u` (unique) |
| uniq | Menghilangkan duplikasi | Deduplikasi data | `sort data.txt | uniq -c` | `-c` (count), `-d` (duplicates only), `-u` (unique only), `-i` (ignore case) |
| cut | Memotong kolom teks | Ekstrak kolom spesifik dari CSV | `cut -d',' -f1,3 data.csv` | `-d` (delimiter), `-f` (fields), `-c` (characters) |
| diff | Membandingkan file | Compare data untuk validation | `diff old_data.csv new_data.csv` | `-u` (unified format), `-y` (side-by-side), `-q` (brief) |
| comm | Membandingkan file terurut | Find common/unique lines | `comm file1.txt file2.txt` | `-1` (suppress col 1), `-2` (suppress col 2), `-3` (suppress col 3) |
| sed | Stream editor untuk transformasi teks | Data cleaning dan transformation | `sed 's/NULL//g' data.csv` | `s/pattern/replacement/` (substitute), `-i` (in-place), `-n` (quiet), `g` (global) |
| awk | Pemrosesan teks terstruktur | Complex data manipulation | `awk -F',' '{print $1,$3}' data.csv` | `-F` (field separator), `{print}`, `{sum+=}`, `BEGIN{}`, `END{}` |
| tr | Translate/replace karakter | Cleaning karakter dalam data | `tr ',' '\t' < data.csv` | `-d` (delete), `-s` (squeeze repeats) |
| paste | Menggabungkan file secara kolom | Merge file horizontally | `paste file1.txt file2.txt` | `-d` (delimiter), `-s` (serial) |
| join | Menggabungkan file berdasarkan field | SQL-like join pada file | `join -t',' -1 1 -2 1 file1.csv file2.csv` | `-t` (delimiter), `-1` (field file1), `-2` (field file2), `-a` (unpaired lines) |
| column | Format output ke kolom | Beautify tabular output | `column -t -s',' data.csv` | `-t` (table), `-s` (separator) |
| expand | Konversi tab ke spasi | Normalize whitespace | `expand -t 4 file.txt` | `-t` (tab stops) |
| unexpand | Konversi spasi ke tab | Compress whitespace | `unexpand -t 4 file.txt` | `-t` (tab stops), `-a` (all) |
| tee | Output ke file dan stdout | Logging pipeline output | `cat data.csv | process.sh | tee output.log` | `-a` (append) |

## PEMROSESAN DATA

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| jq | Parser dan manipulator JSON | Processing JSON data | `jq '.[] | select(.status=="active")' data.json` | `-r` (raw output), `-c` (compact), `.key` (access), `select()`, `map()` |
| xargs | Eksekusi command dari input | Batch processing files | `find . -name "*.log" | xargs rm` | `-I{}` (replace string), `-n` (max args), `-P` (parallel), `-0` (null separator) |

## KOMPRESI & ARSIP

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| tar | Arsip file (tape archive) | Backup/archive data | `tar -czf backup.tar.gz /data` | `-c` (create), `-x` (extract), `-z` (gzip), `-j` (bzip2), `-v` (verbose), `-f` (file) |
| gzip | Kompresi file format gzip | Compress data untuk storage | `gzip large_file.csv` | `-k` (keep original), `-r` (recursive), `-d` (decompress), `-9` (best compression) |
| gunzip | Dekompresi gzip | Decompress data | `gunzip file.csv.gz` | `-k` (keep), `-c` (to stdout) |
| zip | Kompresi format zip | Archive dengan kompresi | `zip -r backup.zip /data` | `-r` (recursive), `-e` (encrypt), `-9` (best compression) |
| unzip | Ekstrak zip | Extract archived data | `unzip data.zip -d /output` | `-d` (destination), `-l` (list), `-q` (quiet) |

## TRANSFER FILE & JARINGAN

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| scp | Copy file via SSH | Transfer data antar server | `scp data.csv user@server:/path` | `-r` (recursive), `-P` (port), `-i` (identity file), `-C` (compression) |
| rsync | Sinkronisasi file efisien | Incremental backup/sync | `rsync -avz /data user@server:/backup` | `-a` (archive), `-v` (verbose), `-z` (compress), `-r` (recursive), `--delete`, `--progress` |
| curl | Transfer data dari URL | Download data dari API | `curl -O https://api.example.com/data.json` | `-O` (output file), `-o` (output name), `-X` (method), `-H` (header), `-d` (data) |
| wget | Download file dari web | Batch download datasets | `wget -c https://example.com/data.zip` | `-c` (continue), `-r` (recursive), `-np` (no parent), `-q` (quiet), `-O` (output) |

## PERMISSION & OWNERSHIP

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| chmod | Ubah permission file | Set akses file data | `chmod 644 data.csv` | `u+x` (user execute), `g+w` (group write), `o-r` (other no read), `-R` (recursive) |
| chown | Ubah owner file | Transfer ownership data | `chown dataeng:dataeng /data` | `-R` (recursive), `user:group` |
| chgrp | Ubah group file | Change group ownership | `chgrp dataeng /data/shared` | `-R` (recursive) |
| umask | Set default permission | Control default file permissions | `umask 022` | Nilai oktal (022, 027, dll) |

## USER & IDENTITY

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| id | Informasi user ID dan group | Verifikasi user context | `id` | `-u` (user ID), `-g` (group ID), `-G` (all groups), `-n` (names) |
| whoami | Nama user saat ini | Quick check current user | `whoami` | Tidak ada opsi umum |
| groups | Daftar grup user | Check group membership | `groups username` | Tidak ada opsi umum |

## REMOTE ACCESS

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| ssh | Koneksi remote SSH | Remote server access | `ssh user@server` | `-p` (port), `-i` (identity file), `-L` (local forward), `-R` (remote forward), `-X` (X11) |

## ENVIRONMENT VARIABLES

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| export | Set environment variable | Konfigurasi environment untuk scripts | `export SPARK_HOME=/opt/spark` | Tidak ada opsi, syntax: `export VAR=value` |
| printenv | Tampilkan environment variable | Debug environment settings | `printenv PATH` | Tidak ada opsi umum |
| env | Jalankan command dengan environment | Run dengan custom environment | `env VAR=value python script.py` | `-i` (ignore environment), `-u` (unset) |
| echo | Tampilkan teks/variabel | Output variabel atau debugging | `echo $PATH` | `-n` (no newline), `-e` (enable escapes) |
| unset | Hapus variabel | Remove environment variable | `unset TEMP_VAR` | Tidak ada opsi umum |
| source | Eksekusi script dalam shell saat ini | Load environment atau configs | `source venv/bin/activate` | Tidak ada opsi (sama dengan `.`) |

## MANAJEMEN PROSES

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| ps | Daftar proses berjalan | Monitor pipeline processes | `ps aux` | `aux` (all users), `-ef` (full format), `-p` (by PID), `--sort` |
| top | Monitor proses real-time | Monitor resource usage live | `top` | `-u` (user), `-p` (PID), `k` (kill), `M` (sort by memory), `P` (sort by CPU) |
| htop | Monitor interaktif enhanced | Better process monitoring | `htop` | `F2` (setup), `F3` (search), `F4` (filter), `F5` (tree), `F9` (kill) |
| pgrep | Cari proses berdasarkan nama | Find process ID by name | `pgrep python` | `-u` (user), `-l` (list name), `-f` (full command) |
| pidof | Cari PID dari program | Get PID of running program | `pidof spark` | `-s` (single shot), `-x` (scripts too) |
| kill | Hentikan proses by PID | Stop specific process | `kill -9 12345` | `-9` (SIGKILL force), `-15` (SIGTERM graceful), `-l` (list signals) |
| killall | Hentikan proses by nama | Stop all processes by name | `killall python` | `-9` (force), `-i` (interactive), `-u` (user) |
| pkill | Hentikan proses by pattern | Kill matching processes | `pkill -f "spark.*job"` | `-f` (full command), `-u` (user), `-9` (force) |
| nohup | Jalankan command tanpa hangup | Run long pipeline detached | `nohup python etl.py &` | `&` (background), output ke nohup.out |
| bg | Jalankan job di background | Resume suspended job in background | `bg %1` | `%n` (job number) |
| fg | Pindahkan job ke foreground | Bring background job to front | `fg %1` | `%n` (job number) |
| jobs | Daftar job | List background jobs | `jobs` | `-l` (show PID), `-p` (PID only) |

## MONITORING SISTEM

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| free | Penggunaan memori | Monitor memory untuk big data | `free -h` | `-h` (human-readable), `-m` (MB), `-g` (GB), `-s` (continuous) |
| vmstat | Statistik virtual memory | System performance monitoring | `vmstat 5` | `interval`, `-a` (active/inactive), `-s` (stats) |
| iostat | Statistik I/O | Monitor disk I/O performance | `iostat -x 5` | `-x` (extended), `-c` (CPU), `-d` (disk), `interval` |
| uptime | Waktu sistem berjalan | Check system uptime dan load | `uptime` | Tidak ada opsi umum |
| lsof | Daftar file terbuka | Debug file locks atau connections | `lsof -p 12345` | `-p` (PID), `-u` (user), `-i` (network), `-c` (command) |
| dmesg | Pesan kernel | Debug hardware/driver issues | `dmesg | tail` | `-T` (human timestamp), `-l` (level), `-w` (wait/follow) |

## MONITORING JARINGAN

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| ss | Statistik socket | Monitor network connections | `ss -tunap` | `-t` (TCP), `-u` (UDP), `-n` (numeric), `-a` (all), `-p` (processes), `-l` (listening) |
| netstat | Statistik jaringan | Network monitoring (deprecated) | `netstat -tunap` | `-t` (TCP), `-u` (UDP), `-n` (numeric), `-a` (all), `-p` (programs), `-r` (routing) |

## SCHEDULING & AUTOMATION

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| crontab | Edit cron jobs | Schedule periodic data jobs | `crontab -e` | `-e` (edit), `-l` (list), `-r` (remove), `-u` (user) |
| cron | Daemon scheduler | Background service (no direct use) | systemctl status cron | N/A - service daemon |
| at | Jadwal eksekusi sekali | One-time scheduled job | `echo "script.sh" | at 02:00` | `-f` (file), `-l` (list), `-r` (remove), `-t` (time format) |
| batch | Eksekusi saat load rendah | Run when system idle | `echo "backup.sh" | batch` | Sama seperti `at` |

## SYSTEM MANAGEMENT

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| systemctl | Kontrol systemd services | Manage data services | `systemctl status postgresql` | `start`, `stop`, `restart`, `enable`, `disable`, `status`, `list-units` |
| journalctl | Log systemd | View service logs | `journalctl -u spark -f` | `-u` (unit), `-f` (follow), `--since`, `--until`, `-n` (lines) |
| logger | Tulis ke syslog | Custom logging to syslog | `logger "ETL completed"` | `-t` (tag), `-p` (priority) |

## WAKTU & TANGGAL

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| date | Tampil/set tanggal-waktu | Timestamp untuk logging | `date +"%Y-%m-%d %H:%M:%S"` | `+format`, `-d` (date string), `-s` (set) |
| timedatectl | Kontrol sistem waktu | Manage system time/timezone | `timedatectl set-timezone UTC` | `set-timezone`, `set-time`, `status` |

## UTILITY & MISC

| Command | Fungsi | Masalah Data Engineer | Contoh Penggunaan | Opsi Sering Dipakai |
|---------|--------|----------------------|-------------------|---------------------|
| bash | Shell interpreter | Execute shell scripts | `bash script.sh` | `-c` (command), `-x` (debug), `-e` (exit on error) |
| mktemp | Buat file/direktori temporary | Safe temp file creation | `mktemp /tmp/data.XXXXXX` | `-d` (directory), `-p` (prefix), `-t` (template) |
| timeout | Jalankan command dengan batas waktu | Prevent hanging processes | `timeout 300 python script.py` | `-k` (kill after), `-s` (signal) |
| sleep | Delay eksekusi | Add delays in scripts | `sleep 60` | Waktu dalam detik (atau `1m`, `1h`) |
| watch | Eksekusi command berulang | Monitor command output | `watch -n 5 'df -h'` | `-n` (interval), `-d` (highlight differences) |
| true | Return success (0) | Scripting logic | `while true; do ... done` | Tidak ada opsi |
| false | Return failure (1) | Scripting logic | `false && echo "won't run"` | Tidak ada opsi |
| yes | Output string berulang | Auto-confirm prompts | `yes | rm -i *.tmp` | Tidak ada opsi, default "y" |
