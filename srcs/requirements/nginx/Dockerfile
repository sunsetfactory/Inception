FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache dumb-init nginx openssl

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

COPY ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
