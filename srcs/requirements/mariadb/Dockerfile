# Base image
FROM alpine:3.20

# Install MariaDB
RUN apk update && \
    apk add --no-cache mariadb mariadb-client

# Create necessary directories and set permissions
RUN mkdir -p /var/lib/mysql /var/log/mysql /run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/log/mysql /run/mysqld

# Copy MariaDB configuration

# Initialize MariaDB database
# RUN mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# 임시 주석
# Copy initialization scripts
# COPY conf/my.cnf /etc/mysql/my.cnf.d/
# COPY ./conf/my.cnf /etc/my.cnf.d/
COPY ./tools /var/www/tools

# Ensure initialization scripts have execution permissions
# RUN chmod 644 /etc/my.cnf.d/my.cnf
RUN chmod +x /var/www/tools/init_db.sql
RUN chmod +x /var/www/tools/entrypoint.sh

# Run MariaDB server and initialize database
ENTRYPOINT ["/var/www/tools/entrypoint.sh"]

# Default command
CMD ["mysqld"]


# RUN echo "This is a log file" > /var/log/mylog.log
# ENTRYPOINT ["tail", "-f", "/var/log/mylog.log"]
