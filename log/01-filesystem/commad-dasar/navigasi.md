# 2026-01-02 17:28:33 - Navigasi
**🎯 2026-01-02 17:55:08 - Objective:** Menstimulasikan bagaimana perpindahan antar folder sebagai data enginer
**📋 2026-01-02 17:59:24 - Context**
- User: faris-al-fatih
- Dir: /home/faris-al-fatih/linux-practical/lab/01-filesystem/commend-dasar/navigasi
- Shell: /bin/bash
- Tree:
```text
.
├── README.md
├── config
│   └── env.sh
├── data
│   ├── raw
│   ├── staging
│   └── warehouse
├── logs
│   ├── extract.log
│   ├── load.log
│   └── transform.log
├── scripts
│   ├── extract.sh
│   ├── load.sh
│   ├── monitor.sh
│   ├── run.sh
│   ├── transform.sh
│   └── utils.sh
└── tmp

9 directories, 11 files
```
## 2026-01-02 18:00:54 - Memastikan sudah berada di directory project
**📌 2026-01-02 18:03:01 - Expected:** sudah berada di directory project navigasi
**💻 2026-01-02 18:03:33 - Command**
```bash
pwd 
```
**🖥️ 2026-01-02 18:03:33 - Output (ringkas)**
```text
/home/faris-al-fatih/linux-practical/lab/01-filesystem/commend-dasar/navigasi
```
**2026-01-02 18:03:49 - Status:** SUCCESS
## 2026-01-02 18:07:08 - ke directory data/raw untuk nantinya cek apakah ada data
**📌 2026-01-02 18:08:42 - Expected:** dir ke data/raw
**💻 2026-01-02 18:08:57 - Command**
```bash
cd data/raw/ 
```
**💻 2026-01-02 18:09:37 - Command**
```bash
pwd 
```
**🖥️ 2026-01-02 18:09:37 - Output (ringkas)**
```text
/home/faris-al-fatih/linux-practical/lab/01-filesystem/commend-dasar/navigasi/data/raw
```
**2026-01-02 18:11:34 - Status:** SUCCESS
## 2026-01-02 18:13:52 - karena data masih belum tersedia saya akan ke directory logs untuk melihat apakah ada log error karena data tidak muncul
**📌 2026-01-02 18:17:16 - Expected:** ke ditectory script dengan absolut path, dan menngunakan ~ mempersingkat path karena project berada di /home/faris-al-fatih/linux-practical/lab/01-filesystem/commend-dasar/navigasi
**💻 2026-01-02 18:18:51 - Command**
```bash
cd /home/faris-al-fatih/linux-practical/lab/01-filesystem/commend-dasar/navigasi/logs/ 
```
**💻 2026-01-02 18:20:15 - Command**
```bash
pwd 
```
**🖥️ 2026-01-02 18:20:15 - Output (ringkas)**
```text
/home/faris-al-fatih/linux-practical/lab/01-filesystem/commend-dasar/navigasi/logs
```
## 2026-01-02 18:23:57 - ternyata tidak ada error di logs, saya akan kembali ke directory data/raw untuk melihat apakah file benar benar tidak ada, mungkin karena sifatnya hidden
**📌 2026-01-02 18:25:16 - Expected:** kembali ke directory data/raw dengan -
**💻 2026-01-02 18:25:45 - Command**
```bash
cd - 
```
**🖥️ 2026-01-02 18:25:45 - Output (ringkas)**
```text
/home/faris-al-fatih/linux-practical/lab/01-filesystem/commend-dasar/navigasi/data/raw
```
**2026-01-02 18:25:58 - Status:** SUCCESS
## 2026-01-02 18:27:43 - ternya benar jadi hidden file, saya akan memperbarui script untuk extract nya
**📌 2026-01-02 18:30:27 - Expected:** ke directori script menggunakan .. directory induk
**💻 2026-01-02 18:31:13 - Command**
```bash
cd ../../scripts/ 
```
**💻 2026-01-02 18:33:38 - Command**
```bash
pwd 
```
**🖥️ 2026-01-02 18:33:38 - Output (ringkas)**
```text
/home/faris-al-fatih/linux-practical/lab/01-filesystem/commend-dasar/navigasi/scripts
```
**2026-01-02 18:33:51 - Status:** SUCCESS
## 2026-01-02 18:34:00 - script telah diperbaiki dan saya akan ke home untuk mengerjakan project lainnya
**📌 2026-01-02 18:36:13 - Expected:** ke directory home (/home/faris-al-fatih(user))
**💻 2026-01-02 18:36:28 - Command**
```bash
cd /home/faris-al-fatih 
```
**💻 2026-01-02 18:36:57 - Command**
```bash
pwd 
```
**🖥️ 2026-01-02 18:36:57 - Output (ringkas)**
```text
/home/faris-al-fatih
```
**2026-01-02 18:36:53 - Status:** SUCCESS
