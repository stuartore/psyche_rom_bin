#!/bin/bash

if [[ "$(uname -s)" == "Linux" ]];then
	adb_str='linux_adb'
else
	adb_str='mac_adb'
fi

cd ..

sudo chmod +x ./${adb_str}/*
if [[ "$(./${adb_str}/adb devices | grep -v 'List of devices')" != "" ]];then
	./${adb_str}/adb reboot bootloader
fi
sudo ./${adb_str}/adb kill-server && ./${adb_str}/adb start-server

./${adb_str}/fastboot erase userdata
./${adb_str}/fastboot erase metadata
./${adb_str}/fastboot erase -w
./${adb_str}/fastboot erase frp
echo -e '\ndata cleaned'
