FROM nginx:1.15.1-alpine

ADD vhost.conf /etc/nginx/conf.d/default.conf

COPY src/public /var/www/public
