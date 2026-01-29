#!/bin/bash

set -e  # Остановка при ошибке

# Компиляция сервера
gcc -o server hello.c -lfcgi

# Запуск сервера FastCGI
spawn-fcgi -p 8080 ./server

# Запуск nginx в foreground
exec nginx -g "daemon off;"
