ARG arch=amd64
FROM ${arch}/alpine:latest

WORKDIR /app
VOLUME /app
USER root

RUN apk add --no-cache postfix curl supervisor rsyslog

ADD config /etc

EXPOSE 25 25

CMD ["/app/run.sh"]