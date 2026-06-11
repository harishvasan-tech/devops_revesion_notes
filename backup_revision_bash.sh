#!/bin/bash

dir=$1
BACKUP_DIR="/home/$USER/backups"
LOG_FILE="/home/$USER/backups/backup.log"

if [ -z "$dir" ]; then
    echo "No directory name given"
    exit 1
fi

if [ ! -d "$dir" ]; then
    echo "No such directory"
    exit 1
fi

mkdir -p $BACKUP_DIR

date=$(date +%F)
backup_name="backup_$date.tar.gz"

tar -czf "$BACKUP_DIR/$backup_name" "$dir"

echo "$(date +%Y-%m-%d\ %H:%M:%S) - Backup Created: $backup_name" >> "$LOG_FILE"
echo "Backup Created ;) File name: $backup_name"

find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +7 -delete
echo "$(date +%Y-%m-%d\ %H:%M:%S) - Old backups cleaned" >> "$LOG_FILE"
