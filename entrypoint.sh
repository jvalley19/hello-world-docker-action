#!/bin/sh -l

echo "Hi dkiummy"
echo "Hello $1"
#cd "/usr/src/app"
echo $PWD
echo $(ls)
chomd +x ./master/creation.ps1
./creation.ps1
time=$(date)
help='help'
echo "::set-output name=etime::$time"
#file=$(ls)
echo "::set-output name=ls::$file"

