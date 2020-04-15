#!/bin/sh -l

echo "Hi dkiummy"
echo "Hello $1"
echo "this is the outer container"

ls
echo "this is the inner contianer"


    
time=$(date)
help='help'
echo "::set-output name=etime::$time"
file=$(ls)
echo "::set-output name=ls::$file"


.\module\orchestration\creation.ps1