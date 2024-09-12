#!/bin/bash
set -e

# 워드프레스를 다운로드하고 압축을 풉니다
wget -q -O /tmp/wordpress.tar.gz "https://wordpress.org/latest.tar.gz"
tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1

php-fpm82 --nodaemonize