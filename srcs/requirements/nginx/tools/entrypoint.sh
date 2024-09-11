#!/bin/sh

set -e

# 파일 경로 설정
KEY_FILE_PATH="/etc/nginx/.key/Pri/nginx.key"
CRT_FILE_PATH="/etc/nginx/.key/Cert/nginx.crt"

# 인증서와 키 파일을 환경변수로부터 작성
mkdir -p "$(dirname "$KEY_FILE_PATH")"  # 디렉토리가 없으면 생성
mkdir -p "$(dirname "$CRT_FILE_PATH")"

echo "$SSL_KEY" > "$KEY_FILE_PATH"
echo "SSL key has been saved to $KEY_FILE_PATH"

echo "$SSL_CERT" > "$CRT_FILE_PATH"
echo "SSL certificate has been saved to $CRT_FILE_PATH"

# NGINX를 포그라운드 모드에서 실행하여 컨테이너가 계속 실행되도록 설정
exec nginx -g 'daemon off;'
