# learnlog.sh

## Apa itu `learnlog.sh`

`learnlog.sh` adalah **tool logging manual** untuk belajar Linux secara terstruktur.

Fungsinya:
- mencatat **apa yang kamu lakukan**
- **kapan** kamu melakukannya
- **kenapa** kamu melakukannya
- **apa hasilnya**
- **apa pelajaran akhirnya**

Ini **BUKAN auto logger**, ini **alat berpikir**.

---

## Konsep Dasar

- Script ini **tidak dijalankan**
- Script ini **di-source**
- Semua fungsi dipanggil **manual**
- Shell **tidak pernah mati** kecuali kamu `exit`

```
source learnlog.sh
```
---

## Alur WAJIB Pemakaian

```
source learnlog.sh
sep (opsional)
h1 (BAB)
h2 (SUB BAB)
h3 (CASE)
objective
context (jika perlu)
expected
run (1 command)
actual
error (jika ada)
insight
tags
```

---

## Penjelasan Fungsi (Ringkas & Tegas)

### `sep`
Pemisah antar bab besar  
Output:
```
---
```

---

### `h1 "Judul Bab"`
Topik utama (biasanya sesuai folder)

Contoh:
```
h1 "02 Permission"
```

---

### `h2 "Sub Bab"`
Konsep besar dalam bab

Contoh:
```
h2 "chmod numeric"
```

---

### `h3 "Case"`
Satu skenario / eksperimen

Contoh:
```
h3 "Read-only file"
```

---

### `objective`
**NIAT BELAJAR**

Tanpa objective = asal ngetik.

Contoh:
```
objective "Menguji efek chmod 400"
```

---

### `context`
Kondisi sistem saat eksperimen

Dipakai kalau:
- beda user
- beda directory
- environment berpengaruh

Isi otomatis:
- user
- pwd
- shell

---

### `expected`
**TEBAKAN SEBELUM EKSEKUSI**

Kalau kamu nggak bisa nebak, berarti kamu belum paham.

Contoh:
```
expected "File tidak bisa ditulis"
```

---

### `run`
Menjalankan **1 command saja**

Aturan keras:
- 1 `run` = 1 command
- output panjang dipotong
- exit code dicatat
- timestamp otomatis

Contoh:
```
run chmod 400 file.txt
```

---

### `actual`
**HASIL NYATA**

Bukan copy output.  
Ini **kesimpulan singkat**.

Script akan otomatis menilai:
- sukses (exit 0)
- gagal (exit ≠ 0)

---

### `error`
Kesalahan berpikir / asumsi

Kalau nggak pernah pakai ini, berarti kamu bohong ke diri sendiri.

Contoh:
```
error "Mengira chmod 400 masih bisa write"
```

---

### `insight`
Pelajaran umum jangka panjang

Ini bagian PALING PENTING.

Contoh:
```
insight "Write bit menentukan kemampuan modifikasi file"
```

---

### `tags`
Label untuk pencarian / review

Contoh:
```
tags #permission #chmod #linux
```

---

## Contoh Lengkap (REAL CASE)

```
source learnlog.sh

sep
h1 "02 Permission"
h2 "chmod numeric"
h3 "Read-only file"

objective "Menguji efek chmod 400"
context
expected "File tidak bisa ditulis"

run chmod 400 file.txt
actual

run echo test >> file.txt
actual

error "Mengira chmod 400 masih bisa write"
insight "Write bit menentukan kemampuan modifikasi file"
tags #permission #chmod
```

---

## Tentang Timestamp

- **Setiap fungsi penting punya timestamp**
- Dicatat saat fungsi DIPANGGIL
- Bukan di awal file

Artinya:
- kamu tahu jam berapa command dijalankan
- kamu tahu jeda antar eksperimen
- log bisa diaudit ulang

---

## FAQ Penting

### ❓ Apakah `h1` menghentikan script?
❌ Tidak.  
Ini fungsi shell biasa, bukan program.

### ❓ Apakah `run` bisa banyak command?
❌ Jangan.  
Kalau kamu gabung banyak command, log kamu jadi sampah.

### ❓ Apakah output disimpan semua?
❌ Tidak.  
Output panjang **tidak berguna** untuk log belajar.

---

## Prinsip Inti (INGAT INI)

- Log ini **alat berpikir**
- Bukan pamer output
- Bukan catatan asal

Kalau kamu konsisten pakai ini:
➡️ kamu **paham**
➡️ kamu **ingat**
➡️ kamu **bisa jelasin ulang**

Kalau nggak:
➡️ ya cuma jadi tukang copy command
