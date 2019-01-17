#!/bin/bash
# mysql-full-backup.sh
# Change directories to the backup location.
cd /mnt/backup/full
ulimit -n 4096

# Execute the compressed and encrypted full backup.
innobackupex --defaults-file=/etc/mysql/backup-my.cnf \
    --no-timestamp \
    --use-memory=5G \
    --stream=xbstream \
    --slave-info \
    --safe-slave-backup \
    --parallel=4 \
    --history=$(date +%d-%m-%Y) ./ > \
    mysqlbackup$(date +%d-%m-%Y).qp.xbc.xbs 2> \
    backup-progress$(date +%d-%m-%Y).log &