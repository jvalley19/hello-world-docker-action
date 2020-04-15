#!/bin/sh -l

echo "Hi dkiummy"
echo "Hello $1"
echo "this is the outer container"
mkdir -p $SOURCE_PATH
echo $SOURCE_PATH
echo $PWD
echo $(ls)
echo "this is the inner contianer"

docker run \
  --mount type=bind,source=$SOURCE_PATH,destination=/root \
  --entrypoint "/usr/src/app" \
  --tty \
  github/docker-cli:master \
  /root

    
time=$(date)
help='help'
echo "::set-output name=etime::$time"
file=$(ls)
echo "::set-output name=ls::$file"

