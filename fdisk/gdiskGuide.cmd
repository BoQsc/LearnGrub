@echo off
cd %~dp0
(

	::create a new empty GUID partition table (GPT)
	echo o
	::This option deletes all partitions and creates a new protective MBR. Proceed? (Y/N)
	echo Y
	
	::add a new partition
	echo n
	::Partition number (1-128, default 1):
	echo.
	::First sector (34-15155166, default = 2048) or {+-}size{KMGTP}:
	echo.
	::Last sector (2048-15155166, default = 15155166) or {+-}size{KMGTP}:
	echo ^+1M
	::Current type is 'Microsoft basic data'
	echo ef02
	
	::add a new partition
	echo n
	::Partition number (1-128, default 1):
	echo.
	::First sector (34-15155166, default = 2048) or {+-}size{KMGTP}:
	echo.
	::Last sector (2048-15155166, default = 15155166) or {+-}size{KMGTP}:
	echo ^+50M
	::Current type is 'Microsoft basic data'
	echo ef00
	
	::add a new partition
	echo n
	::Partition number (1-128, default 1):
	echo.
	::First sector (34-15155166, default = 2048) or {+-}size{KMGTP}:
	echo.
	::Last sector (2048-15155166, default = 15155166) or {+-}size{KMGTP}:
	echo ^+50M
	::Current type is 'Microsoft basic data'
	echo 8300
	
	echo r
	echo h
	echo 1 2 3
	echo N
	echo.
	echo N
	echo.
	echo N
	echo.
	echo Y
	echo m
	

	echo w
	echo Y

	
	
) | gdisk32.exe 1:

pause