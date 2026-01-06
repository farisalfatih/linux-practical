# Learning Log

Started: 2026-01-06

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -a
```

**🖥️ Output:**
```
.
..
```
✅ Exit code: 0

**💻 Command:**
```bash
mkdir -pv scripts/extract scripts/transform scripts/load data logs
```

**🖥️ Output:**
```
mkdir: created directory 'scripts'
mkdir: created directory 'scripts/extract'
mkdir: created directory 'scripts/transform'
mkdir: created directory 'scripts/load'
mkdir: created directory 'data'
mkdir: created directory 'logs'
```
✅ Exit code: 0

- 📝 opsi -p(pernt) digunakan untuk membuat sirectory beserta perent atau anak anaknya, opsi [-v(verbose)/menampilkan detail proses] digunakan untuk print directory yang dibuat apa saja
**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── data
├── logs
└── scripts
    ├── extract
    ├── load
    └── transform

7 directories, 0 files
```
✅ Exit code: 0

**✅ 2026-01-06 20:28:55 - Status:** COMPLETED

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory/data
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -a
```

**🖥️ Output:**
```
.
..
```
✅ Exit code: 0

**💻 Command:**
```bash
mkdir -vm 755 raw
```

**🖥️ Output:**
```
mkdir: created directory 'raw'
```
✅ Exit code: 0

**💻 Command:**
```bash
mkdir -vm 770 staging
```

**🖥️ Output:**
```
mkdir: created directory 'staging'
```
✅ Exit code: 0

**💻 Command:**
```bash
mkdir -vm 744 curated
```

**🖥️ Output:**
```
mkdir: created directory 'curated'
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -l
```

**🖥️ Output:**
```
total 12
drwxr--r-- 2 faris-al-fatih faris-al-fatih 4096 Jan  6  2026 curated
drwxr-xr-x 2 faris-al-fatih faris-al-fatih 4096 Jan  6 20:35 raw
drwxrwx--- 2 faris-al-fatih faris-al-fatih 4096 Jan  6 20:36 staging
```
✅ Exit code: 0

- 📝 opsi -m(mode) digunakan untuk membuat directory dan mengatur permissionnya, dalam kasus ini saya mengatur agar pada raw data group bisa read dan write, other hanya bisa membaca, dan owner bisa membaca menulis dan execute(untuk program)
- 📝 untuk permission akan dipelajari di bab yang berbeda
**✅ 2026-01-06 20:41:18 - Status:** COMPLETED


---

## 📚 2026-01-06 20:42:29 - Exercise: touch (create empty file / update timestamp)


### 2026-01-06 21:04:50 - Menyisapkan keperluan latihan
**💻 Command:**
```bash
head -n 50 /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project/data/raw/btc_usd.csv
```

**🖥️ Output:**
```
date,open,high,low,close,volume
2024-01-01,42351,42515,42323,42498,32509
2024-01-02,42095,42217,41976,41984,20691
2024-01-03,42191,42217,42113,42193,13994
2024-01-04,42199,42445,42076,42165,28015
2024-01-05,42091,42321,41822,41846,2271
2024-01-06,42355,42625,42296,42362,9325
2024-01-07,42073,42303,41891,42281,5076
2024-01-08,42254,42257,42223,42236,5989
2024-01-09,42350,42549,42109,42298,33654
2024-01-10,42201,42273,42015,42145,14841
2024-01-11,42151,42434,41965,42345,27328
2024-01-12,42255,42393,42070,42228,11874
2024-01-13,42333,42356,42090,42096,17413
2024-01-14,42152,42341,42092,42254,23058
2024-01-15,42415,42498,42293,42387,23881
2024-01-16,42104,42294,42062,42290,1314
2024-01-17,42169,42292,41918,42209,20256
2024-01-18,42101,42317,41871,42283,15527
2024-01-19,42117,42158,41902,41954,31549
2024-01-20,42030,42132,41756,42000,13998
2024-01-21,42450,42702,42198,42252,2108
2024-01-22,42444,42548,42175,42208,29652
2024-01-23,42351,42579,42170,42360,7911
2024-01-24,42433,42478,42140,42294,20409
2024-01-25,42478,42670,42245,42262,6375
2024-01-26,42020,42045,41962,42000,9744
2024-01-27,42454,42627,42324,42480,25589
2024-01-28,42175,42363,41926,42065,18891
2024-01-01,42374,42405,42251,42305,10859
2024-01-02,42377,42617,42216,42222,6099
2024-01-03,42201,42490,41964,42250,18842
2024-01-04,42327,42417,42319,42346,31598
2024-01-05,42164,42273,41926,42264,31581
2024-01-06,42227,42252,41961,42004,14536
2024-01-07,42139,42416,41925,42394,9732
2024-01-08,42122,42256,41837,41974,23355
2024-01-09,42169,42227,41943,42034,24532
2024-01-10,42395,42532,42106,42525,4724
2024-01-11,42366,42484,42211,42435,22429
2024-01-12,42033,42242,41741,42208,4003
2024-01-13,42203,42345,41962,42327,25164
2024-01-14,42296,42497,42048,42150,24273
2024-01-15,42426,42623,42167,42380,20790
2024-01-16,42225,42448,42036,42217,29767
2024-01-17,42307,42490,42105,42122,3160
2024-01-18,42037,42134,41954,42003,24993
2024-01-19,42022,42219,41906,42208,23508
2024-01-20,42363,42409,42178,42182,15309
2024-01-21,42170,42317,42113,42311,15308
```
✅ Exit code: 0

**💻 Command:**
```bash
head -n 50 /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project/data/raw/eth_usd.csv
```

**🖥️ Output:**
```
date,open,high,low,close,volume
2024-01-01,2605,2738,2597,2646,22955
2024-01-02,2475,2768,2292,2687,17575
2024-01-03,2525,2742,2488,2683,12202
2024-01-04,2495,2614,2436,2521,4118
2024-01-05,2672,2691,2545,2625,28422
2024-01-06,2408,2521,2114,2444,10193
2024-01-07,2365,2563,2216,2404,2799
2024-01-08,2287,2529,2127,2427,10242
2024-01-09,2327,2612,2211,2582,7246
2024-01-10,2457,2459,2408,2447,13579
2024-01-11,2263,2549,2038,2198,20018
2024-01-12,2255,2468,2101,2232,21710
2024-01-13,2437,2441,2407,2424,3080
2024-01-14,2647,2859,2468,2502,17252
2024-01-15,2300,2498,2036,2430,24474
2024-01-16,2221,2451,2118,2305,28756
2024-01-17,2275,2512,2188,2212,7645
2024-01-18,2521,2645,2450,2526,1207
2024-01-19,2365,2455,2323,2343,19488
2024-01-20,2281,2516,2065,2302,15624
2024-01-21,2217,2404,2130,2273,32626
2024-01-22,2264,2334,2108,2259,4928
2024-01-23,2641,2651,2595,2625,31316
2024-01-24,2482,2542,2188,2496,3687
2024-01-25,2454,2620,2347,2399,20400
2024-01-26,2273,2388,2002,2270,5781
2024-01-27,2339,2547,2195,2330,32555
2024-01-28,2323,2463,2089,2144,32432
2024-01-01,2573,2715,2352,2478,21893
2024-01-02,2376,2519,2167,2207,4556
2024-01-03,2409,2571,2297,2518,18817
2024-01-04,2512,2645,2485,2610,16003
2024-01-05,2399,2405,2194,2366,29654
2024-01-06,2241,2461,2187,2439,12034
2024-01-07,2676,2918,2559,2580,18178
2024-01-08,2532,2685,2473,2680,18084
2024-01-09,2589,2685,2411,2668,27158
2024-01-10,2651,2760,2409,2584,5815
2024-01-11,2516,2746,2320,2493,29052
2024-01-12,2495,2747,2435,2597,31465
2024-01-13,2612,2665,2372,2403,17957
2024-01-14,2600,2858,2599,2791,2394
2024-01-15,2612,2789,2394,2421,1177
2024-01-16,2437,2643,2358,2617,10195
2024-01-17,2437,2579,2222,2420,24515
2024-01-18,2261,2274,2097,2116,22276
2024-01-19,2345,2392,2273,2358,31486
2024-01-20,2441,2584,2184,2363,28660
2024-01-21,2466,2559,2435,2554,28030
```
✅ Exit code: 0

**💻 Command:**
```bash
head -n 50 /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project/data/raw/sol_usd.csv
```

**🖥️ Output:**
```
date,open,high,low,close,volume
2024-01-01,97,319,-81,-75,7827
2024-01-02,581,818,316,480,8993
2024-01-03,210,300,16,289,4374
2024-01-04,478,591,345,369,28341
2024-01-05,124,301,-69,159,13940
2024-01-06,510,600,482,582,13117
2024-01-07,302,308,302,308,11509
2024-01-08,164,243,152,241,22768
2024-01-09,425,605,248,509,24367
2024-01-10,583,622,471,488,19446
2024-01-11,567,818,456,497,9599
2024-01-12,445,484,417,439,14114
2024-01-13,438,572,147,215,22004
2024-01-14,524,543,510,539,24334
2024-01-15,141,226,-84,189,32372
2024-01-16,341,382,87,120,10435
2024-01-17,99,194,-151,117,5038
2024-01-18,229,424,46,156,19144
2024-01-19,562,623,508,568,16528
2024-01-20,200,276,-86,57,17669
2024-01-21,582,769,554,618,3458
2024-01-22,248,479,76,306,31729
2024-01-23,240,291,150,287,7367
2024-01-24,399,598,197,294,22856
2024-01-25,211,422,-34,-20,19211
2024-01-26,305,312,285,286,25812
2024-01-27,471,498,377,487,22588
2024-01-28,506,696,216,691,33113
2024-01-01,576,694,436,491,8652
2024-01-02,95,358,-31,234,25676
2024-01-03,424,430,147,421,6848
2024-01-04,270,490,182,182,23220
2024-01-05,130,211,-160,-121,7605
2024-01-06,192,482,-77,231,32982
2024-01-07,308,386,260,377,33632
2024-01-08,591,846,511,775,25237
2024-01-09,217,308,203,207,25752
2024-01-10,526,814,429,753,12702
2024-01-11,407,574,278,279,11114
2024-01-12,568,841,370,557,23346
2024-01-13,321,577,108,321,23068
2024-01-14,429,531,348,356,28196
2024-01-15,407,430,192,382,7397
2024-01-16,195,285,133,228,22546
2024-01-17,513,769,356,465,12179
2024-01-18,251,492,238,399,3303
2024-01-19,298,537,201,314,29348
2024-01-20,244,506,184,447,10088
2024-01-21,370,396,148,162,33248
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── data
│   ├── curated
│   ├── raw
│   │   ├── btc.csv
│   │   ├── eth.csv
│   │   └── sol.csv
│   └── staging
├── logs
└── scripts
    ├── extract
    ├── load
    └── transform

