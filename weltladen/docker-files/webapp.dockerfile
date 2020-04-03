FROM python:3.6.6
LABEL Description="Das ist der Webshop des Weltladen Baden" Maintainer="Markus Mohanty"
RUN mkdir /web
WORKDIR /web
ARG DJANGO_WORKDIR=/web/workdir
ARG DJANGO_STATIC_ROOT=/web/staticfiles

# install packages outside of PyPI
RUN apt-get upgrade -y
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs optipng jpegoptim
RUN pip install --upgrade pip
COPY docker-files/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# handle static and files
ENV DJANGO_STATIC_ROOT=$DJANGO_STATIC_ROOT
ENV DJANGO_WORKDIR=$DJANGO_WORKDIR
RUN mkdir -p $DJANGO_STATIC_ROOT/CACHE

# run Django as different user
RUN useradd -M -d /web -s /bin/bash django

USER django
