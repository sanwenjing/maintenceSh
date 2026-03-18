#!/bin/sh
set -e

sed -i 's/127.0.0.1:8384/0.0.0.0:8384/g' /home/syncthing/.config/syncthing/config.xml 2>/dev/null || true

mkdir -p /home/syncthing/Sync

exec /usr/local/bin/syncthing serve --no-browser --home=/home/syncthing/.config/syncthing