10 directories, 3 files
```
✅ Exit code: 0

- 📝 data latihan diembil dari data raw project latihan bab 1.3
**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory/data/raw
```
✅ Exit code: 0

**💻 Command:**
```bash
stat btc.csv
```

**🖥️ Output:**
```
  File: btc.csv
  Size: 2027      	Blocks: 8          IO Block: 4096   regular file
Device: 8,48	Inode: 64076       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 21:06:49.656341924 +0700
Modify: 2026-01-06 21:06:49.664341927 +0700
Change: 2026-01-06 21:06:49.664341927 +0700
 Birth: 2026-01-06 21:06:49.656341924 +0700
```
✅ Exit code: 0

**💻 Command:**
```bash
stat eth.csv
```

**🖥️ Output:**
```
  File: eth.csv
  Size: 1832      	Blocks: 8          IO Block: 4096   regular file
Device: 8,48	Inode: 87179       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 21:07:35.713158711 +0700
Modify: 2026-01-06 21:07:35.721158714 +0700
Change: 2026-01-06 21:07:35.721158714 +0700
 Birth: 2026-01-06 21:07:35.713158711 +0700
```
✅ Exit code: 0

**💻 Command:**
```bash
stat sol.csv
```

**🖥️ Output:**
```
  File: sol.csv
  Size: 1632      	Blocks: 8          IO Block: 4096   regular file
Device: 8,48	Inode: 88242       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 21:08:05.827330026 +0700
Modify: 2026-01-06 21:08:05.839330030 +0700
Change: 2026-01-06 21:08:05.839330030 +0700
 Birth: 2026-01-06 21:08:05.827330026 +0700
```
✅ Exit code: 0

