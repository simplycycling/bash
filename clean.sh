#!/bin/bash

# The purpose of this script is to keep the Chromium cache from getting out
# of hand. Eventually, it will be merged with a backup script.

x=$(du ~/.cache/chromium/Default/Cache/ | awk '{print $1}')

# Pseudocode for the next part of this script
#
# If the cache is greater than 100 MB
# Then
# 	If any cache is more than two days old
# 	then delete and echo x amount of files were cleaned up
# 	else if cache is less than two days old
#	then echo this can ripen for a few more days
#
# If the cache is less than 100 MB
# Then echo that there is plenty of free space
#
# But in the meantime, we'll just do this:

find ~/.cache/chromium/Default/Cache/ -mindepth 1 -type f -mtime +2 -delete

y=$(du ~/.cache/chromium/Default/Cache/ | awk '{print $1}')

z=$((x-y))

d=$((z/1024))

echo "$d M cleared out."

sleep 1

echo 'Finish writing that script, boy!'

sleep 1
