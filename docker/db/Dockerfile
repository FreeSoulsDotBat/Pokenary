FROM mysql:latest

ENV MYSQL_DATABASE=pokenary \
    MYSQL_ALLOW_EMPTY_PASSWORD=true

ADD pokenary_dump.sql /docker-entrypoint-initdb.d

EXPOSE 3306