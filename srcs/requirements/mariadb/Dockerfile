FROM alpine:3.20

RUN apk update && \
    apk add --no-cache mariadb mariadb-client mariadb-server-utils

COPY ./conf/my.cnf /etc/.
COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/.
COPY ./tools/entrypoint.sh /entrypoint.sh

RUN chmod 644 /etc/my.cnf
RUN chown mysql:mysql /etc/my.cnf.d/mariadb-server.cnf
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

CMD ["mysqld_safe"]