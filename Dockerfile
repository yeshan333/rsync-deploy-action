# Container image that runs your code
FROM alpine:latest

RUN apk update \
 && apk upgrade \
 && apk add --no-cache \
            rsync \
            openssh-client

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]