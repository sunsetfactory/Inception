#!/bin/bash
set -e

# 워드프레스를 다운로드하고 압축을 풉니다
# wget -O /tmp/wordpress.tar.gz "http://wordpress.org/latest.tar.gz"
# tar -xvzf /tmp/wordpress.tar.gz --strip-components=1 -C /var/www/html


wget -O /tmp/wordpress.tar.gz "http://wordpress.org/latest.tar.gz"
tar --strip-components=1 -xvzf /tmp/wordpress.tar.gz -C /var/www/html

php-fpm82 --nodaemonize