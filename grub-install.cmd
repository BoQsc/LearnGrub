@echo off

#Change Current Directory to Where the grub-install.cmd is.
CD "%~dp0"

#Select install device for Grub
set "installDevice=\\?\G:"

grub-install.exe --boot-directory=G:\test --target=i386-pc %installDevice%
pause