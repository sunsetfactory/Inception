#!/bin/sh
# 명령이 실패하면 스크립트를 종료합니다
set -e

# MariaDB를 백그라운드에서 시작합니다
mariadbd --user=mysql &

# MariaDB가 시작될 때까지 잠시 기다립니다
sleep 10

# # # 데이터베이스를 초기화합니다
# rm -rf /var/lib/mysql/*
# mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# test
# mysql -u root < /var/www/tools/init_db.sql

# main
mysql -uroot -p$MARIADB_ROOT_PWD -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
mysql -uroot -p$MARIADB_ROOT_PWD -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PWD';"
mysql -uroot -p$MARIADB_ROOT_PWD -e "CREATE USER IF NOT EXISTS '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PWD';"
mysql -uroot -p$MARIADB_ROOT_PWD -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' WITH GRANT OPTION;"
mysql -uroot -p$MARIADB_ROOT_PWD -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$WP_DB_USER'@'%' WITH GRANT OPTION;"
mysql -uroot -p$MARIADB_ROOT_PWD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PWD';"
mysql -uroot -p$MARIADB_ROOT_PWD -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$MARIADB_ROOT_PWD shutdown
# -u : 사용자명
# -p : 패스워드
# -e : 명령어

# 조회 관련 명령어
# SELECT USER(); -- 현재 접속한 계정 정보
# SHOW DATABASES; -- DB 목록 조회
# SHOW GRANTS FOR 'seokjyan'@'localhost'; -- 계정 권한 조회
# SELECT User, Host FROM mysql.user; -- 계정 목록 조회

# mariadbd
exec mysqld_safe 