- 📝 karena ini adalah data bukan code maka tidak ada izin untuk execute/x
**✅ 2026-01-06 21:15:30 - Status:** COMPLETED


### 2026-01-06 21:16:33 - touch tanpa opsi
**💻 Command:**
```bash
ls
```

**🖥️ Output:**
```
btc.csv
eth.csv
sol.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory/data/raw
```
✅ Exit code: 0

**💻 Command:**
```bash
touch file-baru.csv
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
btc.csv
eth.csv
file-baru.csv
sol.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
stat file-baru.csv
```

**🖥️ Output:**
```
  File: file-baru.csv
  Size: 0         	Blocks: 0          IO Block: 4096   regular empty file
Device: 8,48	Inode: 88252       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 21:18:26.629741975 +0700
Modify: 2026-01-06 21:18:26.629741975 +0700
Change: 2026-01-06 21:18:26.629741975 +0700
 Birth: 2026-01-06 21:18:26.629741975 +0700
```
✅ Exit code: 0

**✅ 2026-01-06 21:18:58 - Status:** COMPLETED


### 2026-01-06 21:19:47 - opsi -c
**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory/data/raw
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── btc.csv
├── eth.csv
├── file-baru.csv
└── sol.csv

1 directory, 4 files
```
✅ Exit code: 0

**💻 Command:**
```bash
stat btc.csv
```

**🖥️ Output:**
```
  File: btc.csv
  Size: 2027      	Blocks: 8          IO Block: 4096   regular file
Device: 8,48	Inode: 64076       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 21:06:49.656341924 +0700
Modify: 2026-01-06 21:06:49.664341927 +0700
Change: 2026-01-06 21:06:49.664341927 +0700
 Birth: 2026-01-06 21:06:49.656341924 +0700
```
✅ Exit code: 0

**💻 Command:**
```bash
touch -c btc.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
stat btc.csv
```

**🖥️ Output:**
```
  File: btc.csv
  Size: 2027      	Blocks: 8          IO Block: 4096   regular file
Device: 8,48	Inode: 64076       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 21:20:47.335850268 +0700
Modify: 2026-01-06 21:20:47.335850268 +0700
Change: 2026-01-06 21:20:47.335850268 +0700
 Birth: 2026-01-06 21:06:49.656341924 +0700
```
✅ Exit code: 0

- 📝 opsi -c (no create) digunakan untuk update waktu acces, modify, change pada sebuah file
**✅ 2026-01-06 21:24:14 - Status:** COMPLETED


### 2026-01-06 21:26:14 - opsi -t STAMP
**🎯 Objective:** menyesuaikan atau menyeragaramkan semua data yang ada pada raw

**💻 Command:**
```bash
ls -l
```

**🖥️ Output:**
```
total 12
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 2027 Jan  6 21:20 btc.csv
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 1832 Jan  6 21:07 eth.csv
-rw-r--r-- 1 faris-al-fatih faris-al-fatih    0 Jan  6 21:18 file-baru.csv
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 1632 Jan  6 21:08 sol.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
touch -t 202601062130 btc.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
touch -t 202601062130 eth.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
touch -t 202601062130 sol.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
touch -t 202601062130 file-baru.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -l
```

**🖥️ Output:**
```
total 12
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 2027 Jan  6 21:30 btc.csv
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 1832 Jan  6 21:30 eth.csv
-rw-r--r-- 1 faris-al-fatih faris-al-fatih    0 Jan  6 21:30 file-baru.csv
-rw-r--r-- 1 faris-al-fatih faris-al-fatih 1632 Jan  6 21:30 sol.csv
```
✅ Exit code: 0

- 📝 waktu telah diseragamkan, ini berfungsi untuk menyeragamkan time agar pemprosessan pipline nanti menjadi mudah
**✅ 2026-01-06 21:32:20 - Status:** COMPLETED


### 2026-01-06 21:32:49 - opsi -r file
**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory/data/raw
```
✅ Exit code: 0

