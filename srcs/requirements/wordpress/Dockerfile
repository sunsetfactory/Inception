# # Base image
# FROM alpine:3.19

# # 필요한 패키지 설치
# RUN	apk update && apk add --no-cache sudo
# RUN	apk add --no-cache bash

# # phpMyAdmin 설치
# RUN apk add --no-cache wget
# RUN wget -O /tmp/phpmyadmin.tar.gz "https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-all-languages.tar.gz"
# RUN mkdir -p /var/www/html/phpmyadmin
# RUN tar -xvzf /tmp/phpmyadmin.tar.gz -C /var/www/html/phpmyadmin
# RUN rm -rf /tmp/phpmyadmin.tar.gz
# RUN apk add --no-cache php82-common php82-fpm php82-mysqli php82-curl

# # sudo 설정 파일 수정: root 사용자에게 sudo 권한 부여
# RUN echo 'root ALL=(ALL) ALL' > /etc/sudoers.d/roo

# # 로그 파일 생성

# # ENTRYPOINT 설정 - tail 명령어로 로그 파일을 계속해서 출력, 무한히 실행
# ENTRYPOINT ["tail", "-f", "/var/log/mylog.log"]

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
# COPY ./conf/my.conf /etc/php82/conf.d/
COPY ./tools /var/www/tools

# 스크립트에 실행 권한 부여
RUN chmod +x /var/www/tools/entrypoint.sh

# entrypoint.sh 실행
ENTRYPOINT [ "/bin/sh", "/var/www/tools/entrypoint.sh" ]