# Base image
FROM alpine:3.20

# Install MariaDB
RUN apk update && \
    apk add --no-cache mariadb mariadb-client

# 임시 주석
# COPY conf/my.cnf /etc/mysql/my.cnf.d/
# COPY ./conf/my.cnf /etc/my.cnf.d/
COPY ./tools /var/www/tools

RUN chmod +x /var/www/tools/init_db.sql
RUN chmod +x /var/www/tools/entrypoint.sh

ENTRYPOINT ["/var/www/tools/entrypoint.sh"]