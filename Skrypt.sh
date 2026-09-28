#!/usr/bin/env bash

Logs="/home/szymon/log"
Zips="/home/szymon/zip"
ArchiveName="$Zips/$(date +%F).zip"

find "$Logs" -type f -mtime -1 -print0 | xargs -0 -r zip -jm "$ArchiveName"
find "$Logs" -mindepth 1 -empty -delete
find "$Zips" -type f -name "*.zip" -mtime +7 -delete
echo "Logs zipped and old zips deleted."