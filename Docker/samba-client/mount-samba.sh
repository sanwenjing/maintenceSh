#!/bin/sh

set -e

if [ -z "$SMB_HOST" ]; then
    echo "Error: SMB_HOST environment variable is required"
    exit 1
fi

MOUNT_OPTIONS="vers=3.0,iocharset=utf8"

if [ -n "$SMB_USERNAME" ] && [ -n "$SMB_PASSWORD" ] && [ "$SMB_PASSWORD" != "" ]; then
    CREDENTIALS="username=$SMB_USERNAME,password=$SMB_PASSWORD"
    echo "Mounting SMB share with credentials..."
else
    CREDENTIALS="guest"
    echo "Mounting SMB share (guest mode)..."
fi

echo "Mounting //${SMB_HOST}/${SHARE_PATH} to /mnt/samba"

mount -t cifs //${SMB_HOST}/${SHARE_PATH} /mnt/samba -o ${CREDENTIALS},${MOUNT_OPTIONS} 2>/dev/null || {
    echo "Warning: Mount failed, continuing without mount..."
}

exec "$@"