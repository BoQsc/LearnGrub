@echo off
setlocal enabledelayedexpansion



:: https://superuser.com/a/1192171
for /f "tokens=* skip=1" %%a in ('"wmic diskdrive where(InterfaceType="USB") get DeviceID,Model | findstr ".""') do echo %%a





pause