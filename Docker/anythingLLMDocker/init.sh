#!/bin/sh

llmdir=/home/data/anythingLLM

echo "Init `$images`(y/n)?"
read key
if [ $key = 'y' ]; then
mkdir -p $llmdir
mkdir -p $llmdir/storage/vector-cache
mkdir -p $llmdir/storage/indexes
cp .env $llmdir/
cd $llmdir
chown -R 1000:1000 storage
chmod -R 755 storage
chown 1000:1000 .env
chmod 644 .env
fi

echo "Visit web http://localhost:3001/ via webrower with your_auth_token in .env"

