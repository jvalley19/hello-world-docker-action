#!/bin/sh -l

echo "Hi dkiummy"
echo "Hello $1"
#cd "/usr/src/app"
echo $PWD
chomd +x ./module/orchestration/creation.ps1
./module/orchestration/creation.ps1
time=$(date)
help='help'
echo "::set-output name=etime::$time"
file=$(ls)
echo "::set-output name=ls::$file"

