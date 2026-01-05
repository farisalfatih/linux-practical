# Learning Log

Started: 2026-01-04


---

## 📚 2026-01-05 09:11:10 - Exercise: Commend penting

**📂 Context:**

- Skenario ini dijalankan pada direktori:
  ```
  /
  ```
- Catatan:
  - Tidak ada perintah `cd` yang dijalankan.
  - Semua command menggunakan working directory aktif saat ini.
  - Perubahan direktori **tidak otomatis tercatat** kecuali kamu eksplisit menjalankan `cd`.

**🎯 Objective:** Mahir melakukan perpindahan antar direktori dan mengecek lokasi direktori

**💻 Command:**
```bash
ls
```

**🖥️ Output:**
```
bin
bin.usr-is-merged
boot
dev
etc
home
init
lib
lib.usr-is-merged
lib64
lost+found
media
mnt
opt
proc
root
run
sbin
sbin.usr-is-merged
snap
srv
sys
tmp
usr
var
wslEpIDab
wsleGpaOb
wsliOIpLb
wslmFNGKM
wslmOGnab
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c cd home; pwd
```

**🖥️ Output:**
```
/home
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -a home
```

**🖥️ Output:**
```
.
..
faris-al-fatih
```
✅ Exit code: 0

- 📝 . adalah simbol direktori saat ini dan .. adalah direktori induk
**💻 Command:**
```bash
cd -
```

**🖥️ Output:**
```
/var/log
```
✅ Exit code: 0

- 📝 - simbol untuk kembali ke direktory sebelumnya untuk cd
**💻 Command:**
```bash
bash -c cd ~; pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c echo -e 'simulasi cd ke LINK folder';cd /home/faris-al-fatih/linux-practical/lab/01-filesystem/chaos-data-lake/processed/bitcoin/latest; pwd
```

**🖥️ Output:**
```
simulasi cd ke LINK folder
/home/faris-al-fatih/linux-practical/lab/01-filesystem/chaos-data-lake/processed/bitcoin/latest
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c echo -e 'simulasi ke LINK folder';cd -P /home/faris-al-fatih/linux-practical/lab/01-filesystem/chaos-data-lake/processed/bitcoin/latest; pwd
```

**🖥️ Output:**
```
simulasi ke LINK folder
/home/faris-al-fatih/linux-practical/lab/01-filesystem/chaos-data-lake/processed/bitcoin/v3
```
✅ Exit code: 0

- 📝 jika ingin melihat folder rujukan LINK maka gunakan option -L baik untuk cd maupun pwd

**✨ What I learned:**
- gunakan cd untuk pindah antar direktori
- gunakan pwd untuk pengetahui lokasi saat ini
- gunakan option -L untuk melihat atau berpindah lokasi yang merupakan link
- gunakan ~ untuk shortcut ke home
- gunakan .. unruk kembali ke direktory induk
- gunakan . (default) untuk melihat keadaan direktori saat ini
- gunakan cd - untuk kembali ke direktori sebelumnya

**✅ 2026-01-05 09:56:12 - Status:** COMPLETED


---

## 📚 2026-01-05 09:56:17 - Exercise: Relatif Path vs Absolute Path

**📂 Context:**

- Skenario ini dijalankan pada direktori:
  ```
  /
  ```
- Catatan:
  - Tidak ada perintah `cd` yang dijalankan.
  - Semua command menggunakan working directory aktif saat ini.
  - Perubahan direktori **tidak otomatis tercatat** kecuali kamu eksplisit menjalankan `cd`.

**🎯 Objective:** Membedakan perbedaan anta relatif path dan absoluth path, serta kapan kedua itu digunakan sebagai data engenering

**💻 Command:**
```bash
bash -c echo 'pindah path dengan relative path'; cd home; pwd
```

**🖥️ Output:**
```
pindah path dengan relative path
/home
```
✅ Exit code: 0

**💻 Command:**
```bash
bash -c echo 'pindah path dengan absolute path'; cd /home; pwd
```

**🖥️ Output:**
```
pindah path dengan absolute path
/home
```
✅ Exit code: 0

- 📝 ciri path absoluth adalah diawali dengan /(root path) selain itu adalah relatif path

**✨ What I learned:**
- gunakan absolut path jika butuh keakuratan path yang tinggi dan digunakan di laptop atau server yang tidak berpindah pindah
- gunakan relative path jika project berpindah pindah dan saat bekerja dengan tim agar tim bisa langsung menjalankan tanpa perlu mengubah path dulu

**✅ 2026-01-05 10:26:37 - Status:** COMPLETED

# COMMAND WAJIB DATA ENGINEER UNTUK DEBUGGING SERVER (ADVACE TOPIC, HANYA TAU TEORINYA)

