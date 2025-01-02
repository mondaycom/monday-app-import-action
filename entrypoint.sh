#!/bin/sh

TOKEN=$1
APP_ID=$2
VERSION_ID=$3
NEW=$4
MANIFEST_PATH=$5

mapps init -t $TOKEN

if [ -z "$APP_ID" ]; then
  APP_ID_ARG=""
else
  APP_ID_ARG="-a $APP_ID"
fi

if [ -z "$VERSION_ID" ]; then
  VERSION_ID_ARG=""
else
  VERSION_ID_ARG="-i $VERSION_ID"
fi

if [ "$NEW" = "true" ]; then
  NEW_ARG="-n"
else
  NEW_ARG=""
fi

mapps manifest:import -p "$MANIFEST_PATH" $APP_ID_ARG $VERSION_ID_ARG $NEW_ARG
mapps app:promote $APP_ID_ARG $VERSION_ID_ARG
