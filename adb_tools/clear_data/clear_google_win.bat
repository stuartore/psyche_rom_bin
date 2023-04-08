@echo off
cd /d %~dp0

pause
cd ..
.\win_adb\fastboot.exe erase userdata
.\win_adb\fastboot.exe erase metadata
.\win_adb\fastboot.exe -w
.\win_adb\fastboot.exe erase frp
pause
