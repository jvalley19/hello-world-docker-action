#!/bin/sh -l

echo "Hi dummy"
echo "Hello $1"
#time=$(hon)
help='help'
echo "::set-output name=time::$help"
file=$(ls)
echo "::set-output name=ls::$file"