#!/bin/sh
set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing database..."
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

mysqld_safe --datadir=/var/lib/mysql &

sleep 10

mysql -u root -p"${MARIADB_ROOT_PWD}" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};
    CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'localhost' IDENTIFIED BY '${MARIADB_PWD}';
    GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'localhost';
    FLUSH PRIVILEGES;
EOSQL

mysql -u root -p"${MARIADB_ROOT_PWD}" <<-EOSQL
    CREATE USER IF NOT EXISTS '${WP_DB_USER}'@'localhost' IDENTIFIED BY '${WP_DB_PWD}';
    GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${WP_DB_USER}'@'localhost';
    FLUSH PRIVILEGES;
EOSQL

# Wait for MariaDB to stop
wait

# -- 조회 관련 명령어
# -- SELECT USER(); -- 현재 접속한 계정 정보
# -- SHOW DATABASES; -- DB 목록 조회
# -- SHOW GRANTS FOR 'seokjyan'@'localhost'; -- 계정 권한 조회
# -- SELECT User, Host FROM mysql.user; -- 계정 목록 조회


# 1. wp cli wordpress
# 2. 게시글처럼 기록을 남길 수 있을걸 같은거 써본다.
# 3. maria db에 갱신이 되는지 확인을 해본다.
#   -> 안됐으면 my.cnf를 복사하는 것을 검토한다. 이때 경로를 잘 설정해볼 것.