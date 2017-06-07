FROM node:7-alpine

MAINTAINER Cesar Salazar "csalazar@devsu.com"

# bash, inotify-tools: required for running the script
# rsync: required by simple-auto-deploy
# libc6-compat: required for GRPC support
# python, build-base: required by some node modules
RUN apk update && apk upgrade && \
    apk add --no-cache bash inotify-tools rsync libc6-compat python build-base yarn

RUN npm install -g simple-auto-deploy pm2

RUN mkdir -p /var/sources /var/app /var/log/app

VOLUME ["/var/sources"]

ADD start.sh /var/start.sh
CMD ["/var/start.sh"]

# Expose most common port for node apps
EXPOSE 3000