FROM postgres:13
USER root

RUN apt-get install tzdata -y
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias C.UTF-8

ENV LANG C.utf8
ENV PGTZ 'Europe/Warsaw'

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

USER postgres

ENV POSTGRES_HOST_AUTH_METHOD=trust
ENV PG_DATA=/var/lib/postgresql/data

ENV POSTGRES_USER=postgres
