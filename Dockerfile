# Inspired by state of this file https://github.com/TankMasterRL/docker-squid
FROM debian:stretch
LABEL maintainer="Robin Larsson <tankmaster93@gmail.com>"

# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#use-multi-stage-builds
RUN apt-get update \
    && apt-get dist-upgrade \
    && apt-get install squid3 \
    && mv /etc/squid3/squid.conf /etc/squid3/squid.conf.dist

ENV SQUID_CACHE_DIR=/var/spool/squid3 \
    SQUID_LOG_DIR=/var/log/squid3 \
    SQUID_USER=proxy

COPY squid.conf /etc/squid3/squid.conf
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128/tcp
VOLUME ["${SQUID_CACHE_DIR}"]
ENTRYPOINT ["/sbin/entrypoint.sh"]