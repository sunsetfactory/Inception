FROM alpine:3.20

# 설치에 필요한 패키지 업데이트 및 설치
RUN apk update && apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-json \
    php83-curl \
    php83-mbstring \
    php83-dom \
    php83-xml \
    php83-gd \
    php83-opcache \
    php83-phar \
    php83-ctype \
    php83-openssl \
    php83-session \
    php83-tokenizer \
    wget \
    bash \
    mariadb-client

# 설정 파일 및 도구 복사
COPY ./tools /var/www/tools
COPY ./conf/www.conf /etc/php83/php-fpm.d/www.conf

# 스크립트에 실행 권한 부여
RUN chmod +x /var/www/tools/entrypoint.sh

# entrypoint.sh 실행
ENTRYPOINT [ "/bin/sh", "/var/www/tools/entrypoint.sh" ]