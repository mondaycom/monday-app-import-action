#!/bin/sh

# Read arguments
TOKEN=$1
APP_ID=$2
VERSION_ID=$3
NEW=$4
MANIFEST_PATH=$5
PROMOTE=$6

# Initialize the monday.com CLI with the provided token
mapps init -t "$TOKEN"

# Build arguments for APP_ID
if [ -z "$APP_ID" ]; then
  APP_ID_ARG=""
else
  APP_ID_ARG="-a $APP_ID"
fi

# Build arguments for VERSION_ID
if [ -z "$VERSION_ID" ]; then
  VERSION_ID_ARG=""
else
  VERSION_ID_ARG="-i $VERSION_ID"
fi

# Handle the NEW flag
if [ "$NEW" = "true" ]; then
  NEW_ARG="-n"
else
  NEW_ARG=""
fi

# Import the manifest
mapps manifest:import -p "$MANIFEST_PATH" $APP_ID_ARG $VERSION_ID_ARG $NEW_ARG

# Handle the PROMOTE flag
if [ "$PROMOTE" = "true" ]; then
  echo "Promotion flag is set to true. Running promote command..."
  mapps app:promote $APP_ID_ARG $VERSION_ID_ARG
else
  echo "Promotion flag is not set. Skipping promote command."
fi
