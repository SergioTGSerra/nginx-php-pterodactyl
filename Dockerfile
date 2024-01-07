FROM alpine:3.16.8

RUN apk --update --no-cache add curl ca-certificates nginx
RUN apk add php81 php81-xml php81-exif php81-fpm php81-session php81-soap php81-openssl php81-gmp php81-pdo_odbc php81-json php81-dom php81-pdo php81-zip php81-mysqli php81-sqlite3 php81-pdo_pgsql php81-bcmath php81-gd php81-odbc php81-pdo_mysql php81-pdo_sqlite php81-gettext php81-xmlreader php81-xmlwriter php81-bz2 php81-iconv php81-pdo_dblib php81-curl php81-ctype php81-phar php81-fileinfo php81-mbstring php81-tokenizer php81-simplexml
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh


CMD ["/bin/ash", "/entrypoint.sh"]
