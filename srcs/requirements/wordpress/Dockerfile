FROM alpine:3.20

# 설치에 필요한 패키지 업데이트 및 설치
RUN apk update && apk add --no-cache \
	php82-common \
	php82-fpm \
	php82-mysqli \
	php82-curl \
	wget \
	curl

# 설정 파일 및 도구 복사
COPY ./tools /var/www/tools
COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf

# 스크립트에 실행 권한 부여
RUN chmod +x /var/www/tools/entrypoint.sh

# entrypoint.sh 실행
ENTRYPOINT [ "/bin/sh", "/var/www/tools/entrypoint.sh" ]