**💻 Command:**
```bash
stat btc.csv
```

**🖥️ Output:**
```
  File: btc.csv
  Size: 2027      	Blocks: 8          IO Block: 4096   regular file
Device: 8,48	Inode: 64076       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 21:30:00.000000000 +0700
Modify: 2026-01-06 21:30:00.000000000 +0700
Change: 2026-01-06 21:30:13.892591473 +0700
 Birth: 2026-01-06 21:06:49.656341924 +0700
```
✅ Exit code: 0

**💻 Command:**
```bash
touch -r btc.csv file-baru2.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
stat file-baru2.csv
```

**🖥️ Output:**
```
  File: file-baru2.csv
  Size: 0         	Blocks: 0          IO Block: 4096   regular empty file
Device: 8,48	Inode: 77749       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 21:30:00.000000000 +0700
Modify: 2026-01-06 21:30:00.000000000 +0700
Change: 2026-01-06 21:34:08.246282323 +0700
 Birth: 2026-01-06 21:34:08.246282323 +0700
```
✅ Exit code: 0

**✅ 2026-01-06 21:34:40 - Status:** COMPLETED


### 2026-01-06 21:35:52 - opsi -a
**💻 Command:**
```bash
stat file-baru.csv
```

**🖥️ Output:**
```
  File: file-baru.csv
  Size: 0         	Blocks: 0          IO Block: 4096   regular empty file
Device: 8,48	Inode: 88252       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 21:30:00.000000000 +0700
Modify: 2026-01-06 21:30:00.000000000 +0700
Change: 2026-01-06 21:30:21.550862031 +0700
 Birth: 2026-01-06 21:18:26.629741975 +0700
```
✅ Exit code: 0

**💻 Command:**
```bash
touch -a file-baru.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
stat file-baru.csv
```

**🖥️ Output:**
```
  File: file-baru.csv
  Size: 0         	Blocks: 0          IO Block: 4096   regular empty file
Device: 8,48	Inode: 88252       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 21:36:34.048336110 +0700
Modify: 2026-01-06 21:30:00.000000000 +0700
Change: 2026-01-06 21:36:34.048336110 +0700
 Birth: 2026-01-06 21:18:26.629741975 +0700
```
✅ Exit code: 0

- 📝 opsi -a digunakan untuk update access time berdasarkan waktu saat ini
**✅ 2026-01-06 21:37:19 - Status:** COMPLETED


### 2026-01-06 21:37:32 - opsi -m
**💻 Command:**
```bash
stat file-baru.csv
```

**🖥️ Output:**
```
  File: file-baru.csv
  Size: 0         	Blocks: 0          IO Block: 4096   regular empty file
Device: 8,48	Inode: 88252       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 21:36:34.048336110 +0700
Modify: 2026-01-06 21:30:00.000000000 +0700
Change: 2026-01-06 21:36:34.048336110 +0700
 Birth: 2026-01-06 21:18:26.629741975 +0700
```
✅ Exit code: 0

**💻 Command:**
```bash
touch -m file-baru.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
stat file-baru.csv
```

**🖥️ Output:**
```
  File: file-baru.csv
  Size: 0         	Blocks: 0          IO Block: 4096   regular empty file
Device: 8,48	Inode: 88252       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 21:36:34.048336110 +0700
Modify: 2026-01-06 21:38:34.004933689 +0700
Change: 2026-01-06 21:38:34.004933689 +0700
 Birth: 2026-01-06 21:18:26.629741975 +0700
```
✅ Exit code: 0

- 📝 opsi -m digunakan untuk update modify time berdasarkan waktu saat ini
**✅ 2026-01-06 21:39:03 - Status:** COMPLETED


---

## 📚 2026-01-06 21:39:48 - Exercise: rm (remove)

**🎯 Objective:** mengetahui opsi apa saja yang ada pada rm yang sering digunakan dan menggunakannya sesuai kebutuhan


### 2026-01-06 21:42:04 - rm tanpa opsi
**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory/data/raw
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── btc.csv
├── eth.csv
├── file-baru.csv
├── file-baru2.csv
└── sol.csv

1 directory, 5 files
```
✅ Exit code: 0

**💻 Command:**
```bash
rm file-baru2.csv
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
btc.csv
eth.csv
file-baru.csv
sol.csv
```
✅ Exit code: 0

- 📝 file-baru3.csv berhasil di hapus, rm tanpa opsi hanya bisa menghapus file
**✅ 2026-01-06 21:43:33 - Status:** COMPLETED


### 2026-01-06 21:44:13 - opsi -r (recursive) folder dan seluruh isinya

#### 2026-01-06 21:44:34 - menyiapkan tempat latihan
**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory/data/raw
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── btc.csv
├── eth.csv
├── file-baru.csv
└── sol.csv

1 directory, 4 files
```
✅ Exit code: 0

