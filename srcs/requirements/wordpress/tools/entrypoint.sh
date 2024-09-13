#!/bin/bash
# set -e

# wp-cli를 wget 명령어로 다운로드하고 실행 권한을 부여합니다
wget -q -O /usr/local/bin/wp "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
chmod +x /usr/local/bin/wp
두 내용에서 wordpress 쪽 wp-clid의 설정을 보완해줘 나는 설치와 db연결을 끝마치고 싶어
# 워드프레스 설치 여부 확인
if [ ! -f /var/www/html/wp-config.php ]; then
  echo "WordPress가 설치되어 있지 않습니다. 설치를 시작합니다..."

  rm -rf /var/www/html/*

  # WordPress 다운로드 및 설정
  wp core download --path="/var/www/html" --allow-root

  echo "WordPress 설치가 완료되었습니다."
else
  echo "WordPress가 이미 설치되어 있습니다."
fi

# PHP-FPM을 포그라운드 모드로 실행
php-fpm83 --nodaemonize
