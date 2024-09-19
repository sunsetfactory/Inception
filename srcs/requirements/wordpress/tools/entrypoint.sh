#!/bin/bash
# set -e

# wp-cli를 wget 명령어로 다운로드하고 실행 권한을 부여합니다
wget -q -O /usr/local/bin/wp "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
chmod +x /usr/local/bin/wp

# 워드프레스 설치 여부 확인
if [ ! -f /var/www/html/wp-config.php ]; then
  echo "WordPress가 설치되어 있지 않습니다. 설치를 시작합니다..."
  
  echo "Waiting for MariaDB to be ready..."
  until mysql -h"${WP_DB_HOST}" -u"${WP_DB_USER}" -p"${WP_DB_PWD}" -e "SHOW DATABASES;" > /dev/null 2>&1; do
    sleep 1
  done

  # WordPress 다운로드 및 설정
  wp core download --path="/var/www/html" --allow-root

  # /var/www/html 디렉토리로 이동하여 wp-config.php 파일 생성
  cd /var/www/html || exit
  pwd
  wp config create \
      --dbname="${MARIADB_DATABASE}" \
      --dbuser="${WP_DB_USER}" \
      --dbpass="${WP_DB_PWD}" \
      --dbhost="${WP_DB_HOST}" \
      --allow-root

  # 워드프레스 설치
  wp core install \
      --url="${DOMAIN_NAME}" \
      --title="${WP_TITLE}" \
      --admin_user="${WP_ADMIN_NAME}" \
      --admin_password="${WP_ADMIN_PWD}" \
      --admin_email="${WP_ADMIN_EMAIL}" \
      --allow-root

  # 추가 사용자 생성
  wp user create \
      "${WP_USER_NAME}" "${WP_USER_EMAIL}" \
      --user_pass="${WP_USER_PWD}" \
      --allow-root

  echo "WordPress 설치가 완료되었습니다."
else
  echo "WordPress가 이미 설치되어 있습니다."
fi

# PHP-FPM을 포그라운드 모드로 실행
php-fpm83 --nodaemonize
