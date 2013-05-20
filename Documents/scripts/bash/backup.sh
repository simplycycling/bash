#!/bin/bash
# Ay, your basic fruity-boots backup script. Back
# it all up, so we can go drinking, already!

# variables, cause I'm thorough like that

today=`date +%y%m%d`

# and the fruity pants script itself

cd /home/rog/backup/
tar -czvf backup-$today.tgz /home/* --exclude-tag-all=.exclude_from_backup

echo "All backed up, Batman!"
