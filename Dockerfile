ARG arch=amd64
FROM ${arch}/alpine:latest

WORKDIR /app
VOLUME /app
USER root

RUN apk add --no-cache postfix curl supervisor rsyslog

COPY config/rsyslog.conf /etc/rsyslog.conf
COPY config/supervisord.conf /etc/supervisord.conf
COPY config/main.cf /etc/postfix/main.cf

EXPOSE 25 25

CMD ["/app/run.sh"]