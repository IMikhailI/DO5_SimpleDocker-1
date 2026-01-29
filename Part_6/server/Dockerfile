FROM debian

WORKDIR /server

RUN apt-get update; \
    apt-get install -y nginx gcc libfcgi-dev spawn-fcgi;\
    rm -rf /var/lib/apt/lists

COPY server.c .
COPY nginx.conf /etc/nginx/nginx.conf

RUN adduser --disabled-password nginx; \
    chown -R nginx:nginx /etc/nginx/; \
    chown -R nginx:nginx /server; \
    chown -R nginx:nginx /var/lib/nginx/; \
    chown -R nginx:nginx /var/log/nginx/; \
    chown -R nginx:nginx /run/ 

USER nginx

CMD gcc -o server server.c -lfcgi && spawn-fcgi -p 8080 server && nginx -g 'daemon off;'
