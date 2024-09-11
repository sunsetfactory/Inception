#!/bin/sh
# 명령이 실패하면 스크립트를 종료합니다
set -e

# MariaDB를 백그라운드에서 시작합니다
mariadbd --user=mysql &

# MariaDB가 시작될 때까지 잠시 기다립니다
sleep 10

# # 데이터베이스를 초기화합니다
rm -rf /var/lib/mysql/*
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
mysql -u root < /var/www/tools/init_db.sql

# # 초기화 스크립트를 삭제합니다
# rm -f /var/www/tools/init_db.sql

# Wait for MariaDB to be ready and then bring it to the foreground
wait
