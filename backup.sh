#!/bin/bash

# crontab -e / crontab -l
# 0 9 * * FRI backup

echo "cron backup"

source ~/.config/envvars/backup.env
./homebackup.mjs
