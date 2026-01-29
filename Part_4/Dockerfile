FROM nginx:latest

WORKDIR /app

# Устанавливаем зависимости в один RUN с очисткой кеша
RUN apt-get update && \
    apt-get install -y \
        gcc \
        spawn-fcgi \
        libfcgi-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Копируем файлы
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./hello.c .
COPY ./run.sh .

# Делаем скрипт исполняемым
RUN chmod +x run.sh

# Запускаем сервис
ENTRYPOINT ["./run.sh"]
