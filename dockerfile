# Container image that runs your code
FROM ubuntu
WORKDIR /usr/src/app
COPY . ./
# Copies your code file from your action repository to the filesystem path `/` of the container


RUN chmod +x /entrypoint.sh

COPY entrypoint.sh /entrypoint.sh


# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]