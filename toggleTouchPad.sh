#!/bin/bash

deviceId=`xinput list | grep -iE '(DLL0652|touch|Synaptics)' | cut -d= -f2 | cut -d[ -f1`;

if [ -z "$deviceId" ]; then
	echo "TouchPad not found. Exit"
	exit 1
fi

isEnabled=`xinput list-props ${deviceId} | grep 'Device Enabled'`;
isEnabled=${isEnabled:22};

if [ $isEnabled = "0" ]; then
	bash -c "xinput enable ${deviceId}";
else
	bash -c "xinput disable ${deviceId}";
fi
