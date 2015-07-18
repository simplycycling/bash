#!/bin/bash
#
# Script for backing up various bash dotfiles, as well as the 
# vim and irssi dot directories. Full file paths necessary, as this is used in
# a cron job.

# First, we tar everything up
/usr/bin/tar -czvf /Users/rsherman/dotfiles-$(date +%m-%d-%Y).tgz /Users/rsherman/.aliases /Users/rsherman/.bash_profile /Users/rsherman/.bash_prompt /Users/rsherman/.exports /Users/rsherman/.gitconfig /Users/rsherman/.helpers /Users/rsherman/.inputrc /Users/rsherman/.irssi /Users/rsherman/.vim /Users/rsherman/.vimrc 

# Next we move it to Google Drive
mv /Users/rsherman/dotfiles-*.tgz /Users/rsherman/Google\ Drive/dotfiles/

# Then we make sure the directory these tarballs get moved to doesn't get out of hand
if [[ $(ls /Users/rsherman/Google\ Drive/dotfiles | wc -l) > 10 ]]
then
  find /Users/rsherman/Google\ Drive/dotfiles ! -newer $(ls -t | sed '11!d') -exec rm {} \;
fi

# That's it!
/bin/echo "All dot files backed up, sir!"