**💻 Command:**
```bash
mkdir latihan-rm-r
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
touch latihan-rm-r/josjis.csv latihan-rm-r/love-story.csv latihan-rm-r/siap.sh latihan-rm-r/mantap.json
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
tree latihan-rm-r/
```

**🖥️ Output:**
```
latihan-rm-r/
├── josjis.csv
├── love-story.csv
├── mantap.json
└── siap.sh

1 directory, 4 files
```
✅ Exit code: 0


#### 2026-01-06 21:48:05 - eksekusi opsi -r
**💻 Command:**
```bash
rm -r latihan-rm-r/
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
btc.csv
eth.csv
file-baru.csv
sol.csv
```
✅ Exit code: 0

- 📝 folder latihan-rm-r telah dihapus

### 2026-01-06 21:50:40 - opsi -i (interactive) - konfirmasi setiap file saat dihapus
**💻 Command:**
```bash
touch josjis.md
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
rm -i josjis.md
```

**🖥️ Output:**
```
rm: remove regular empty file 'josjis.md'? 
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── btc.csv
├── eth.csv
├── file-baru.csv
└── sol.csv

1 directory, 4 files
```
✅ Exit code: 0

- 📝 file josjis.md telah dihapus, dalam processnya, terminal menanyakan/mengonformasi apakah yakin ingin menghapus file tersebut, opsi -i dapat dikombinasikan dengan -r untuk menghapus bach file
**✅ 2026-01-06 21:53:34 - Status:** COMPLETED


### 2026-01-06 21:54:09 - opsi -v (verbose) - print apa yang dilakukan
**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory/data/raw
```
✅ Exit code: 0

**💻 Command:**
```bash
ls
```

**🖥️ Output:**
```
btc.csv
eth.csv
file-baru.csv
sol.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
rm -v file-baru.csv
```

**🖥️ Output:**
```
removed 'file-baru.csv'
```
✅ Exit code: 0

- 📝 file yang dihapus akan ditampilkan di terminal
**💻 Command:**
```bash
ls
```

**🖥️ Output:**
```
btc.csv
eth.csv
sol.csv
```
✅ Exit code: 0

**✅ 2026-01-06 21:55:12 - Status:** COMPLETED


---

## 📚 2026-01-06 22:01:41 - Exercise: cp (copy)

**🎯 Objective:** mengetahui opsi saja yang digunakan dengan cp

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── data
│   ├── curated
│   ├── raw
│   │   ├── btc.csv
│   │   ├── eth.csv
│   │   └── sol.csv
│   └── staging
├── logs
└── scripts
    ├── extract
    ├── load
    └── transform

10 directories, 3 files
```
✅ Exit code: 0

**💻 Command:**
```bash
mkdir -v backup/raw
```

**🖥️ Output:**
```
mkdir: cannot create directory ‘backup/raw’: No such file or directory
```
❌ Exit code: 1

**❌ 2026-01-06 22:06:21 - Status:** FAILED
**Reason:** lupa opsi -p untuk buat parentnya

**💻 Command:**
```bash
mkdir -pv backup/raw
```

**🖥️ Output:**
```
mkdir: created directory 'backup'
mkdir: created directory 'backup/raw'
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -L 2
```

**🖥️ Output:**
```
.
├── backup
│   └── raw
├── data
│   ├── curated
│   ├── raw
│   └── staging
├── logs
└── scripts
    ├── extract
    ├── load
    └── transform

12 directories, 0 files
```
✅ Exit code: 0

**💻 Command:**
```bash
cp -rpvi data/raw backup/raw/backup_2026-01-06-22_12_34
```

**🖥️ Output:**
```
'data/raw' -> 'backup/raw/backup_2026-01-06-22_12_34'
'data/raw/btc.csv' -> 'backup/raw/backup_2026-01-06-22_12_34/btc.csv'
'data/raw/eth.csv' -> 'backup/raw/backup_2026-01-06-22_12_34/eth.csv'
'data/raw/sol.csv' -> 'backup/raw/backup_2026-01-06-22_12_34/sol.csv'
```
✅ Exit code: 0

- 📝 opsi -r (recursive) digunakan untuk coppy folder beserta isinya, -p (preserve) digunakan untuk menyalin semua stat yang ada, tanpa ini file akan di update berdasarkan waktu saat melakukan coppy tidak pada data aslinya, -v (verbose) print process yang dilakukan, -i untuk menanyakan/konfirmasi sebelum coppy
**❌ 2026-01-06 22:17:47 - Status:** FAILED
**Reason:** -i tidak berfungsi karena urutan pemprosesan opsinya salah harusnya -i di upsi terakhir

**💻 Command:**
```bash
tail -n 3 data/raw/btc.csv
```

**🖥️ Output:**
```
2024-01-19,42022,42219,41906,42208,23508
2024-01-20,42363,42409,42178,42182,15309
2024-01-21,42170,42317,42113,42311,15308
```
✅ Exit code: 0

**💻 Command:**
```bash
tail -n 1
```

