#!/bin/sh

TOKEN=$1
APP_ID=$2
FORCE=$3

mapps init -t $TOKEN


if [ "$FORCE" = "true" ]; then
  mapps app:deploy -f -a $APP_ID --verbose
else
  mapps app:deploy -a $APP_ID --verbose
fi