Kalau kamu cuma tahu path tapi nggak tahu **command-nya**, itu percuma. Di server, **command = senjata**. Ini daftar **COMMAND INTI** yang BENARAN dipakai saat debugging.

---

## 1. `/var/log` — LOG & ERROR
**Tujuan:** Cari akar masalah, bukan nebak.

Command:
- `ls -lh /var/log`
- `tail -n 50 /var/log/syslog`
- `tail -f /var/log/syslog`
- `less /var/log/auth.log`
- `grep -i error /var/log/syslog`
- `grep -R "failed" /var/log/nginx/`
- `zless /var/log/syslog.1.gz`
- `journalctl -xe`
- `journalctl -u nginx`

Kalau kamu nggak pakai `tail`, `less`, `grep`, **berarti kamu belum debugging**.

---

## 2. `/etc` — KONFIGURASI
**Tujuan:** Cari salah config, bukan nyalahin server.

Command:
- `ls /etc`
- `cat /etc/hosts`
- `cat /etc/resolv.conf`
- `grep -R "port" /etc/nginx/`
- `nginx -t`
- `systemctl cat nginx`
- `crontab -l`
- `ls /etc/cron.d/`
- `diff old.conf new.conf`

Edit config tanpa `diff` itu ceroboh.

---

## 3. `/tmp` & `/var/tmp` — FILE SEMENTARA
**Tujuan:** Cari file nyangkut, disk penuh, lock error.

Command:
- `ls -lh /tmp`
- `du -sh /tmp/*`
- `df -h /tmp`
- `lsof +D /tmp`
- `rm -rf /tmp/nama_file` ⚠️ (kalau ngerti)

Disk penuh tapi nggak cek `/tmp`? Salah sendiri.

---

## 4. `/home` — USER & ENV
**Tujuan:** Debug environment & SSH.

Command:
- `ls -la /home/user`
- `cat ~/.bashrc`
- `cat ~/.profile`
- `env`
- `echo $PATH`
- `ssh -v user@server`
- `ls -la ~/.ssh`

Error PATH Python sering banget asalnya dari sini.

---

## 5. `/opt` — APLIKASI CUSTOM
**Tujuan:** Pastikan aplikasi beneran ada & jalan.

Command:
- `ls /opt`
- `ls /opt/spark`
- `/opt/spark/bin/spark-submit --version`
- `du -sh /opt/*`
- `find /opt -name "*.conf"`

Kalau aplikasi “katanya terinstall” tapi nggak ada di `/opt`, itu bohong.

---

## 6. `/usr/bin` & `/usr/local/bin` — COMMAND & VERSI
**Tujuan:** Cek command mana yang dipakai.

Command:
- `which python`
- `which spark-submit`
- `whereis python`
- `python --version`
- `ls -lh /usr/local/bin`
- `echo $PATH`

Salah versi Python itu **penyakit klasik pemula**.

---

## 7. `/proc` — KONDISI LIVE SYSTEM
**Tujuan:** Analisa bottleneck, bukan asumsi.

Command:
- `cat /proc/cpuinfo`
- `cat /proc/meminfo`
- `cat /proc/loadavg`
- `top`
- `htop`
- `ps aux | sort -nrk 3 | head`
- `ps aux | sort -nrk 4 | head`

Server lambat tapi nggak buka `/proc` = asal ngomel.

---

## 8. `/dev` — DISK & DEVICE
**Tujuan:** Debug IO & storage.

Command:
- `lsblk`
- `df -h`
- `mount`
- `mount | grep sda`
- `dmesg | tail`
- `ls -l /dev/null`

Disk error kelihatan jelas di sini.

---

## 9. `/mnt` & `/media` — STORAGE & NETWORK FS
**Tujuan:** Pastikan data source beneran kebaca.

Command:
- `ls /mnt`
- `df -h /mnt`
- `mount | grep mnt`
- `ls -lh /mnt/data`
- `stat /mnt/data/file.parquet`

ETL gagal baca file? Cek mount dulu, jangan sok pinter.

---

## 10. `/var/lib` — DATA INTERNAL APLIKASI
**Tujuan:** Cek state aplikasi (HATI-HATI).

Command:
- `ls /var/lib`
- `du -sh /var/lib/docker`
- `docker system df`
- `ls /var/lib/postgresql`
- `ls /var/lib/mysql`

Ngapus isi `/var/lib` tanpa ngerti = **bunuh sistem sendiri**.

---

## COMMAND GLOBAL (WAJIB HAFAL)
Ini dipakai DI SEMUA PATH:
- `ls`, `ls -la`, `ls -lh`
- `cat`, `less`, `head`, `tail`
- `grep`, `awk`, `sed`
- `find`
- `du`, `df`
- `ps`, `top`, `htop`
- `lsof`
- `systemctl`
- `journalctl`

---
