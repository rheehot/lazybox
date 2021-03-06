#!/bin/bash

if [ $# -ne 1 ]
then
	echo "USAGE: $0 <run-webserving.sh output file>"
	exit 1
fi

FILE=$1

STARTLINE=`grep --text -n "BUILD SUCCESSFUL" $FILE | awk -F ':' '{print $1}'`
STARTLINE=$(($STARTLINE + 2))
tail -n +$STARTLINE $FILE | head -n -1
