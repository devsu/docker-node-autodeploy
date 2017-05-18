#!/bin/bash

cd /var/app

if [ -z "$APP" ]; then
  COMMAND="pm2 start npm -n ${APP_NAME:=app} --watch --no-daemon $PARAMETERS -- start"
else
  COMMAND="pm2 start $APP --no-daemon $PARAMETERS"
fi

simple-auto-deploy /var/sources /var/app & ${COMMAND}