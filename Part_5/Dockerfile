# build stage
FROM alpine:3.19

# необходимые пакеты: компилятор, libfcgi, spawn-fcgi, nginx
RUN apk add --no-cache \
        build-base libfcgi-dev spawn-fcgi nginx

# исходники
WORKDIR /app
COPY hello.c .
COPY run.sh /usr/local/bin/run.sh
COPY nginx.conf /etc/nginx/nginx.conf

# компиляция FastCGI-сервера на этапе build
RUN gcc -o /usr/local/bin/mini_server hello.c -lfcgi && \
    chmod +x /usr/local/bin/run.sh

EXPOSE 81            # только внутри сети Compose
ENTRYPOINT ["/usr/local/bin/run.sh"]
