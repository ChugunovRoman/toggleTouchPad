#!/bin/bash

deviceId=`xinput list | grep DLL0652 | cut -d= -f2 | cut -d[ -f1`;
isEnabled=`xinput list-props ${deviceId} | grep 'Device Enabled'`;
isEnabled=${isEnabled:22};

if [ $isEnabled = "0" ]; then
	bash -c "xinput enable ${deviceId}";
else
	bash -c "xinput disable ${deviceId}";
fi
