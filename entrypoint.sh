#!/bin/bash -l

echo "Hi dummy"
echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"
file=$(ls)
echo "::set-output name=ls::$file"