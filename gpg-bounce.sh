#!/bin/bash
gpgproc=$(pgrep gpg-agent)
echo "$gpgproc"
kill -9 "$gpgproc"
gpg-agent --daemon --enable-ssh-support --write-env-file ~/.gpg-agent-info