**🖥️ Output:**
```
**💻 Command:**
```bash
bash -c tail -n 1 >>  data/raw/btc.csv
```

**🖥️ Output:**
```
- 📝 fungsi run tidak bisa melakukan >> ke file lain saat penilisan log
**💻 Command:**
```bash
touch -c data/raw/btc.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
stat data/raw/btc.csv
```

**🖥️ Output:**
```
  File: data/raw/btc.csv
  Size: 2027      	Blocks: 8          IO Block: 4096   regular file
Device: 8,48	Inode: 64076       Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 22:22:29.352848654 +0700
Modify: 2026-01-06 22:22:29.352848654 +0700
Change: 2026-01-06 22:22:29.352848654 +0700
 Birth: 2026-01-06 21:06:49.656341924 +0700
```
✅ Exit code: 0

- 📝 update data di data/raw/btc.csv untuk keperluhan latihan cp opsi -u
**💻 Command:**
```bash
stat backup/raw/backup_2026-01-06-22_12_34/btc.csv
```

**🖥️ Output:**
```
  File: backup/raw/backup_2026-01-06-22_12_34/btc.csv
  Size: 2027      	Blocks: 8          IO Block: 4096   regular file
Device: 8,48	Inode: 137796      Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 21:30:00.000000000 +0700
Modify: 2026-01-06 21:30:00.000000000 +0700
Change: 2026-01-06 22:12:34.808505916 +0700
 Birth: 2026-01-06 22:12:34.808505916 +0700
```
✅ Exit code: 0

**💻 Command:**
```bash
cp -uv data/raw/btc.csv data/raw/eth.csv data/raw/sol.csv backup/raw/backup_2026-01-06-22_12_34/
```

**🖥️ Output:**
```
'data/raw/btc.csv' -> 'backup/raw/backup_2026-01-06-22_12_34/btc.csv'
```
✅ Exit code: 0

- 📝 dengan opsi -u time yang terbaru akan di kopy dan yang timenya sama akan diabaikan
**💻 Command:**
```bash
stat backup/raw/backup_2026-01-06-22_12_34/btc.csv
```

**🖥️ Output:**
```
  File: backup/raw/backup_2026-01-06-22_12_34/btc.csv
  Size: 2027      	Blocks: 8          IO Block: 4096   regular file
Device: 8,48	Inode: 137796      Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/faris-al-fatih)   Gid: ( 1000/faris-al-fatih)
Access: 2026-01-06 21:30:00.000000000 +0700
Modify: 2026-01-06 22:25:21.564118868 +0700
Change: 2026-01-06 22:25:21.564118868 +0700
 Birth: 2026-01-06 22:12:34.808505916 +0700
```
✅ Exit code: 0

**💻 Command:**
```bash
cp -nv data/raw/btc.csv data/raw/eth.csv data/raw/sol.csv backup/raw/backup_2026-01-06-22_12_34/
```

**🖥️ Output:**
```
cp: warning: behavior of -n is non-portable and may change in future; use --update=none instead
```
✅ Exit code: 0

- 📝 dengan opsi -n file yang sudah ada meskipun timenya diperbaharui tidak akan dieksekusi, berguna untuk menambahkan file baru dalam bach dan tidak ingin stat lama berpengaruh
**✅ 2026-01-06 22:28:20 - Status:** COMPLETED


---

## 📚 2026-01-06 22:29:10 - Exercise: mv (move/rename)

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── backup
│   └── raw
│       └── backup_2026-01-06-22_12_34
│           ├── btc.csv
│           ├── eth.csv
│           └── sol.csv
├── data
│   ├── curated
│   ├── raw
│   │   ├── btc.csv
│   │   ├── eth.csv
│   │   └── sol.csv
│   └── staging
├── logs
└── scripts
    ├── extract
    ├── load
    └── transform

13 directories, 6 files
```
✅ Exit code: 0

**💻 Command:**
```bash
mv -vni data/raw/sol.csv ..
```

**🖥️ Output:**
```
renamed 'data/raw/sol.csv' -> '../sol.csv'
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── backup
│   └── raw
│       └── backup_2026-01-06-22_12_34
│           ├── btc.csv
│           ├── eth.csv
│           └── sol.csv
├── data
│   ├── curated
│   ├── raw
│   │   ├── btc.csv
│   │   └── eth.csv
│   └── staging
├── logs
└── scripts
    ├── extract
    ├── load
    └── transform

13 directories, 5 files
```
✅ Exit code: 0

**❌ 2026-01-06 22:35:44 - Status:** FAILED
**Reason:** salah pindah directory harusnya directory saat ini itu . bukan ..

**💻 Command:**
```bash
mv -v ../sol.csv .
```

**🖥️ Output:**
```
renamed '../sol.csv' -> './sol.csv'
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── backup
│   └── raw
│       └── backup_2026-01-06-22_12_34
│           ├── btc.csv
│           ├── eth.csv
│           └── sol.csv
├── data
│   ├── curated
│   ├── raw
│   │   ├── btc.csv
│   │   └── eth.csv
│   └── staging
├── logs
├── scripts
│   ├── extract
│   ├── load
│   └── transform
└── sol.csv

