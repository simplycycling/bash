#!/bin/bash
#
# Script for backing up various bash dotfiles, as well as the 
# vim and irssi dot directories. Full file paths necessary, as this is used in
# a cron job.

/usr/bin/cd /Users/rsherman/Documents/open_source_projects/dotfiles

# First, we tar everything up
/usr/bin/tar -czvf dotfiles-$(date +%m-%d-%Y).tgz .aliases .bash_profile .bash_prompt .exports .gitconfig .helpers .inputrc .irssi .vim .vimrc

# Next we move it to Google Drive
mv /Users/rsherman//Documents/open_source_projects/dotfiles/dotfiles-*.tgz /Users/rsherman/Google\ Drive/dotfiles/

# Then we make sure the directory these tarballs get moved to doesn't get out of hand
value=$( ls -l ~/Google\ Drive/dotfiles/ | wc -l )
if [ ${value} -gt 5 ]
then
	/usr/bin/find /Users/rsherman/Google\ Drive/dotfiles -mtime +5 -exec rm \;
fi
# That's it!
/bin/echo " "
/bin/echo "All dot files backed up, sir!"
