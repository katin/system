#!/bin/bash

data_file="github-contexts.dat"

if [ $# -eq 1 ]; then
    desired_context="$1"
    context_found=0
    context_count=0
    available_contexts=$'Available contexts include:\n'
    while IFS=',' read -r context username acctmail; do
	if [[ ${context::1} == "#" ]]; then
	    continue
	fi
	if [[ "$context" = "" ]]; then
	    continue;
	fi
        if [[ "$context" == "\"$desired_context\"" ]]; then
            CONTEXT="${context//\"/}"
            USERNAME="${username//\"/}"
            ACCTMAIL="${acctmail//\"/}"
	    set -x
	    git config --global user.name $CONTEXT
	    git config --global user.email $ACCTMAIL
	    eval "$(ssh-agent)"
	    ssh-add ~/.ssh/github-$CONTEXT
	    set +x
	    echo "Identity set to $CONTEXT"
	    echo "ssh keys added to ssh-agent."
	    echo "Testing ssh access:"
	    set -x
	    ssh -T git@github.com
	    set +x
	    echo $'\n'"Note: use the SSH clone method from github, e.g."
	    echo " # git clone git@github.com:katin/bamboo-banana.git"$'\n'
	    context_found=1
        fi
	available_contexts="$available_contexts $context"$'\n'
	context_count+=1
    done < "$data_file"
    if [ $context_found -eq 0 ]; then
	    echo "Context not found."
	    echo "$available_contexts"
    fi
elif [ $# -eq 2 ]; then
    set -x
    git config --global user.name $1
    git config --global user.email $2
    eval "$(ssh-agent)"
    ssh-add ~/.ssh/github-$1
    set +x
    echo "Identity set to $1"
    echo "ssh keys added to ssh-agent."
    echo "Testing ssh access:"
    set -x
    ssh -T git@github.com
    set +x
    echo $'\n'"Note: use the SSH clone method from github, e.g."
    echo " # git clone git@github.com:katin/bamboo-banana.git"$'\n'
else
    echo "Usage: $0 <CONTEXT | USERNAME ACCTMAIL>"
    echo "(You may load your context information into the github-contexts.dat file)"
fi

