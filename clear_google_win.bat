@echo off
cd /d %~dp0

pause
.\adb_tools\win_adb\fastboot.exe erase userdata
.\adb_tools\win_adb\fastboot.exe -w
.\adb_tools\win_adb\fastboot.exe erase frp
