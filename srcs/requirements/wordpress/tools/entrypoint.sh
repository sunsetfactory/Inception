#!/bin/bash
set -e

# 워드프레스를 다운로드하고 압축을 풉니다
wget -q -O /tmp/wordpress.tar.gz "https://wordpress.org/latest.tar.gz"
tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1

# wp-cli를 wget 명령어로 다운로드하고 실행 권한을 부여합니다
wget -q -O /usr/local/bin/wp "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
chmod +x /usr/local/bin/wp

php-fpm82 --nodaemonize