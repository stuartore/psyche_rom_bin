@echo off
cd /d %~dp0

set ANDROID_PRODUCT_OUT=.
pause
.\adb_tools\win_adb\adb.exe kill-server && .\adb_tools\win_adb\adb.exe start-server
.\adb_tools\win_adb\fastboot.exe devices
.\adb_tools\win_adb\fastboot.exe flashall
