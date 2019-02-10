#!/bin/bash
#Bootstraps gitwatch, converts environment variables to args,
#runs initial clone of git repo and commits any initial changes.
#intended to work as a sidecar container for applications that write
#config files to a shared local volume or emptyDir.

set -e

#Check environment variables
if [! -z $WATCHPATH ]
then
    gwargs="$gwargs -g $WATCHPATH" 
else
    echo "WATCHPATH is required"
    exit 1 
fi


if [! -z $GITREMOTE]
then
   gwargs="$gwargs -r $GITREMOTE" 
else
    echo "GITREMOTE is required"
    exit 1
fi

if [! -z $EVENTS ]
    gwargs="$gwargs -e $EVENTS"
fi


#run gitwatch
/gitwatch.sh "$gwargs"