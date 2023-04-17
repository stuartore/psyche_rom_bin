#!/bin/bash
export ANDROID_PRODUCT_OUT=.

if [[ "$(uname -s)" == "Linux" ]];then
	adb_str='linux_adb'
else
	adb_str='mac_adb'
fi

sudo chmod +x ./adb_tools/${adb_str}/*
if [[ "$(./adb_tools/${adb_str}/adb devices | grep -v 'List of devices')" != "" ]];then
	./adb_tools/${adb_str}/adb reboot bootloader
fi
sudo ./adb_tools/${adb_str}/adb kill-server && ./adb_tools/${adb_str}/adb start-server
./adb_tools/${adb_str}/fastboot devices
./adb_tools/${adb_str}/fastboot flashall
