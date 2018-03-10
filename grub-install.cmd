@echo off

#Change Current Directory to Where the grub-install.cmd is.
CD "%~dp0"

#Select install device for Grub
set "installDevice=\\?\G:"

#On Windows we use UNC path. For volumes it’s typically
# \\?\Volume{<GUID>}
# \\?\<drive letter>:
#E.g.
 # \\?\Volume{17f34d50-cf64-4b02-800e-51d79c3aa2ff}
 # \\?\C:

# For disks it’s
# \\?\PhysicalDrive<number>
#E.g. 
# grub-install \\?\PhysicalDrive0


grub-install.exe --boot-directory=G:\test --target=i386-pc %installDevice%
pausea
