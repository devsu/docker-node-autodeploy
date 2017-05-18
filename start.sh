#!/bin/bash

SOURCES_DIR=/var/sources
APP_DIR=/var/app
SIMPLE_DEPLOY_DONE_FILE=${APP_DIR}/simple-deploy-done

cd ${APP_DIR}
rm ${SIMPLE_DEPLOY_DONE_FILE}

function runPM2 {
  echo "Waiting for simple-deploy to perform its first deployment"
  while [ ! -f "$SIMPLE_DEPLOY_DONE_FILE" ]
  do
    inotifywait -qqt 2 -e create -e moved_to "$(dirname $SIMPLE_DEPLOY_DONE_FILE)"
  done

  echo "Starting PM2"

  if [ -z "$APP" ]; then
    pm2 start npm -n ${APP_NAME:=app} --watch --no-daemon $PARAMETERS -- start
  else
    pm2 start $APP --no-daemon $PARAMETERS
  fi
}

simple-auto-deploy ${SOURCES_DIR} ${APP_DIR} & runPM2