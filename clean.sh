#!/bin/bash

# The purpose of this script is to keep the Chromium cache from getting out
# of hand. Eventually, it will be merged with a backup script.

x=$(du ~/.cache/chromium/Default/Cache/ | awk '{print $1}')

# this is to delete files that are more than two days old

find ~/.cache/chromium/Default/Cache/ -mindepth 1 -type f -mtime +2 -delete

y=$(du ~/.cache/chromium/Default/Cache/ | awk '{print $1}')

z=$((x-y))

d=$((z/1024))

echo "$d M cleared out."

sleep 1

echo 'Finish writing that script, boy!'

sleep 1
