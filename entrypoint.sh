#!/bin/sh

TOKEN=$1
APP_ID=$2
VERSION_ID=$3
FORCE=$4

mapps init -t $TOKEN


if [ -z "$APP_ID" ]; then
  APP_ID_ARG=""
else
  APP_ID_ARG="-a $APP_ID"
fi

if [ -z "$VERSION_ID" ]; then
  VERSION_ID_ARG=""
else
  VERSION_ID_ARG="-v $VERSION_ID"
fi

if [ -z "$FORCE" ]; then
  FORCE_ARG=""
else
  FORCE_ARG="-f"
fi

mapps app:deploy $APP_ID_ARG $VERSION_ID_ARG $FORCE_ARG


