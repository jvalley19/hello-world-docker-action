#!/bin/sh -l

echo "Hi dummy"
echo "Hello $1"
time=$(date)
help='help'
echo "::set-output name=etime::$time"
#file=$(ls)
#echo "::set-output name=ls::$file"