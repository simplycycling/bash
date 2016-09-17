#!/bin/bash
#
# Script for backing up gpg encrypted password files. 
# Full file paths necessary, as this is used in
# a cron job.

/usr/bin/cd /Users/rsherman

# First, we tar everything up
/usr/bin/tar -czvf passBackup-$(date +%m-%d-%Y).tgz .password-store

# Next we move it to Google Drive
mv /Users/rsherman/passBackup-*.tgz /Users/rsherman/Google\ Drive/passBackup/

# Then we make sure the directory these tarballs get moved to doesn't get out of hand
value=$( ls -l ~/Google\ Drive/passBackup/ | wc -l )
if [ ${value} -gt 5 ]
then
	/usr/bin/find /Users/rsherman/Google\ Drive/passBackup -mtime +5 -exec rm {} \;
fi
# That's it! Now, let's make sure the file exists - if not, you will receive a rather rude message.
/bin/echo " "
if [ -f ~/Google\ Drive/passBackup/passBackup-$(date +%m-%d-%Y).tgz ]
then
    /bin/echo "All pass files backed up, sir!"
else
    /bin/echo "your so speshul"
fi

