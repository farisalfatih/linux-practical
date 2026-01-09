#!/usr/bin/env bash
# ============================================================
# Script: generate_sort_uniq_data.sh
# ============================================================

set -e

# numbers_numeric_opsi.txt
# -> data angka acak, beda digit, cocok untuk sort default vs -n vs -r
cat > numbers_numeric_opsi.txt << 'EOF'
10
2
100
25
3
7
42
EOF

# strings_duplicate_case_opsi.txt
# -> string dengan duplikat + beda huruf besar kecil
# -> cocok untuk sort | uniq, uniq -c, -d, -u, -i
cat > strings_duplicate_case_opsi.txt << 'EOF'
apple
banana
apple
Apple
banana
banana
APPLE
EOF

# users_csv_multicolumn_opsi.csv
# -> CSV 3 kolom (id,nama,saldo)
# -> cocok untuk sort -t -k multi-key dan deduplikasi
cat > users_csv_multicolumn_opsi.csv << 'EOF'
1001,andi,50000
1003,budi,75000
1002,andi,50000
1001,andi,50000
1002,Andi,50000
EOF

# logs_timestamp_duplicate_opsi.log
# -> log dengan timestamp + event duplikat
# -> cocok untuk sort kronologis dan uniq
cat > logs_timestamp_duplicate_opsi.log << 'EOF'
2025-01-01 login user1
2024-12-31 logout user2
2025-01-01 login user1
2025-01-02 login user3
2025-01-02 login user3
EOF

# filesize_human_readable_opsi.txt
# -> ukuran file campur (byte, K, M, G)
# -> cocok untuk sort -h
cat > filesize_human_readable_opsi.txt << 'EOF'
1K
500M
20K
2G
800
15M
EOF

# mixed_key_value_opsi.txt
# -> key:value dengan key duplikat
# -> cocok untuk sort -t ':' -k dan uniq berbasis field
cat > mixed_key_value_opsi.txt << 'EOF'
id1:100
id3:300
id2:200
id1:100
id2:200
EOF

# output file list
ls *_opsi.*
