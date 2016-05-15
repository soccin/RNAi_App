#!/bin/bash

SDIR="$( cd "$( dirname "$0" )" && pwd )"
echo $SDIR

function setPath {

    file=$1
    checkMarker=$(grep "# RNAi_App.V4" $file)
    if [ "$checkMarker" == "" ]; then
        echo >> $file
        echo "# RNAi_App.V4" >> $file
        echo PATH=\"$SDIR\":\$PATH >> $file
        echo >> $file
    fi

}


if [ -e ~/.bash_profile ]; then
    echo .bash_profile exists
    setPath ~/.bash_profile
    exit
elif [ -e ~/.profile ]; then
    echo .profile exists
    setPath ~/.profile
    exit
fi

echo "Need to create .bash_profile"
touch ~/.bash_profile
setPath ~/.bash_profile
