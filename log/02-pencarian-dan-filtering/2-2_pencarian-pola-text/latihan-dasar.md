# Learning Log

Started: 2026-01-09

**💻 Command:**
```bash
echo date,open,high,low,close,volume
```

**🖥️ Output:**
```
date,open,high,low,close,volume
```
✅ Exit code: 0

**💻 Command:**
```bash
head btc30days.csv
```

**🖥️ Output:**
```
date,open,high,low,close,volume
1765238400000,"90634.35000000","94588.99000000","89500.00000000","92678.80000000","21240.43014000"
1765324800000,"92678.81000000","94476.00000000","91563.15000000","92015.37000000","18998.68083000"
1765411200000,"92015.38000000","93555.00000000","89260.63000000","92513.38000000","19972.58758000"
1765497600000,"92513.38000000","92754.00000000","89480.00000000","90268.42000000","16679.19169000"
1765584000000,"90268.43000000","90634.55000000","89766.39000000","90240.01000000","5895.70788000"
1765670400000,"90240.00000000","90472.40000000","87577.36000000","88172.17000000","9416.94004000"
1765756800000,"88172.16000000","90052.64000000","85146.64000000","86432.08000000","19778.69190000"
1765843200000,"86432.08000000","88175.98000000","85266.00000000","87863.42000000","18456.05017000"
1765929600000,"87863.43000000","90365.85000000","85314.00000000","86243.22000000","19834.11729000"
```
✅ Exit code: 0

**💻 Command:**
```bash
head btc30days_clean.csv
```

**🖥️ Output:**
```
1970-01-01,open,high,low,close,volume
2025-12-09,90634.35000000,94588.99000000,89500.00000000,92678.80000000,21240.43014000
2025-12-10,92678.81000000,94476.00000000,91563.15000000,92015.37000000,18998.68083000
2025-12-11,92015.38000000,93555.00000000,89260.63000000,92513.38000000,19972.58758000
2025-12-12,92513.38000000,92754.00000000,89480.00000000,90268.42000000,16679.19169000
2025-12-13,90268.43000000,90634.55000000,89766.39000000,90240.01000000,5895.70788000
2025-12-14,90240.00000000,90472.40000000,87577.36000000,88172.17000000,9416.94004000
2025-12-15,88172.16000000,90052.64000000,85146.64000000,86432.08000000,19778.69190000
2025-12-16,86432.08000000,88175.98000000,85266.00000000,87863.42000000,18456.05017000
2025-12-17,87863.43000000,90365.85000000,85314.00000000,86243.22000000,19834.11729000
```
✅ Exit code: 0

**💻 Command:**
```bash
head btc30days_clean.csv
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
```
✅ Exit code: 0


---

## 📚 2026-01-09 10:56:31 - Exercise: grep (cari pattern dalam file)

**🎯 Objective:** mengetahui apa yang bisa digunakan dengan gerp dan mengetahui opsi apa yang sering dipakai dengan gerp

**💻 Command:**
```bash
grep 2026 btc30days_clean.csv
```

**🖥️ Output:**
```
2026-01-01,87648.21000000,88919.45000000,87550.43000000,88839.04000000,6279.57133000
2026-01-02,88839.05000000,90961.81000000,88379.88000000,89995.13000000,17396.97301000
2026-01-03,89995.14000000,90741.16000000,89314.01000000,90628.01000000,7057.46716000
2026-01-04,90628.01000000,91810.00000000,90628.00000000,91529.73000000,10426.52970000
2026-01-05,91529.74000000,94789.08000000,91514.81000000,93859.71000000,20673.59584000
2026-01-06,93859.71000000,94444.44000000,91262.94000000,93747.97000000,18546.41829000
2026-01-07,93747.97000000,93747.97000000,90675.52000000,91364.16000000,14276.49025000
```
✅ Exit code: 0

- 📝 gerp berfungsi untuk mencari dan menampilkan pola yang dicari dari suatu file
**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/var/log
```
✅ Exit code: 0

**💻 Command:**
```bash
tree -L 1
```

**🖥️ Output:**
```
.
├── README -> ../../usr/share/doc/systemd/README.logs
├── alternatives.log
├── alternatives.log.1
├── apt
├── auth.log
├── auth.log.1
├── auth.log.2.gz
├── auth.log.3.gz
├── auth.log.4.gz
├── bootstrap.log
├── btmp
├── btmp.1
├── dist-upgrade
├── dmesg
├── dmesg.0
├── dmesg.1.gz
├── dmesg.2.gz
├── dmesg.3.gz
├── dmesg.4.gz
├── dpkg.log
├── dpkg.log.1
├── faillog
├── fontconfig.log
├── journal
├── kern.log
├── kern.log.1
├── kern.log.2.gz
├── kern.log.3.gz
├── kern.log.4.gz
├── landscape
├── lastlog
├── private
├── syslog
├── syslog.1
├── syslog.2.gz
├── syslog.3.gz
├── syslog.4.gz
├── unattended-upgrades
└── wtmp

