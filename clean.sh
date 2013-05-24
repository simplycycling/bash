#!/bin/bash

# The purpose of this script is to keep the Chromium cache from getting out
# of hand. Eventually, it will be merged with a backup script.

du -h --max-depth=1 /home/rog/.cache/chromium/Default/Cache/

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

sleep 7

echo 'Finish writing that script, boy!'
sleep 3
