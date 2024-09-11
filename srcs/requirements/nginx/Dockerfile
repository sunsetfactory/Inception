FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache dumb-init nginx openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/http.d/default.conf

COPY ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

# 로그 파일 생성
# RUN echo "This is a log file" > /var/log/mylog.log

# # ENTRYPOINT 설정 - tail 명령어로 로그 파일을 계속해서 출력, 무한히 실행
# ENTRYPOINT ["tail", "-f", "/var/log/mylog.log"]