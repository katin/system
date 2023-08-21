#!/bin/bash
#
# Create new keys and setup local envirnoment to use them
#  with github
#
# 230820 KBI created

if [ $# -ne 2 ]
then
    echo "Usage: github-newkeys.sh [github-id] [github-email-address]"
    exit 1
fi

date=$(date +'%Y%m%d-%H%M%S')
if [ -f ~/.ssh/github-$1 ]; then
    mv ~/.ssh/github-$1 ~/.ssh/github-$1-$date
    mv ~/.ssh/github-$1.pub ~/.ssh/github-$1-$date.pub
fi
ssh-keygen -t rsa -b 4096 -C "$2" -f ~/.ssh/github-$1

echo "1. Copy this public key to your Github account:"
cat ~/.ssh/github-$1.pub

echo "-----"
echo "2. Run the setgitcontext.sh command to load the key into ssh-agent."

