Build: `docker build -t mail2url .`

Run: `docker run -v ~/mail2url/data:/app --net=host -P -e POST_URL=url -e POST_EMAIL=email -e POST_HOST=host mail2url`

where
 - `email` - email address which receives your emails
 - `host` - mail server host name
 - `url` - URL to post email message to