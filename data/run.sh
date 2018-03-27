#!/bin/sh

postconf -e myhostname=$POST_HOST

echo "$POST_EMAIL	curl_email" >> /etc/postfix/redirect
echo "curl_email: \"|curl --data-binary @- $POST_URL\"" > /etc/aliases

postmap /etc/postfix/redirect
newaliases

exec supervisord -c /etc/supervisord.conf