13 directories, 6 files
```
✅ Exit code: 0

- 📝 opsi n,v,i prinsipnya sama dengan cp
**✅ 2026-01-06 22:37:11 - Status:** COMPLETED

**💻 Command:**
```bash
touch data/raw/sol.csv
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
ls data/raw/
```

**🖥️ Output:**
```
btc.csv
eth.csv
sol.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── backup
│   └── raw
│       └── backup_2026-01-06-22_12_34
│           ├── btc.csv
│           ├── eth.csv
│           └── sol.csv
├── data
│   ├── curated
│   ├── raw
│   │   ├── btc.csv
│   │   ├── eth.csv
│   │   └── sol.csv
│   └── staging
├── logs
├── scripts
│   ├── extract
│   ├── load
│   └── transform
└── sol.csv

13 directories, 7 files
```
✅ Exit code: 0

- 📝 data/raw/sol.csv dibuat dengan touch dan datanya kosong untuk latihan menggunakan force/f
**💻 Command:**
```bash
-u sol.csv data/raw/sol.csv
```

**🖥️ Output:**
```
-u: command not found
```
❌ Exit code: 127

**💻 Command:**
```bash
mv -u sol.csv data/raw/sol.csv
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
├── backup
│   └── raw
│       └── backup_2026-01-06-22_12_34
│           ├── btc.csv
│           ├── eth.csv
│           └── sol.csv
├── data
│   ├── curated
│   ├── raw
│   │   ├── btc.csv
│   │   ├── eth.csv
│   │   └── sol.csv
│   └── staging
├── logs
├── scripts
│   ├── extract
│   ├── load
│   └── transform
└── sol.csv

13 directories, 7 files
```
✅ Exit code: 0

- 📝 karena data kosong baru di ubah dan timenya lebih awal dari data asli maka opsi -u/update tidak bisa digunakan
**💻 Command:**
```bash
mv -fv sol.csv data/raw/sol.csv
```

**🖥️ Output:**
```
renamed 'sol.csv' -> 'data/raw/sol.csv'
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── backup
│   └── raw
│       └── backup_2026-01-06-22_12_34
│           ├── btc.csv
│           ├── eth.csv
│           └── sol.csv
├── data
│   ├── curated
│   ├── raw
│   │   ├── btc.csv
│   │   ├── eth.csv
│   │   └── sol.csv
│   └── staging
├── logs
└── scripts
    ├── extract
    ├── load
    └── transform

13 directories, 6 files
```
✅ Exit code: 0

- 📝 opsi -f/fprs berhasil dilakukan dan menimpa file kosong tadi meskipun stat timenya lebih awal file kosong, jadi -f itu mengabaikan semuanya cukup lakukan saja perintahnya
**💻 Command:**
```bash
head data/raw/sol.csv
```

**🖥️ Output:**
```
date,open,high,low,close,volume
2024-01-01,97,319,-81,-75,7827
2024-01-02,581,818,316,480,8993
2024-01-03,210,300,16,289,4374
2024-01-04,478,591,345,369,28341
2024-01-05,124,301,-69,159,13940
2024-01-06,510,600,482,582,13117
2024-01-07,302,308,302,308,11509
2024-01-08,164,243,152,241,22768
2024-01-09,425,605,248,509,24367
```
✅ Exit code: 0

**✅ 2026-01-06 22:43:26 - Status:** COMPLETED


---

## 📚 2026-01-06 22:43:52 - Exercise: ln (create link)

**🎯 Objective:** bisa membedakan hardlink dan symbolic link, mengetahui opsi apa saja yang biasanya digunakan untuk link

**💻 Command:**
```bash
mkdir -pv staging/v1 staging/v2 staging/v3
```

**🖥️ Output:**
```
mkdir: created directory 'staging/v1'
mkdir: created directory 'staging/v2'
mkdir: created directory 'staging/v3'
```
✅ Exit code: 0

**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory/data/staging
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── v1
├── v2
└── v3

4 directories, 0 files
```
✅ Exit code: 0

**💻 Command:**
```bash
cp /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory/data/merged_crypto.csv v1
```

**🖥️ Output:**
```
cp: cannot stat '/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory/data/merged_crypto.csv': No such file or directory
```
❌ Exit code: 1

**💻 Command:**
```bash
cp /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory/data/merged_crypto.csv v1/
```

**🖥️ Output:**
```
cp: cannot stat '/home/faris-al-fatih/linux-practical/lab/01-filesystem/1-4_manajemen-file-dan-directory/data/merged_crypto.csv': No such file or directory
```
❌ Exit code: 1

**❌ 2026-01-06 22:58:41 - Status:** FAILED
**Reason:** salah path

**💻 Command:**
```bash
cp /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project/data/staging/merged_crypto.csv v1
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
├── v1
│   └── merged_crypto.csv
├── v2
└── v3

4 directories, 1 file
```
✅ Exit code: 0

**💻 Command:**
```bash
cp /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project/data/staging/merged_crypto.csv v2
```

**🖥️ Output:**
```
```
✅ Exit code: 0

**💻 Command:**
```bash
cp /home/faris-al-fatih/linux-practical/lab/01-filesystem/1-3_membaca-isi-file/project/data/staging/merged_crypto.csv v3
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
├── v1
│   └── merged_crypto.csv
├── v2
│   └── merged_crypto.csv
└── v3
    └── merged_crypto.csv

4 directories, 3 files
```
✅ Exit code: 0

