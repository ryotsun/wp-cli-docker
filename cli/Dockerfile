FROM php:7.4-fpm
RUN apt-get update \
    && apt-get install -y jq default-mysql-client less wget \
    && docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli
COPY --from=composer /usr/bin/composer /usr/bin/composer

ARG USERNAME=cli
ARG GROUPNAME=cli
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME/
