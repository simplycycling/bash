#!/bin/bash
gpgproc=$(pgrep gpg-agent)
file=".gpg-agent-info"
cd ~/
echo "$gpgproc"
kill -9 "$gpgproc"
if [ -f "$file" ]
then
    cp ${file} gpg-agent.bak.$(date +"%m_%d_%Y")
fi
gpg-agent --daemon --enable-ssh-support --write-env-file ~/.gpg-agent-info
