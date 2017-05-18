FROM node:7-alpine

MAINTAINER Cesar Salazar "csalazar@devsu.com"

# bash is required for running the script
# rsync is required by simple-auto-deploy
# libc6-compat is required for GRPC support
RUN apk update && apk upgrade && \
    apk add --no-cache bash rsync libc6-compat inotify-tools

RUN npm install -g simple-auto-deploy pm2

RUN mkdir -p /var/sources /var/app /var/log/app

VOLUME ["/var/sources"]

ADD start.sh /var/start.sh
CMD ["/var/start.sh"]

# Expose most common port for node apps
EXPOSE 3000