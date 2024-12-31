# write a nodejs 20 based container image and install @mondaycom/apps-cli
# run the cli as the entry point and inject some provided env vars
# to the container image

FROM node:20-alpine

RUN npm install -g @mondaycom/apps-cli@4.4.0-beta.5

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
