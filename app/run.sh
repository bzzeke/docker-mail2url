#!/bin/sh

sed -i "s/xx_log_server_xx/${LOG_SERVER}/g" /etc/rsyslog.conf

postconf -e myhostname=$ROOT_SERVER_NAME

echo "$POST_EMAIL	curl_email" >> /etc/postfix/redirect
echo "curl_email: \"|curl --data-binary @- $POST_URL\"" > /etc/aliases

postmap /etc/postfix/redirect
newaliases

exec supervisord -c /etc/supervisord.conf

