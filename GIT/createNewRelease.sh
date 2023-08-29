#!/bin/sh
tagName=v1.0
msg=firstTag


echo "Do you want to create a new tag $tagName(y/n)"
read key
if [ $key = 'y' ]; then
git tag -a $tagName -m $msg
git push origin $tagName
git archive --format=zip --output=$tagName.zip $tagName
fi





