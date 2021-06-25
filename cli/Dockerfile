FROM php:7.4-alpine

ARG USERNAME=cli
ARG GROUPNAME=cli

RUN apk add --no-cache bash less mysql-client wget jq

RUN set -ex \
	&& apk add --no-cache --virtual .build-deps \
		$PHPIZE_DEPS \
		freetype-dev \
		imagemagick-dev \
		libjpeg-turbo-dev \
		libpng-dev \
		libzip-dev \
    && docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
    && docker-php-ext-install -j "$(nproc)" mysqli bcmath exif gd zip \
    && pecl install imagick-3.4.4 \
    && docker-php-ext-enable imagick \
    && rm -r /tmp/pear \
    && runDeps="$( \
        scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
            | tr ',' '\n' \
            | sort -u \
            | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
        )" \
    && apk add --no-network --virtual .wordpress-phpexts-rundeps $runDeps \
    && apk del --no-network .build-deps

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN addgroup -S $GROUPNAME \
    && adduser -s /bin/bash -S $USERNAME -G $GROUPNAME \
    && echo "$USERNAME:$USERNAME" | chpasswd
USER $USERNAME
WORKDIR /home/$USERNAME/

COPY .bashrc .bashrc
