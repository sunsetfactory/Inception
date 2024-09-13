FROM alpine:3.20

RUN apk update && \
    apk add --no-cache mariadb mariadb-client mariadb-server-utils

# COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/mariadb-server.cnf /etc/mysql/mariadb-server.cnf
COPY ./tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["mysqld_safe"]