**💻 Command:**
```bash
ln v3 lasted
```

**🖥️ Output:**
```
ln: v3: hard link not allowed for directory
```
❌ Exit code: 1

**💻 Command:**
```bash
ln v3/merged_crypto.csv lasted
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
├── lasted
├── v1
│   └── merged_crypto.csv
├── v2
│   └── merged_crypto.csv
└── v3
    └── merged_crypto.csv

4 directories, 4 files
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -i
```

**🖥️ Output:**
```
 87189 lasted
137753 v1
137800 v2
137801 v3
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -ri
```

**🖥️ Output:**
```
137801 v3
137800 v2
137753 v1
 87189 lasted
```
✅ Exit code: 0

**💻 Command:**
```bash
ls -Ri
```

**🖥️ Output:**
```
.:
 87189 lasted
137753 v1
137800 v2
137801 v3

./v1:
137791 merged_crypto.csv

./v2:
137788 merged_crypto.csv

./v3:
87189 merged_crypto.csv
```
✅ Exit code: 0

- 📝 dapat dilihat bahwa inode untuk hardlink dan file adli sama, misal nih file asli dihapus hardlink masih bisa membaca file karena inodenya masih tersimpan di computer
**💻 Command:**
```bash
rm -v v3/merged_crypto.csv
```

**🖥️ Output:**
```
removed 'v3/merged_crypto.csv'
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── lasted
├── v1
│   └── merged_crypto.csv
├── v2
│   └── merged_crypto.csv
└── v3

4 directories, 3 files
```
✅ Exit code: 0

**💻 Command:**
```bash
head -n 1 lasted
```

**🖥️ Output:**
```
asset,date,open,high,low,close,volume
```
✅ Exit code: 0

- 📝 bisa dilihat bahwa hardlink masih bisa digunakan, sekarang mari fokus ke symbolic link
**💻 Command:**
```bash
rm -v lasted
```

**🖥️ Output:**
```
removed 'lasted'
```
✅ Exit code: 0

**💻 Command:**
```bash
cp v2/merged_crypto.csv v3
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
├── v1
│   └── merged_crypto.csv
├── v2
│   └── merged_crypto.csv
└── v3
    └── merged_crypto.csv

4 directories, 3 files
```
✅ Exit code: 0

**💻 Command:**
```bash
-sv v3 lated
```

**🖥️ Output:**
```
Command '-sv' not found, did you mean:
  command 'sv' from deb runit (2.1.2-54+usrmergeubuntu1)
Try: sudo apt install <deb name>
```
❌ Exit code: 127

**💻 Command:**
```bash
ln -sv v3 lated
```

**🖥️ Output:**
```
'lated' -> 'v3'
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── lated -> v3
├── v1
│   └── merged_crypto.csv
├── v2
│   └── merged_crypto.csv
└── v3
    └── merged_crypto.csv

5 directories, 3 files
```
✅ Exit code: 0

- 📝 opsi -s digunakan untuk membuat symblolic link dan opsi -v verbose berguna untuk menampilkan proccess
**💻 Command:**
```bash
ln -nv v2 lasted
```

**🖥️ Output:**
```
ln: v2: hard link not allowed for directory
```
❌ Exit code: 1

**💻 Command:**
```bash
ln -snv v2 lasted
```

**🖥️ Output:**
```
'lasted' -> 'v2'
```
✅ Exit code: 0

**💻 Command:**
```bash
rm -v lasted
```

**🖥️ Output:**
```
removed 'lasted'
```
✅ Exit code: 0

**💻 Command:**
```bash
ln -nv v2 lated
```

**🖥️ Output:**
```
ln: v2: hard link not allowed for directory
```
❌ Exit code: 1

**💻 Command:**
```bash
ln -snv v2 lated
```

**🖥️ Output:**
```
ln: failed to create symbolic link 'lated': File exists
```
❌ Exit code: 1

- 📝 opsi -n digunakan agar target link tidak tertimpa oleh link baru dan targetnya tidak berubah, ini digunakan agar pembuatan link lebih sefty
**💻 Command:**
```bash
ln -sfv v2 lated
```

**🖥️ Output:**
```
'lated/v2' -> 'v2'
```
✅ Exit code: 0

**💻 Command:**
```bash
tree
```

**🖥️ Output:**
```
.
├── lated -> v3
├── v1
│   └── merged_crypto.csv
├── v2
│   └── merged_crypto.csv
└── v3
    ├── merged_crypto.csv
    └── v2 -> v2

5 directories, 4 files
```
✅ Exit code: 0

**💻 Command:**
```bash
rm v3/v2
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
├── lated -> v3
├── v1
│   └── merged_crypto.csv
├── v2
│   └── merged_crypto.csv
└── v3
    └── merged_crypto.csv

5 directories, 3 files
```
✅ Exit code: 0

**💻 Command:**
```bash
ln -sfv v2 lated
```

**🖥️ Output:**
```
'lated/v2' -> 'v2'
```
✅ Exit code: 0

- 📝 link masuk ke folder v3 karena link diperlakukan sama seperti folder biasa dan force memaksakan itu
**✅ 2026-01-06 23:21:16 - Status:** COMPLETED


---

## 📊 2026-01-06 23:21:21 - Session Summary

- **Total exercises:** 5
- **Completed:** 16
- **Failed:** 4