7 directories, 33 files
```
✅ Exit code: 0


### 2026-01-09 13:17:26 - grep tanpa opsi
**💻 Command:**
```bash
grep faris-al-fatih apt/history.log
```

**🖥️ Output:**
```
Requested-By: faris-al-fatih (1000)
Requested-By: faris-al-fatih (1000)
Requested-By: faris-al-fatih (1000)
```
✅ Exit code: 0

**💻 Command:**
```bash
grep -n faris-al-fatih apt/history.log
```

**🖥️ Output:**
```
4:Requested-By: faris-al-fatih (1000)
15:Requested-By: faris-al-fatih (1000)
26:Requested-By: faris-al-fatih (1000)
```
✅ Exit code: 0

- 📝 grep digunakan untuk mengampil patter dari suatu file, berguna untuk mencari sebuah kata atau kalimat dari file tersebut, pencarian kata ini nantinya bisa di eksekusi sesuai kebutuhan, yang paling sering dilakukan adalah mencari pola dalam log untuk debuging
**✅ 2026-01-09 13:24:42 - Status:** COMPLETED


### 2026-01-09 13:26:31 - opsi -i - ignore case
**💻 Command:**
```bash
head auth.log
```

**🖥️ Output:**
```
2026-01-04T01:23:05.332709+07:00 DESKTOP-V7H7ICQ login[366]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-04T01:23:05.332895+07:00 DESKTOP-V7H7ICQ login[366]: PAM adding faulty module: pam_lastlog.so
2026-01-04T01:23:05.906412+07:00 DESKTOP-V7H7ICQ login[366]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-04T01:23:05.949549+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: New session 1 of user faris-al-fatih.
2026-01-04T01:23:05.984957+07:00 DESKTOP-V7H7ICQ (systemd): pam_unix(systemd-user:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-04T01:33:43.303637+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: The system will power off now!
2026-01-04T01:33:43.398323+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: System is powering down.
2026-01-04T21:20:38.461936+07:00 DESKTOP-V7H7ICQ systemd-logind[207]: New seat seat0.
2026-01-04T21:20:41.422331+07:00 DESKTOP-V7H7ICQ login[366]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-04T21:20:41.422513+07:00 DESKTOP-V7H7ICQ login[366]: PAM adding faulty module: pam_lastlog.so
```
✅ Exit code: 0

**💻 Command:**
```bash
grep login auth.log
```

**🖥️ Output:**
```
grep: auth.log: binary file matches
```
✅ Exit code: 0

**💻 Command:**
```bash
grep login auth.log
```

**🖥️ Output:**
```
grep: auth.log: binary file matches
```
✅ Exit code: 0

**💻 Command:**
```bash
grep -a login auth.log
```

**🖥️ Output:**
```
2026-01-04T01:23:05.332709+07:00 DESKTOP-V7H7ICQ login[366]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-04T01:23:05.332895+07:00 DESKTOP-V7H7ICQ login[366]: PAM adding faulty module: pam_lastlog.so
2026-01-04T01:23:05.906412+07:00 DESKTOP-V7H7ICQ login[366]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-04T01:23:05.949549+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: New session 1 of user faris-al-fatih.
2026-01-04T01:33:43.303637+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: The system will power off now!
2026-01-04T01:33:43.398323+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: System is powering down.
2026-01-04T21:20:38.461936+07:00 DESKTOP-V7H7ICQ systemd-logind[207]: New seat seat0.
2026-01-04T21:20:41.422331+07:00 DESKTOP-V7H7ICQ login[366]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-04T21:20:41.422513+07:00 DESKTOP-V7H7ICQ login[366]: PAM adding faulty module: pam_lastlog.so
2026-01-04T21:20:42.161965+07:00 DESKTOP-V7H7ICQ login[366]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-04T21:20:42.235256+07:00 DESKTOP-V7H7ICQ systemd-logind[207]: New session 1 of user faris-al-fatih.
2026-01-04T21:44:20.859127+07:00 DESKTOP-V7H7ICQ systemd-logind[207]: The system will power off now!
2026-01-04T21:44:21.255572+07:00 DESKTOP-V7H7ICQ systemd-logind[207]: System is powering down.
2026-01-05T08:27:31.567240+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: New seat seat0.
2026-01-05T08:27:34.728870+07:00 DESKTOP-V7H7ICQ login[356]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-05T08:27:34.729055+07:00 DESKTOP-V7H7ICQ login[356]: PAM adding faulty module: pam_lastlog.so
2026-01-05T08:27:35.277494+07:00 DESKTOP-V7H7ICQ login[356]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-05T08:27:35.324991+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: New session 1 of user faris-al-fatih.
2026-01-05T12:20:24.622364+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: The system will power off now!
2026-01-05T12:20:24.623072+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: System is powering down.
2026-01-05T12:38:27.440649+07:00 DESKTOP-V7H7ICQ systemd-logind[189]: New seat seat0.
2026-01-05T12:38:30.383367+07:00 DESKTOP-V7H7ICQ login[346]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-05T12:38:30.383473+07:00 DESKTOP-V7H7ICQ login[346]: PAM adding faulty module: pam_lastlog.so
2026-01-05T12:38:30.975617+07:00 DESKTOP-V7H7ICQ login[346]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-05T12:38:30.994617+07:00 DESKTOP-V7H7ICQ systemd-logind[189]: New session 1 of user faris-al-fatih.
2026-01-06T04:41:43.564417+07:00 DESKTOP-V7H7ICQ systemd-logind[201]: New seat seat0.
2026-01-06T04:41:50.702211+07:00 DESKTOP-V7H7ICQ login[407]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-06T04:41:50.702332+07:00 DESKTOP-V7H7ICQ login[407]: PAM adding faulty module: pam_lastlog.so
2026-01-06T04:41:52.040563+07:00 DESKTOP-V7H7ICQ login[407]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-06T04:41:52.237613+07:00 DESKTOP-V7H7ICQ systemd-logind[201]: New session 1 of user faris-al-fatih.
2026-01-06T06:01:41.007094+07:00 DESKTOP-V7H7ICQ systemd-logind[201]: The system will power off now!
2026-01-06T06:01:41.047404+07:00 DESKTOP-V7H7ICQ systemd-logind[201]: System is powering down.
2026-01-06T10:06:41.316003+07:00 DESKTOP-V7H7ICQ systemd-logind[187]: New seat seat0.
2026-01-06T10:06:44.505382+07:00 DESKTOP-V7H7ICQ login[345]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-06T10:06:44.505925+07:00 DESKTOP-V7H7ICQ login[345]: PAM adding faulty module: pam_lastlog.so
2026-01-06T10:06:45.043237+07:00 DESKTOP-V7H7ICQ login[345]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-06T10:06:45.090829+07:00 DESKTOP-V7H7ICQ systemd-logind[187]: New session 1 of user faris-al-fatih.
2026-01-06T15:41:26.721455+07:00 DESKTOP-V7H7ICQ systemd-logind[187]: The system will power off now!
2026-01-06T15:41:27.199681+07:00 DESKTOP-V7H7ICQ systemd-logind[187]: System is powering down.
2026-01-06T18:48:02.626418+07:00 DESKTOP-V7H7ICQ systemd-logind[186]: New seat seat0.
2026-01-06T18:48:05.607241+07:00 DESKTOP-V7H7ICQ login[348]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-06T18:48:05.607420+07:00 DESKTOP-V7H7ICQ login[348]: PAM adding faulty module: pam_lastlog.so
2026-01-06T18:48:06.198899+07:00 DESKTOP-V7H7ICQ login[348]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-06T18:48:06.245777+07:00 DESKTOP-V7H7ICQ systemd-logind[186]: New session 1 of user faris-al-fatih.
2026-01-07T09:49:16.129660+07:00 DESKTOP-V7H7ICQ systemd-logind[199]: New seat seat0.
2026-01-07T09:49:37.067520+07:00 DESKTOP-V7H7ICQ login[424]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-07T09:49:37.067625+07:00 DESKTOP-V7H7ICQ login[424]: PAM adding faulty module: pam_lastlog.so
2026-01-07T09:49:20.013928+07:00 DESKTOP-V7H7ICQ login[424]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-07T09:49:20.070709+07:00 DESKTOP-V7H7ICQ systemd-logind[199]: New session 1 of user faris-al-fatih.
2026-01-07T18:39:58.907129+07:00 DESKTOP-V7H7ICQ systemd-logind[188]: New seat seat0.
... (78 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
grep -a login auth.log
```

**🖥️ Output:**
```
2026-01-04T01:23:05.332709+07:00 DESKTOP-V7H7ICQ login[366]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-04T01:23:05.332895+07:00 DESKTOP-V7H7ICQ login[366]: PAM adding faulty module: pam_lastlog.so
2026-01-04T01:23:05.906412+07:00 DESKTOP-V7H7ICQ login[366]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-04T01:23:05.949549+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: New session 1 of user faris-al-fatih.
2026-01-04T01:33:43.303637+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: The system will power off now!
2026-01-04T01:33:43.398323+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: System is powering down.
2026-01-04T21:20:38.461936+07:00 DESKTOP-V7H7ICQ systemd-logind[207]: New seat seat0.
2026-01-04T21:20:41.422331+07:00 DESKTOP-V7H7ICQ login[366]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-04T21:20:41.422513+07:00 DESKTOP-V7H7ICQ login[366]: PAM adding faulty module: pam_lastlog.so
2026-01-04T21:20:42.161965+07:00 DESKTOP-V7H7ICQ login[366]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-04T21:20:42.235256+07:00 DESKTOP-V7H7ICQ systemd-logind[207]: New session 1 of user faris-al-fatih.
2026-01-04T21:44:20.859127+07:00 DESKTOP-V7H7ICQ systemd-logind[207]: The system will power off now!
2026-01-04T21:44:21.255572+07:00 DESKTOP-V7H7ICQ systemd-logind[207]: System is powering down.
2026-01-05T08:27:31.567240+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: New seat seat0.
2026-01-05T08:27:34.728870+07:00 DESKTOP-V7H7ICQ login[356]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-05T08:27:34.729055+07:00 DESKTOP-V7H7ICQ login[356]: PAM adding faulty module: pam_lastlog.so
2026-01-05T08:27:35.277494+07:00 DESKTOP-V7H7ICQ login[356]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-05T08:27:35.324991+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: New session 1 of user faris-al-fatih.
2026-01-05T12:20:24.622364+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: The system will power off now!
2026-01-05T12:20:24.623072+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: System is powering down.
2026-01-05T12:38:27.440649+07:00 DESKTOP-V7H7ICQ systemd-logind[189]: New seat seat0.
2026-01-05T12:38:30.383367+07:00 DESKTOP-V7H7ICQ login[346]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-05T12:38:30.383473+07:00 DESKTOP-V7H7ICQ login[346]: PAM adding faulty module: pam_lastlog.so
2026-01-05T12:38:30.975617+07:00 DESKTOP-V7H7ICQ login[346]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-05T12:38:30.994617+07:00 DESKTOP-V7H7ICQ systemd-logind[189]: New session 1 of user faris-al-fatih.
2026-01-06T04:41:43.564417+07:00 DESKTOP-V7H7ICQ systemd-logind[201]: New seat seat0.
2026-01-06T04:41:50.702211+07:00 DESKTOP-V7H7ICQ login[407]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-06T04:41:50.702332+07:00 DESKTOP-V7H7ICQ login[407]: PAM adding faulty module: pam_lastlog.so
2026-01-06T04:41:52.040563+07:00 DESKTOP-V7H7ICQ login[407]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-06T04:41:52.237613+07:00 DESKTOP-V7H7ICQ systemd-logind[201]: New session 1 of user faris-al-fatih.
2026-01-06T06:01:41.007094+07:00 DESKTOP-V7H7ICQ systemd-logind[201]: The system will power off now!
2026-01-06T06:01:41.047404+07:00 DESKTOP-V7H7ICQ systemd-logind[201]: System is powering down.
2026-01-06T10:06:41.316003+07:00 DESKTOP-V7H7ICQ systemd-logind[187]: New seat seat0.
2026-01-06T10:06:44.505382+07:00 DESKTOP-V7H7ICQ login[345]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-06T10:06:44.505925+07:00 DESKTOP-V7H7ICQ login[345]: PAM adding faulty module: pam_lastlog.so
2026-01-06T10:06:45.043237+07:00 DESKTOP-V7H7ICQ login[345]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-06T10:06:45.090829+07:00 DESKTOP-V7H7ICQ systemd-logind[187]: New session 1 of user faris-al-fatih.
2026-01-06T15:41:26.721455+07:00 DESKTOP-V7H7ICQ systemd-logind[187]: The system will power off now!
2026-01-06T15:41:27.199681+07:00 DESKTOP-V7H7ICQ systemd-logind[187]: System is powering down.
2026-01-06T18:48:02.626418+07:00 DESKTOP-V7H7ICQ systemd-logind[186]: New seat seat0.
2026-01-06T18:48:05.607241+07:00 DESKTOP-V7H7ICQ login[348]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-06T18:48:05.607420+07:00 DESKTOP-V7H7ICQ login[348]: PAM adding faulty module: pam_lastlog.so
2026-01-06T18:48:06.198899+07:00 DESKTOP-V7H7ICQ login[348]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-06T18:48:06.245777+07:00 DESKTOP-V7H7ICQ systemd-logind[186]: New session 1 of user faris-al-fatih.
2026-01-07T09:49:16.129660+07:00 DESKTOP-V7H7ICQ systemd-logind[199]: New seat seat0.
2026-01-07T09:49:37.067520+07:00 DESKTOP-V7H7ICQ login[424]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-07T09:49:37.067625+07:00 DESKTOP-V7H7ICQ login[424]: PAM adding faulty module: pam_lastlog.so
2026-01-07T09:49:20.013928+07:00 DESKTOP-V7H7ICQ login[424]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-07T09:49:20.070709+07:00 DESKTOP-V7H7ICQ systemd-logind[199]: New session 1 of user faris-al-fatih.
2026-01-07T18:39:58.907129+07:00 DESKTOP-V7H7ICQ systemd-logind[188]: New seat seat0.
... (78 lines, showing first 50)
```
✅ Exit code: 0

**💻 Command:**
```bash
grep -a LOGIN auth.log
```

**🖥️ Output:**
```
```
❌ Exit code: 1

**💻 Command:**
```bash
grep -ai LOGIN auth.log
```

**🖥️ Output:**
```
2026-01-04T01:23:05.332709+07:00 DESKTOP-V7H7ICQ login[366]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-04T01:23:05.332895+07:00 DESKTOP-V7H7ICQ login[366]: PAM adding faulty module: pam_lastlog.so
2026-01-04T01:23:05.906412+07:00 DESKTOP-V7H7ICQ login[366]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-04T01:23:05.949549+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: New session 1 of user faris-al-fatih.
2026-01-04T01:33:43.303637+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: The system will power off now!
2026-01-04T01:33:43.398323+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: System is powering down.
2026-01-04T21:20:38.461936+07:00 DESKTOP-V7H7ICQ systemd-logind[207]: New seat seat0.
2026-01-04T21:20:41.422331+07:00 DESKTOP-V7H7ICQ login[366]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-04T21:20:41.422513+07:00 DESKTOP-V7H7ICQ login[366]: PAM adding faulty module: pam_lastlog.so
2026-01-04T21:20:42.161965+07:00 DESKTOP-V7H7ICQ login[366]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-04T21:20:42.235256+07:00 DESKTOP-V7H7ICQ systemd-logind[207]: New session 1 of user faris-al-fatih.
2026-01-04T21:44:20.859127+07:00 DESKTOP-V7H7ICQ systemd-logind[207]: The system will power off now!
2026-01-04T21:44:21.255572+07:00 DESKTOP-V7H7ICQ systemd-logind[207]: System is powering down.
2026-01-05T08:27:31.567240+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: New seat seat0.
2026-01-05T08:27:34.728870+07:00 DESKTOP-V7H7ICQ login[356]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-05T08:27:34.729055+07:00 DESKTOP-V7H7ICQ login[356]: PAM adding faulty module: pam_lastlog.so
2026-01-05T08:27:35.277494+07:00 DESKTOP-V7H7ICQ login[356]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-05T08:27:35.324991+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: New session 1 of user faris-al-fatih.
2026-01-05T12:20:24.622364+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: The system will power off now!
2026-01-05T12:20:24.623072+07:00 DESKTOP-V7H7ICQ systemd-logind[194]: System is powering down.
2026-01-05T12:38:27.440649+07:00 DESKTOP-V7H7ICQ systemd-logind[189]: New seat seat0.
2026-01-05T12:38:30.383367+07:00 DESKTOP-V7H7ICQ login[346]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-05T12:38:30.383473+07:00 DESKTOP-V7H7ICQ login[346]: PAM adding faulty module: pam_lastlog.so
2026-01-05T12:38:30.975617+07:00 DESKTOP-V7H7ICQ login[346]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-05T12:38:30.994617+07:00 DESKTOP-V7H7ICQ systemd-logind[189]: New session 1 of user faris-al-fatih.
2026-01-06T04:41:43.564417+07:00 DESKTOP-V7H7ICQ systemd-logind[201]: New seat seat0.
2026-01-06T04:41:50.702211+07:00 DESKTOP-V7H7ICQ login[407]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-06T04:41:50.702332+07:00 DESKTOP-V7H7ICQ login[407]: PAM adding faulty module: pam_lastlog.so
2026-01-06T04:41:52.040563+07:00 DESKTOP-V7H7ICQ login[407]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-06T04:41:52.237613+07:00 DESKTOP-V7H7ICQ systemd-logind[201]: New session 1 of user faris-al-fatih.
2026-01-06T06:01:41.007094+07:00 DESKTOP-V7H7ICQ systemd-logind[201]: The system will power off now!
2026-01-06T06:01:41.047404+07:00 DESKTOP-V7H7ICQ systemd-logind[201]: System is powering down.
2026-01-06T10:06:41.316003+07:00 DESKTOP-V7H7ICQ systemd-logind[187]: New seat seat0.
2026-01-06T10:06:44.505382+07:00 DESKTOP-V7H7ICQ login[345]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-06T10:06:44.505925+07:00 DESKTOP-V7H7ICQ login[345]: PAM adding faulty module: pam_lastlog.so
2026-01-06T10:06:45.043237+07:00 DESKTOP-V7H7ICQ login[345]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-06T10:06:45.090829+07:00 DESKTOP-V7H7ICQ systemd-logind[187]: New session 1 of user faris-al-fatih.
2026-01-06T15:41:26.721455+07:00 DESKTOP-V7H7ICQ systemd-logind[187]: The system will power off now!
2026-01-06T15:41:27.199681+07:00 DESKTOP-V7H7ICQ systemd-logind[187]: System is powering down.
2026-01-06T18:48:02.626418+07:00 DESKTOP-V7H7ICQ systemd-logind[186]: New seat seat0.
2026-01-06T18:48:05.607241+07:00 DESKTOP-V7H7ICQ login[348]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-06T18:48:05.607420+07:00 DESKTOP-V7H7ICQ login[348]: PAM adding faulty module: pam_lastlog.so
2026-01-06T18:48:06.198899+07:00 DESKTOP-V7H7ICQ login[348]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-06T18:48:06.245777+07:00 DESKTOP-V7H7ICQ systemd-logind[186]: New session 1 of user faris-al-fatih.
2026-01-07T09:49:16.129660+07:00 DESKTOP-V7H7ICQ systemd-logind[199]: New seat seat0.
2026-01-07T09:49:37.067520+07:00 DESKTOP-V7H7ICQ login[424]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
2026-01-07T09:49:37.067625+07:00 DESKTOP-V7H7ICQ login[424]: PAM adding faulty module: pam_lastlog.so
2026-01-07T09:49:20.013928+07:00 DESKTOP-V7H7ICQ login[424]: pam_unix(login:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-07T09:49:20.070709+07:00 DESKTOP-V7H7ICQ systemd-logind[199]: New session 1 of user faris-al-fatih.
2026-01-07T18:39:58.907129+07:00 DESKTOP-V7H7ICQ systemd-logind[188]: New seat seat0.
... (78 lines, showing first 50)
```
✅ Exit code: 0

- 📝 opsi grep menganggap file log itu binnary karena ada karakter acak, opsi untuk itu adalah gunakan -a, opsi i digunakan untuk ignore cas yang mana search tidak peduli apakah itu huruf besar atau kecil
**✅ 2026-01-09 13:39:06 - Status:** COMPLETED


### 2026-01-09 13:40:42 - opsi -v - invert match
**💻 Command:**
```bash
grep -av login auth.log
```

**🖥️ Output:**
```
2026-01-04T01:23:05.984957+07:00 DESKTOP-V7H7ICQ (systemd): pam_unix(systemd-user:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-04T21:20:42.369367+07:00 DESKTOP-V7H7ICQ (systemd): pam_unix(systemd-user:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-04T21:27:50.490031+07:00 DESKTOP-V7H7ICQ polkitd[2671]: Loading rules from directory /etc/polkit-1/rules.d
2026-01-04T21:27:50.490695+07:00 DESKTOP-V7H7ICQ polkitd[2671]: Loading rules from directory /usr/share/polkit-1/rules.d
2026-01-04T21:27:50.493542+07:00 DESKTOP-V7H7ICQ polkitd[2671]: Finished loading, compiling and executing 4 rules
2026-01-04T21:27:50.494895+07:00 DESKTOP-V7H7ICQ polkitd[2671]: Acquired the name org.freedesktop.PolicyKit1 on the system bus
2026-01-05T08:27:35.355046+07:00 DESKTOP-V7H7ICQ (systemd): pam_unix(systemd-user:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-05T08:36:03.405623+07:00 DESKTOP-V7H7ICQ polkitd[2764]: Loading rules from directory /etc/polkit-1/rules.d
2026-01-05T08:36:03.406303+07:00 DESKTOP-V7H7ICQ polkitd[2764]: Loading rules from directory /usr/share/polkit-1/rules.d
2026-01-05T08:36:03.412030+07:00 DESKTOP-V7H7ICQ polkitd[2764]: Finished loading, compiling and executing 4 rules
2026-01-05T08:36:03.415072+07:00 DESKTOP-V7H7ICQ polkitd[2764]: Acquired the name org.freedesktop.PolicyKit1 on the system bus
2026-01-05T09:17:01.189485+07:00 DESKTOP-V7H7ICQ CRON[11220]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
2026-01-05T09:17:01.195037+07:00 DESKTOP-V7H7ICQ CRON[11220]: pam_unix(cron:session): session closed for user root
2026-01-05T10:17:01.595257+07:00 DESKTOP-V7H7ICQ CRON[25656]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
2026-01-05T10:17:01.598972+07:00 DESKTOP-V7H7ICQ CRON[25656]: pam_unix(cron:session): session closed for user root
2026-01-05T11:12:20.192771+07:00 DESKTOP-V7H7ICQ sudo: faris-al-fatih : TTY=pts/5 ; PWD=/home/faris-al-fatih/linux-practical/lab/01-filesystem ; USER=root ; COMMAND=/usr/bin/rm -r /home/faris-al-fatih/linux-practical/lab/01-filesystem/chaos-data-lake
2026-01-05T11:12:20.197830+07:00 DESKTOP-V7H7ICQ sudo: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1000)
2026-01-05T11:12:20.465306+07:00 DESKTOP-V7H7ICQ sudo: pam_unix(sudo:session): session closed for user root
2026-01-05T11:17:02.025716+07:00 DESKTOP-V7H7ICQ CRON[39326]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
2026-01-05T11:17:02.032197+07:00 DESKTOP-V7H7ICQ CRON[39326]: pam_unix(cron:session): session closed for user root
2026-01-05T12:17:01.798761+07:00 DESKTOP-V7H7ICQ CRON[59472]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
2026-01-05T12:17:01.815697+07:00 DESKTOP-V7H7ICQ CRON[59472]: pam_unix(cron:session): session closed for user root
2026-01-05T12:38:31.037348+07:00 DESKTOP-V7H7ICQ (systemd): pam_unix(systemd-user:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-05T13:17:01.061490+07:00 DESKTOP-V7H7ICQ CRON[4566]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
2026-01-05T13:17:01.069729+07:00 DESKTOP-V7H7ICQ CRON[4566]: pam_unix(cron:session): session closed for user root
2026-01-05T14:17:01.129522+07:00 DESKTOP-V7H7ICQ CRON[25773]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
2026-01-05T14:17:01.134666+07:00 DESKTOP-V7H7ICQ CRON[25773]: pam_unix(cron:session): session closed for user root
2026-01-05T15:17:01.165649+07:00 DESKTOP-V7H7ICQ CRON[42276]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
2026-01-05T15:17:01.172381+07:00 DESKTOP-V7H7ICQ CRON[42276]: pam_unix(cron:session): session closed for user root
2026-01-05T16:17:01.059119+07:00 DESKTOP-V7H7ICQ CRON[62762]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
2026-01-05T16:17:01.066136+07:00 DESKTOP-V7H7ICQ CRON[62762]: pam_unix(cron:session): session closed for user root
2026-01-06T04:41:52.354883+07:00 DESKTOP-V7H7ICQ (systemd): pam_unix(systemd-user:session): session opened for user faris-al-fatih(uid=1000) by faris-al-fatih(uid=0)
2026-01-06T04:45:54.106586+07:00 DESKTOP-V7H7ICQ sudo: faris-al-fatih : TTY=pts/0 ; PWD=/home/faris-al-fatih ; USER=root ; COMMAND=/usr/bin/apt install procps
2026-01-06T04:45:54.117477+07:00 DESKTOP-V7H7ICQ sudo: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1000)
2026-01-06T04:46:14.970366+07:00 DESKTOP-V7H7ICQ sudo: pam_unix(sudo:session): session closed for user root
2026-01-06T04:46:38.349714+07:00 DESKTOP-V7H7ICQ sudo: faris-al-fatih : TTY=pts/0 ; PWD=/home/faris-al-fatih/linux-practical ; USER=root ; COMMAND=/usr/bin/apt unistall procps
2026-01-06T04:46:38.353193+07:00 DESKTOP-V7H7ICQ sudo: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1000)
2026-01-06T04:46:38.370287+07:00 DESKTOP-V7H7ICQ sudo: pam_unix(sudo:session): session closed for user root
2026-01-06T04:46:53.197625+07:00 DESKTOP-V7H7ICQ sudo: faris-al-fatih : TTY=pts/0 ; PWD=/home/faris-al-fatih/linux-practical ; USER=root ; COMMAND=/usr/bin/apt unistall procps
2026-01-06T04:46:53.200011+07:00 DESKTOP-V7H7ICQ sudo: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1000)
2026-01-06T04:46:53.212831+07:00 DESKTOP-V7H7ICQ sudo: pam_unix(sudo:session): session closed for user root
2026-01-06T04:48:12.948631+07:00 DESKTOP-V7H7ICQ sudo: faris-al-fatih : TTY=pts/0 ; PWD=/home/faris-al-fatih/linux-practical ; USER=root ; COMMAND=/usr/bin/apt install inotify-tools
2026-01-06T04:48:12.950181+07:00 DESKTOP-V7H7ICQ sudo: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1000)
2026-01-06T04:48:19.842725+07:00 DESKTOP-V7H7ICQ polkitd[1005]: Loading rules from directory /etc/polkit-1/rules.d
2026-01-06T04:48:19.843161+07:00 DESKTOP-V7H7ICQ polkitd[1005]: Loading rules from directory /usr/share/polkit-1/rules.d
2026-01-06T04:48:19.847012+07:00 DESKTOP-V7H7ICQ polkitd[1005]: Finished loading, compiling and executing 4 rules
2026-01-06T04:48:19.848714+07:00 DESKTOP-V7H7ICQ polkitd[1005]: Acquired the name org.freedesktop.PolicyKit1 on the system bus
2026-01-06T04:48:19.997899+07:00 DESKTOP-V7H7ICQ sudo: pam_unix(sudo:session): session closed for user root
2026-01-06T05:17:01.121260+07:00 DESKTOP-V7H7ICQ CRON[2755]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
2026-01-06T05:17:01.129105+07:00 DESKTOP-V7H7ICQ CRON[2755]: pam_unix(cron:session): session closed for user root
... (160 lines, showing first 50)
```
✅ Exit code: 0

- 📝 opsi 0v digunakan untuk mencari baris yang tidak sesuai dengan pattern, dapat dilihat bahwa baris login yang harusnya muncul tidak ada
**✅ 2026-01-09 13:47:33 - Status:** COMPLETED


### 2026-01-09 13:48:20 - opsi -c - count
**💻 Command:**
```bash
grep -c dpkg.log
```

**🖥️ Output:**
```
**💻 Command:**
```bash
grep -c error dpkg.log.1
```

**🖥️ Output:**
```
39
```
✅ Exit code: 0

- 📝 opsi -c digunakan untuk menghirung total pettern dalam suatu file
**✅ 2026-01-09 13:51:35 - Status:** COMPLETED

**💻 Command:**
```bash
grep -n error dpkg.log.1
```

**🖥️ Output:**
```
165:2025-08-05 16:55:25 install libgpg-error0:amd64 <none> 1.47-3build2
166:2025-08-05 16:55:25 status half-installed libgpg-error0:amd64 1.47-3build2
167:2025-08-05 16:55:25 status unpacked libgpg-error0:amd64 1.47-3build2
371:2025-08-05 16:55:27 configure libgpg-error0:amd64 1.47-3build2 <none>
372:2025-08-05 16:55:27 status unpacked libgpg-error0:amd64 1.47-3build2
373:2025-08-05 16:55:27 status half-configured libgpg-error0:amd64 1.47-3build2
374:2025-08-05 16:55:27 status installed libgpg-error0:amd64 1.47-3build2
1645:2025-08-05 16:55:59 install libgpg-error-l10n:all <none> 1.47-3build2
1646:2025-08-05 16:55:59 status half-installed libgpg-error-l10n:all 1.47-3build2
1647:2025-08-05 16:55:59 status unpacked libgpg-error-l10n:all 1.47-3build2
1673:2025-08-05 16:56:00 configure libgpg-error-l10n:all 1.47-3build2 <none>
1674:2025-08-05 16:56:00 status unpacked libgpg-error-l10n:all 1.47-3build2
1675:2025-08-05 16:56:00 status half-configured libgpg-error-l10n:all 1.47-3build2
1676:2025-08-05 16:56:00 status installed libgpg-error-l10n:all 1.47-3build2
2206:2025-08-05 16:56:32 upgrade libgpg-error-l10n:all 1.47-3build2 1.47-3build2.1
2207:2025-08-05 16:56:32 status half-configured libgpg-error-l10n:all 1.47-3build2
2208:2025-08-05 16:56:32 status unpacked libgpg-error-l10n:all 1.47-3build2
2209:2025-08-05 16:56:32 status half-installed libgpg-error-l10n:all 1.47-3build2
2210:2025-08-05 16:56:32 status unpacked libgpg-error-l10n:all 1.47-3build2.1
2211:2025-08-05 16:56:32 upgrade libgpg-error0:amd64 1.47-3build2 1.47-3build2.1
2212:2025-08-05 16:56:32 status half-configured libgpg-error0:amd64 1.47-3build2
2213:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2
2214:2025-08-05 16:56:32 status half-installed libgpg-error0:amd64 1.47-3build2
2215:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2.1
2217:2025-08-05 16:56:32 configure libgpg-error0:amd64 1.47-3build2.1 <none>
2218:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2.1
2219:2025-08-05 16:56:32 status half-configured libgpg-error0:amd64 1.47-3build2.1
2220:2025-08-05 16:56:32 status installed libgpg-error0:amd64 1.47-3build2.1
2833:2025-08-05 16:56:39 configure libgpg-error-l10n:all 1.47-3build2.1 <none>
2834:2025-08-05 16:56:39 status unpacked libgpg-error-l10n:all 1.47-3build2.1
2835:2025-08-05 16:56:39 status half-configured libgpg-error-l10n:all 1.47-3build2.1
2836:2025-08-05 16:56:39 status installed libgpg-error-l10n:all 1.47-3build2.1
3508:2025-08-05 16:57:01 install liberror-perl:all <none> 0.17029-2
3509:2025-08-05 16:57:01 status half-installed liberror-perl:all 0.17029-2
3510:2025-08-05 16:57:01 status unpacked liberror-perl:all 0.17029-2
4938:2025-08-05 16:57:28 configure liberror-perl:all 0.17029-2 <none>
4939:2025-08-05 16:57:28 status unpacked liberror-perl:all 0.17029-2
4940:2025-08-05 16:57:28 status half-configured liberror-perl:all 0.17029-2
4941:2025-08-05 16:57:28 status installed liberror-perl:all 0.17029-2
```
✅ Exit code: 0

**💻 Command:**
```bash
grep -n error dpkg.log.1
```

**🖥️ Output:**
```
165:2025-08-05 16:55:25 install libgpg-error0:amd64 <none> 1.47-3build2
166:2025-08-05 16:55:25 status half-installed libgpg-error0:amd64 1.47-3build2
167:2025-08-05 16:55:25 status unpacked libgpg-error0:amd64 1.47-3build2
371:2025-08-05 16:55:27 configure libgpg-error0:amd64 1.47-3build2 <none>
372:2025-08-05 16:55:27 status unpacked libgpg-error0:amd64 1.47-3build2
373:2025-08-05 16:55:27 status half-configured libgpg-error0:amd64 1.47-3build2
374:2025-08-05 16:55:27 status installed libgpg-error0:amd64 1.47-3build2
1645:2025-08-05 16:55:59 install libgpg-error-l10n:all <none> 1.47-3build2
1646:2025-08-05 16:55:59 status half-installed libgpg-error-l10n:all 1.47-3build2
1647:2025-08-05 16:55:59 status unpacked libgpg-error-l10n:all 1.47-3build2
1673:2025-08-05 16:56:00 configure libgpg-error-l10n:all 1.47-3build2 <none>
1674:2025-08-05 16:56:00 status unpacked libgpg-error-l10n:all 1.47-3build2
1675:2025-08-05 16:56:00 status half-configured libgpg-error-l10n:all 1.47-3build2
1676:2025-08-05 16:56:00 status installed libgpg-error-l10n:all 1.47-3build2
2206:2025-08-05 16:56:32 upgrade libgpg-error-l10n:all 1.47-3build2 1.47-3build2.1
2207:2025-08-05 16:56:32 status half-configured libgpg-error-l10n:all 1.47-3build2
2208:2025-08-05 16:56:32 status unpacked libgpg-error-l10n:all 1.47-3build2
2209:2025-08-05 16:56:32 status half-installed libgpg-error-l10n:all 1.47-3build2
2210:2025-08-05 16:56:32 status unpacked libgpg-error-l10n:all 1.47-3build2.1
2211:2025-08-05 16:56:32 upgrade libgpg-error0:amd64 1.47-3build2 1.47-3build2.1
2212:2025-08-05 16:56:32 status half-configured libgpg-error0:amd64 1.47-3build2
2213:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2
2214:2025-08-05 16:56:32 status half-installed libgpg-error0:amd64 1.47-3build2
2215:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2.1
2217:2025-08-05 16:56:32 configure libgpg-error0:amd64 1.47-3build2.1 <none>
2218:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2.1
2219:2025-08-05 16:56:32 status half-configured libgpg-error0:amd64 1.47-3build2.1
2220:2025-08-05 16:56:32 status installed libgpg-error0:amd64 1.47-3build2.1
2833:2025-08-05 16:56:39 configure libgpg-error-l10n:all 1.47-3build2.1 <none>
2834:2025-08-05 16:56:39 status unpacked libgpg-error-l10n:all 1.47-3build2.1
2835:2025-08-05 16:56:39 status half-configured libgpg-error-l10n:all 1.47-3build2.1
2836:2025-08-05 16:56:39 status installed libgpg-error-l10n:all 1.47-3build2.1
3508:2025-08-05 16:57:01 install liberror-perl:all <none> 0.17029-2
3509:2025-08-05 16:57:01 status half-installed liberror-perl:all 0.17029-2
3510:2025-08-05 16:57:01 status unpacked liberror-perl:all 0.17029-2
4938:2025-08-05 16:57:28 configure liberror-perl:all 0.17029-2 <none>
4939:2025-08-05 16:57:28 status unpacked liberror-perl:all 0.17029-2
4940:2025-08-05 16:57:28 status half-configured liberror-perl:all 0.17029-2
4941:2025-08-05 16:57:28 status installed liberror-perl:all 0.17029-2
```
✅ Exit code: 0

**💻 Command:**
```bash
grep -n error dpkg.log.1
```

**🖥️ Output:**
```
165:2025-08-05 16:55:25 install libgpg-error0:amd64 <none> 1.47-3build2
166:2025-08-05 16:55:25 status half-installed libgpg-error0:amd64 1.47-3build2
167:2025-08-05 16:55:25 status unpacked libgpg-error0:amd64 1.47-3build2
371:2025-08-05 16:55:27 configure libgpg-error0:amd64 1.47-3build2 <none>
372:2025-08-05 16:55:27 status unpacked libgpg-error0:amd64 1.47-3build2
373:2025-08-05 16:55:27 status half-configured libgpg-error0:amd64 1.47-3build2
374:2025-08-05 16:55:27 status installed libgpg-error0:amd64 1.47-3build2
1645:2025-08-05 16:55:59 install libgpg-error-l10n:all <none> 1.47-3build2
1646:2025-08-05 16:55:59 status half-installed libgpg-error-l10n:all 1.47-3build2
1647:2025-08-05 16:55:59 status unpacked libgpg-error-l10n:all 1.47-3build2
1673:2025-08-05 16:56:00 configure libgpg-error-l10n:all 1.47-3build2 <none>
1674:2025-08-05 16:56:00 status unpacked libgpg-error-l10n:all 1.47-3build2
1675:2025-08-05 16:56:00 status half-configured libgpg-error-l10n:all 1.47-3build2
1676:2025-08-05 16:56:00 status installed libgpg-error-l10n:all 1.47-3build2
2206:2025-08-05 16:56:32 upgrade libgpg-error-l10n:all 1.47-3build2 1.47-3build2.1
2207:2025-08-05 16:56:32 status half-configured libgpg-error-l10n:all 1.47-3build2
2208:2025-08-05 16:56:32 status unpacked libgpg-error-l10n:all 1.47-3build2
2209:2025-08-05 16:56:32 status half-installed libgpg-error-l10n:all 1.47-3build2
2210:2025-08-05 16:56:32 status unpacked libgpg-error-l10n:all 1.47-3build2.1
2211:2025-08-05 16:56:32 upgrade libgpg-error0:amd64 1.47-3build2 1.47-3build2.1
2212:2025-08-05 16:56:32 status half-configured libgpg-error0:amd64 1.47-3build2
2213:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2
2214:2025-08-05 16:56:32 status half-installed libgpg-error0:amd64 1.47-3build2
2215:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2.1
2217:2025-08-05 16:56:32 configure libgpg-error0:amd64 1.47-3build2.1 <none>
2218:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2.1
2219:2025-08-05 16:56:32 status half-configured libgpg-error0:amd64 1.47-3build2.1
2220:2025-08-05 16:56:32 status installed libgpg-error0:amd64 1.47-3build2.1
2833:2025-08-05 16:56:39 configure libgpg-error-l10n:all 1.47-3build2.1 <none>
2834:2025-08-05 16:56:39 status unpacked libgpg-error-l10n:all 1.47-3build2.1
2835:2025-08-05 16:56:39 status half-configured libgpg-error-l10n:all 1.47-3build2.1
2836:2025-08-05 16:56:39 status installed libgpg-error-l10n:all 1.47-3build2.1
3508:2025-08-05 16:57:01 install liberror-perl:all <none> 0.17029-2
3509:2025-08-05 16:57:01 status half-installed liberror-perl:all 0.17029-2
3510:2025-08-05 16:57:01 status unpacked liberror-perl:all 0.17029-2
4938:2025-08-05 16:57:28 configure liberror-perl:all 0.17029-2 <none>
4939:2025-08-05 16:57:28 status unpacked liberror-perl:all 0.17029-2
4940:2025-08-05 16:57:28 status half-configured liberror-perl:all 0.17029-2
4941:2025-08-05 16:57:28 status installed liberror-perl:all 0.17029-2
```
✅ Exit code: 0

- 📝 opsi -n digunakan untuk menampilkan nomor pada pattern yang mach
**✅ 2026-01-09 13:55:36 - Status:** COMPLETED

**💻 Command:**
```bash
grep -ra error .
```

**🖥️ Output:**
```
./dpkg.log.1:2025-08-05 16:55:25 install libgpg-error0:amd64 <none> 1.47-3build2
./dpkg.log.1:2025-08-05 16:55:25 status half-installed libgpg-error0:amd64 1.47-3build2
./dpkg.log.1:2025-08-05 16:55:25 status unpacked libgpg-error0:amd64 1.47-3build2
./dpkg.log.1:2025-08-05 16:55:27 configure libgpg-error0:amd64 1.47-3build2 <none>
./dpkg.log.1:2025-08-05 16:55:27 status unpacked libgpg-error0:amd64 1.47-3build2
./dpkg.log.1:2025-08-05 16:55:27 status half-configured libgpg-error0:amd64 1.47-3build2
./dpkg.log.1:2025-08-05 16:55:27 status installed libgpg-error0:amd64 1.47-3build2
./dpkg.log.1:2025-08-05 16:55:59 install libgpg-error-l10n:all <none> 1.47-3build2
./dpkg.log.1:2025-08-05 16:55:59 status half-installed libgpg-error-l10n:all 1.47-3build2
./dpkg.log.1:2025-08-05 16:55:59 status unpacked libgpg-error-l10n:all 1.47-3build2
./dpkg.log.1:2025-08-05 16:56:00 configure libgpg-error-l10n:all 1.47-3build2 <none>
./dpkg.log.1:2025-08-05 16:56:00 status unpacked libgpg-error-l10n:all 1.47-3build2
./dpkg.log.1:2025-08-05 16:56:00 status half-configured libgpg-error-l10n:all 1.47-3build2
./dpkg.log.1:2025-08-05 16:56:00 status installed libgpg-error-l10n:all 1.47-3build2
./dpkg.log.1:2025-08-05 16:56:32 upgrade libgpg-error-l10n:all 1.47-3build2 1.47-3build2.1
./dpkg.log.1:2025-08-05 16:56:32 status half-configured libgpg-error-l10n:all 1.47-3build2
./dpkg.log.1:2025-08-05 16:56:32 status unpacked libgpg-error-l10n:all 1.47-3build2
./dpkg.log.1:2025-08-05 16:56:32 status half-installed libgpg-error-l10n:all 1.47-3build2
./dpkg.log.1:2025-08-05 16:56:32 status unpacked libgpg-error-l10n:all 1.47-3build2.1
./dpkg.log.1:2025-08-05 16:56:32 upgrade libgpg-error0:amd64 1.47-3build2 1.47-3build2.1
./dpkg.log.1:2025-08-05 16:56:32 status half-configured libgpg-error0:amd64 1.47-3build2
./dpkg.log.1:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2
./dpkg.log.1:2025-08-05 16:56:32 status half-installed libgpg-error0:amd64 1.47-3build2
./dpkg.log.1:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2.1
./dpkg.log.1:2025-08-05 16:56:32 configure libgpg-error0:amd64 1.47-3build2.1 <none>
./dpkg.log.1:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2.1
./dpkg.log.1:2025-08-05 16:56:32 status half-configured libgpg-error0:amd64 1.47-3build2.1
./dpkg.log.1:2025-08-05 16:56:32 status installed libgpg-error0:amd64 1.47-3build2.1
./dpkg.log.1:2025-08-05 16:56:39 configure libgpg-error-l10n:all 1.47-3build2.1 <none>
./dpkg.log.1:2025-08-05 16:56:39 status unpacked libgpg-error-l10n:all 1.47-3build2.1
./dpkg.log.1:2025-08-05 16:56:39 status half-configured libgpg-error-l10n:all 1.47-3build2.1
./dpkg.log.1:2025-08-05 16:56:39 status installed libgpg-error-l10n:all 1.47-3build2.1
./dpkg.log.1:2025-08-05 16:57:01 install liberror-perl:all <none> 0.17029-2
./dpkg.log.1:2025-08-05 16:57:01 status half-installed liberror-perl:all 0.17029-2
./dpkg.log.1:2025-08-05 16:57:01 status unpacked liberror-perl:all 0.17029-2
./dpkg.log.1:2025-08-05 16:57:28 configure liberror-perl:all 0.17029-2 <none>
./dpkg.log.1:2025-08-05 16:57:28 status unpacked liberror-perl:all 0.17029-2
./dpkg.log.1:2025-08-05 16:57:28 status half-configured liberror-perl:all 0.17029-2
./dpkg.log.1:2025-08-05 16:57:28 status installed liberror-perl:all 0.17029-2
./bootstrap.log:2025-08-05 16:55:04 URL:http://ftpmaster.internal/ubuntu/pool/main/libg/libgpg-error/libgpg-error0_1.47-3build2_amd64.deb [69990/69990] -> "/build/chroot//var/cache/apt/archives/partial/libgpg-error0_1.47-3build2_amd64.deb" [1]
./bootstrap.log:Selecting previously unselected package libgpg-error0:amd64.
./bootstrap.log:Preparing to unpack .../libgpg-error0_1.47-3build2_amd64.deb ...
./bootstrap.log:Unpacking libgpg-error0:amd64 (1.47-3build2) ...
./bootstrap.log:Setting up libgpg-error0:amd64 (1.47-3build2) ...
./syslog:2026-01-04T21:20:38.459229+07:00 DESKTOP-V7H7ICQ systemd[1]: apport-autoreport.path - Process error reports when automatic reporting is enabled (file watch) was skipped because of an unmet condition check (ConditionPathExists=/var/lib/apport/autoreport).
./syslog:2026-01-04T21:20:38.459235+07:00 DESKTOP-V7H7ICQ systemd[1]: apport-autoreport.timer - Process error reports when automatic reporting is enabled (timer based) was skipped because of an unmet condition check (ConditionPathExists=/var/lib/apport/autoreport).
./syslog:2026-01-05T08:27:31.573874+07:00 DESKTOP-V7H7ICQ systemd[1]: apport-autoreport.path - Process error reports when automatic reporting is enabled (file watch) was skipped because of an unmet condition check (ConditionPathExists=/var/lib/apport/autoreport).
./syslog:2026-01-05T08:27:31.573881+07:00 DESKTOP-V7H7ICQ systemd[1]: apport-autoreport.timer - Process error reports when automatic reporting is enabled (timer based) was skipped because of an unmet condition check (ConditionPathExists=/var/lib/apport/autoreport).
./syslog:2026-01-05T12:38:27.440270+07:00 DESKTOP-V7H7ICQ systemd[1]: apport-autoreport.path - Process error reports when automatic reporting is enabled (file watch) was skipped because of an unmet condition check (ConditionPathExists=/var/lib/apport/autoreport).
./syslog:2026-01-05T12:38:27.440276+07:00 DESKTOP-V7H7ICQ systemd[1]: apport-autoreport.timer - Process error reports when automatic reporting is enabled (timer based) was skipped because of an unmet condition check (ConditionPathExists=/var/lib/apport/autoreport).
... (91 lines, showing first 50)
```
❌ Exit code: 2

- 📝 opsi -r digunakan untuk recrusive mencari semua pattern dalam file yang cocok
**💻 Command:**
```bash
grep -lr .log .
```

**🖥️ Output:**
```
./dpkg.log.1
./bootstrap.log
./syslog
grep: ./private: Permission denied
grep: ./btmp: Permission denied
./kern.log.1
./kern.log
./dmesg
grep: ./btmp.1: Permission denied
./syslog.1
./auth.log
./auth.log.1
./unattended-upgrades/unattended-upgrades.log
./dmesg.0
```
❌ Exit code: 2

- 📝 opsi -l digunakan untuk mencari file, ini tidak bisa dimasukan ke log karena ada folder yang dibatasi permission
**✅ 2026-01-09 13:59:36 - Status:** COMPLETED

**💻 Command:**
```bash
grep -n error dpkg.log.1
```

**🖥️ Output:**
```
165:2025-08-05 16:55:25 install libgpg-error0:amd64 <none> 1.47-3build2
166:2025-08-05 16:55:25 status half-installed libgpg-error0:amd64 1.47-3build2
167:2025-08-05 16:55:25 status unpacked libgpg-error0:amd64 1.47-3build2
371:2025-08-05 16:55:27 configure libgpg-error0:amd64 1.47-3build2 <none>
372:2025-08-05 16:55:27 status unpacked libgpg-error0:amd64 1.47-3build2
373:2025-08-05 16:55:27 status half-configured libgpg-error0:amd64 1.47-3build2
374:2025-08-05 16:55:27 status installed libgpg-error0:amd64 1.47-3build2
1645:2025-08-05 16:55:59 install libgpg-error-l10n:all <none> 1.47-3build2
1646:2025-08-05 16:55:59 status half-installed libgpg-error-l10n:all 1.47-3build2
1647:2025-08-05 16:55:59 status unpacked libgpg-error-l10n:all 1.47-3build2
1673:2025-08-05 16:56:00 configure libgpg-error-l10n:all 1.47-3build2 <none>
1674:2025-08-05 16:56:00 status unpacked libgpg-error-l10n:all 1.47-3build2
1675:2025-08-05 16:56:00 status half-configured libgpg-error-l10n:all 1.47-3build2
1676:2025-08-05 16:56:00 status installed libgpg-error-l10n:all 1.47-3build2
2206:2025-08-05 16:56:32 upgrade libgpg-error-l10n:all 1.47-3build2 1.47-3build2.1
2207:2025-08-05 16:56:32 status half-configured libgpg-error-l10n:all 1.47-3build2
2208:2025-08-05 16:56:32 status unpacked libgpg-error-l10n:all 1.47-3build2
2209:2025-08-05 16:56:32 status half-installed libgpg-error-l10n:all 1.47-3build2
2210:2025-08-05 16:56:32 status unpacked libgpg-error-l10n:all 1.47-3build2.1
2211:2025-08-05 16:56:32 upgrade libgpg-error0:amd64 1.47-3build2 1.47-3build2.1
2212:2025-08-05 16:56:32 status half-configured libgpg-error0:amd64 1.47-3build2
2213:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2
2214:2025-08-05 16:56:32 status half-installed libgpg-error0:amd64 1.47-3build2
2215:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2.1
2217:2025-08-05 16:56:32 configure libgpg-error0:amd64 1.47-3build2.1 <none>
2218:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2.1
2219:2025-08-05 16:56:32 status half-configured libgpg-error0:amd64 1.47-3build2.1
2220:2025-08-05 16:56:32 status installed libgpg-error0:amd64 1.47-3build2.1
2833:2025-08-05 16:56:39 configure libgpg-error-l10n:all 1.47-3build2.1 <none>
2834:2025-08-05 16:56:39 status unpacked libgpg-error-l10n:all 1.47-3build2.1
2835:2025-08-05 16:56:39 status half-configured libgpg-error-l10n:all 1.47-3build2.1
2836:2025-08-05 16:56:39 status installed libgpg-error-l10n:all 1.47-3build2.1
3508:2025-08-05 16:57:01 install liberror-perl:all <none> 0.17029-2
3509:2025-08-05 16:57:01 status half-installed liberror-perl:all 0.17029-2
3510:2025-08-05 16:57:01 status unpacked liberror-perl:all 0.17029-2
4938:2025-08-05 16:57:28 configure liberror-perl:all 0.17029-2 <none>
4939:2025-08-05 16:57:28 status unpacked liberror-perl:all 0.17029-2
4940:2025-08-05 16:57:28 status half-configured liberror-perl:all 0.17029-2
4941:2025-08-05 16:57:28 status installed liberror-perl:all 0.17029-2
```
✅ Exit code: 0


### 2026-01-09 14:01:41 - opsi -A N digunakan untuk menampilkan baris setelah conteks baris yang dicari
**💻 Command:**
```bash
grep -n -A 2 error dpkg.log.1
```

**🖥️ Output:**
```
165:2025-08-05 16:55:25 install libgpg-error0:amd64 <none> 1.47-3build2
166:2025-08-05 16:55:25 status half-installed libgpg-error0:amd64 1.47-3build2
167:2025-08-05 16:55:25 status unpacked libgpg-error0:amd64 1.47-3build2
168-2025-08-05 16:55:25 install liblz4-1:amd64 <none> 1.9.4-1build1
169-2025-08-05 16:55:25 status half-installed liblz4-1:amd64 1.9.4-1build1
--
371:2025-08-05 16:55:27 configure libgpg-error0:amd64 1.47-3build2 <none>
372:2025-08-05 16:55:27 status unpacked libgpg-error0:amd64 1.47-3build2
373:2025-08-05 16:55:27 status half-configured libgpg-error0:amd64 1.47-3build2
374:2025-08-05 16:55:27 status installed libgpg-error0:amd64 1.47-3build2
375-2025-08-05 16:55:27 configure libssl3t64:amd64 3.0.13-0ubuntu3 <none>
376-2025-08-05 16:55:27 status unpacked libssl3t64:amd64 3.0.13-0ubuntu3
--
1645:2025-08-05 16:55:59 install libgpg-error-l10n:all <none> 1.47-3build2
1646:2025-08-05 16:55:59 status half-installed libgpg-error-l10n:all 1.47-3build2
1647:2025-08-05 16:55:59 status unpacked libgpg-error-l10n:all 1.47-3build2
1648-2025-08-05 16:56:00 startup packages configure
1649-2025-08-05 16:56:00 configure libgpm2:amd64 1.20.7-11 <none>
--
1673:2025-08-05 16:56:00 configure libgpg-error-l10n:all 1.47-3build2 <none>
1674:2025-08-05 16:56:00 status unpacked libgpg-error-l10n:all 1.47-3build2
1675:2025-08-05 16:56:00 status half-configured libgpg-error-l10n:all 1.47-3build2
1676:2025-08-05 16:56:00 status installed libgpg-error-l10n:all 1.47-3build2
1677-2025-08-05 16:56:00 trigproc libc-bin:amd64 2.39-0ubuntu8 <none>
1678-2025-08-05 16:56:00 status half-configured libc-bin:amd64 2.39-0ubuntu8
--
2206:2025-08-05 16:56:32 upgrade libgpg-error-l10n:all 1.47-3build2 1.47-3build2.1
2207:2025-08-05 16:56:32 status half-configured libgpg-error-l10n:all 1.47-3build2
2208:2025-08-05 16:56:32 status unpacked libgpg-error-l10n:all 1.47-3build2
2209:2025-08-05 16:56:32 status half-installed libgpg-error-l10n:all 1.47-3build2
2210:2025-08-05 16:56:32 status unpacked libgpg-error-l10n:all 1.47-3build2.1
2211:2025-08-05 16:56:32 upgrade libgpg-error0:amd64 1.47-3build2 1.47-3build2.1
2212:2025-08-05 16:56:32 status half-configured libgpg-error0:amd64 1.47-3build2
2213:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2
2214:2025-08-05 16:56:32 status half-installed libgpg-error0:amd64 1.47-3build2
2215:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2.1
2216-2025-08-05 16:56:32 startup packages configure
2217:2025-08-05 16:56:32 configure libgpg-error0:amd64 1.47-3build2.1 <none>
2218:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2.1
2219:2025-08-05 16:56:32 status half-configured libgpg-error0:amd64 1.47-3build2.1
2220:2025-08-05 16:56:32 status installed libgpg-error0:amd64 1.47-3build2.1
2221-2025-08-05 16:56:32 startup archives unpack
2222-2025-08-05 16:56:32 upgrade gpgv:amd64 2.4.4-2ubuntu17 2.4.4-2ubuntu17.3
--
2833:2025-08-05 16:56:39 configure libgpg-error-l10n:all 1.47-3build2.1 <none>
2834:2025-08-05 16:56:39 status unpacked libgpg-error-l10n:all 1.47-3build2.1
2835:2025-08-05 16:56:39 status half-configured libgpg-error-l10n:all 1.47-3build2.1
2836:2025-08-05 16:56:39 status installed libgpg-error-l10n:all 1.47-3build2.1
2837-2025-08-05 16:56:39 configure libpam-cap:amd64 1:2.66-5ubuntu2.2 <none>
2838-2025-08-05 16:56:39 status unpacked libpam-cap:amd64 1:2.66-5ubuntu2.2
... (63 lines, showing first 50)
```
✅ Exit code: 0

- 📝 dapat dilihat bahwa setelah pencarian baris yang ada kata error nya akan menampilkan baris setelahnya

### 2026-01-09 14:04:15 - opsi -B N digunakan untuk melihat baris sebelum contex pettern ditemukan
**💻 Command:**
```bash
grep -n -B 2 error dpkg.log.1
```

**🖥️ Output:**
```
163-2025-08-05 16:55:25 status half-installed libgmp10:amd64 2:6.3.0+dfsg-2ubuntu6
164-2025-08-05 16:55:25 status unpacked libgmp10:amd64 2:6.3.0+dfsg-2ubuntu6
165:2025-08-05 16:55:25 install libgpg-error0:amd64 <none> 1.47-3build2
166:2025-08-05 16:55:25 status half-installed libgpg-error0:amd64 1.47-3build2
167:2025-08-05 16:55:25 status unpacked libgpg-error0:amd64 1.47-3build2
--
369-2025-08-05 16:55:27 status half-configured liblzma5:amd64 5.6.1+really5.4.5-1
370-2025-08-05 16:55:27 status installed liblzma5:amd64 5.6.1+really5.4.5-1
371:2025-08-05 16:55:27 configure libgpg-error0:amd64 1.47-3build2 <none>
372:2025-08-05 16:55:27 status unpacked libgpg-error0:amd64 1.47-3build2
373:2025-08-05 16:55:27 status half-configured libgpg-error0:amd64 1.47-3build2
374:2025-08-05 16:55:27 status installed libgpg-error0:amd64 1.47-3build2
--
1643-2025-08-05 16:55:59 status half-installed e2fsprogs-l10n:all 1.47.0-2.4~exp1ubuntu4
1644-2025-08-05 16:55:59 status unpacked e2fsprogs-l10n:all 1.47.0-2.4~exp1ubuntu4
1645:2025-08-05 16:55:59 install libgpg-error-l10n:all <none> 1.47-3build2
1646:2025-08-05 16:55:59 status half-installed libgpg-error-l10n:all 1.47-3build2
1647:2025-08-05 16:55:59 status unpacked libgpg-error-l10n:all 1.47-3build2
--
1671-2025-08-05 16:56:00 status half-configured uuid-runtime:amd64 2.39.3-9ubuntu6
1672-2025-08-05 16:56:00 status installed uuid-runtime:amd64 2.39.3-9ubuntu6
1673:2025-08-05 16:56:00 configure libgpg-error-l10n:all 1.47-3build2 <none>
1674:2025-08-05 16:56:00 status unpacked libgpg-error-l10n:all 1.47-3build2
1675:2025-08-05 16:56:00 status half-configured libgpg-error-l10n:all 1.47-3build2
1676:2025-08-05 16:56:00 status installed libgpg-error-l10n:all 1.47-3build2
--
2204-2025-08-05 16:56:32 status half-installed apt-utils:amd64 2.7.14build2
2205-2025-08-05 16:56:32 status unpacked apt-utils:amd64 2.8.3
2206:2025-08-05 16:56:32 upgrade libgpg-error-l10n:all 1.47-3build2 1.47-3build2.1
2207:2025-08-05 16:56:32 status half-configured libgpg-error-l10n:all 1.47-3build2
2208:2025-08-05 16:56:32 status unpacked libgpg-error-l10n:all 1.47-3build2
2209:2025-08-05 16:56:32 status half-installed libgpg-error-l10n:all 1.47-3build2
2210:2025-08-05 16:56:32 status unpacked libgpg-error-l10n:all 1.47-3build2.1
2211:2025-08-05 16:56:32 upgrade libgpg-error0:amd64 1.47-3build2 1.47-3build2.1
2212:2025-08-05 16:56:32 status half-configured libgpg-error0:amd64 1.47-3build2
2213:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2
2214:2025-08-05 16:56:32 status half-installed libgpg-error0:amd64 1.47-3build2
2215:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2.1
2216-2025-08-05 16:56:32 startup packages configure
2217:2025-08-05 16:56:32 configure libgpg-error0:amd64 1.47-3build2.1 <none>
2218:2025-08-05 16:56:32 status unpacked libgpg-error0:amd64 1.47-3build2.1
2219:2025-08-05 16:56:32 status half-configured libgpg-error0:amd64 1.47-3build2.1
2220:2025-08-05 16:56:32 status installed libgpg-error0:amd64 1.47-3build2.1
--
2831-2025-08-05 16:56:39 status half-configured libbsd0:amd64 0.12.1-1build1.1
2832-2025-08-05 16:56:39 status installed libbsd0:amd64 0.12.1-1build1.1
2833:2025-08-05 16:56:39 configure libgpg-error-l10n:all 1.47-3build2.1 <none>
2834:2025-08-05 16:56:39 status unpacked libgpg-error-l10n:all 1.47-3build2.1
2835:2025-08-05 16:56:39 status half-configured libgpg-error-l10n:all 1.47-3build2.1
2836:2025-08-05 16:56:39 status installed libgpg-error-l10n:all 1.47-3build2.1
... (63 lines, showing first 50)
```
✅ Exit code: 0

**✅ 2026-01-09 14:10:59 - Status:** COMPLETED


### 2026-01-09 14:11:46 - opsi -E - extended regex
**💻 Command:**
```bash
pwd
```

**🖥️ Output:**
```
/home/faris-al-fatih/linux-practical/lab/02-pencarian-dan-filtering/2-2_pencarian-pola-text
```
✅ Exit code: 0

**💻 Command:**
```bash
ls
```

**🖥️ Output:**
```
btc30days_clean.csv
```
✅ Exit code: 0

**💻 Command:**
```bash
cat btc30days_clean.csv
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
2025-12-24,87486.00000000,88049.89000000,86420.00000000,87669.45000000,9140.84320000
2025-12-25,87669.44000000,88592.74000000,86934.72000000,87225.27000000,7096.58235000
2025-12-26,87225.27000000,89567.75000000,86655.08000000,87369.56000000,18344.61505000
2025-12-27,87369.56000000,87984.00000000,87253.05000000,87877.01000000,4469.55156000
2025-12-28,87877.00000000,88088.75000000,87435.00000000,87952.71000000,4446.29285000
2025-12-29,87952.71000000,90406.08000000,86806.50000000,87237.13000000,19894.98575000
2025-12-30,87237.13000000,89400.00000000,86845.66000000,88485.49000000,13105.91001000
2025-12-31,88485.50000000,89200.00000000,87250.00000000,87648.22000000,11558.62047000
2026-01-01,87648.21000000,88919.45000000,87550.43000000,88839.04000000,6279.57133000
2026-01-02,88839.05000000,90961.81000000,88379.88000000,89995.13000000,17396.97301000
2026-01-03,89995.14000000,90741.16000000,89314.01000000,90628.01000000,7057.46716000
2026-01-04,90628.01000000,91810.00000000,90628.00000000,91529.73000000,10426.52970000
2026-01-05,91529.74000000,94789.08000000,91514.81000000,93859.71000000,20673.59584000
2026-01-06,93859.71000000,94444.44000000,91262.94000000,93747.97000000,18546.41829000
2026-01-07,93747.97000000,93747.97000000,90675.52000000,91364.16000000,14276.49025000
```
✅ Exit code: 0

**💻 Command:**
```bash
grep -E 12-1[1-4] btc30days_clean.csv
```

**🖥️ Output:**
```
2025-12-11,92015.38000000,93555.00000000,89260.63000000,92513.38000000,19972.58758000
2025-12-12,92513.38000000,92754.00000000,89480.00000000,90268.42000000,16679.19169000
2025-12-13,90268.43000000,90634.55000000,89766.39000000,90240.01000000,5895.70788000
2025-12-14,90240.00000000,90472.40000000,87577.36000000,88172.17000000,9416.94004000
```
✅ Exit code: 0

- 📝 opsi -E digunakan untuk penambahan regex
**💻 Command:**
```bash
grep 12-1[1-4] btc30days_clean.csv
```

**🖥️ Output:**
```
2025-12-11,92015.38000000,93555.00000000,89260.63000000,92513.38000000,19972.58758000
2025-12-12,92513.38000000,92754.00000000,89480.00000000,90268.42000000,16679.19169000
2025-12-13,90268.43000000,90634.55000000,89766.39000000,90240.01000000,5895.70788000
2025-12-14,90240.00000000,90472.40000000,87577.36000000,88172.17000000,9416.94004000
```
✅ Exit code: 0

- 📝 karena pattern sederhana mangkannya tanpa -E tetap bisa, jika kompleks menggunakan | masih butuh opsi -E
**✅ 2026-01-09 14:21:06 - Status:** COMPLETED


### 2026-01-09 14:22:26 - opsi -o digunakan untuk hanya menampilkan pola dalam pettern tidak 1 baris utuh
**💻 Command:**
```bash
grep 2025-12-11
```

**🖥️ Output:**
```
**❌ 2026-01-09 14:22:49 - Status:** FAILED

**💻 Command:**
```bash
grep 2025-12-11 btc30days_clean.csv
```

**🖥️ Output:**
```
2025-12-11,92015.38000000,93555.00000000,89260.63000000,92513.38000000,19972.58758000
```
✅ Exit code: 0

**💻 Command:**
```bash
grep -o 2025-12-11 btc30days_clean.csv
```

**🖥️ Output:**
```
2025-12-11
```
✅ Exit code: 0

- 📝 yang ditampilkan itu hannya patternnya saja
**✅ 2026-01-09 14:23:35 - Status:** COMPLETED


---

## 📊 2026-01-09 14:23:41 - Session Summary

- **Total exercises:** 1
- **Completed:** 9
- **Failed:** 1

