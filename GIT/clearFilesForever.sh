#!/bin/sh

target=Docker/TeamSpeakDocker/client

echo "Do you want to delete the files of $images(y/n)"
read key
if [ $key = 'y' ]; then
git filter-branch --force --index-filter 'git rm -r --cached --ignore-unmatch $target' --prune-empty --tag-name-filter cat -- --all
fi





