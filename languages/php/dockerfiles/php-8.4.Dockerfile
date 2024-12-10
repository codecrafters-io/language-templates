# syntax=docker/dockerfile:1.7-labs
FROM php:8.4.2RC1-cli-alpine3.20

# For ext-sockets installation
RUN apk add linux-headers=6.6-r0 --no-cache

RUN docker-php-ext-install sockets

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app
