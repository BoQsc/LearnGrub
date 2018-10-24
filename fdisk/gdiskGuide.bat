@ECHO OFF & cd %~dp0
SETLOCAL EnableDelayedExpansion	


::Required to be run as administrator

:GainInformationFromDiskPart
	set "previousSelection=!currentSelection!"

cls

	::Always run with administrator privilegies.
	::Withouh administrator privilegies, diskpart relaunch in a seperate commandLine window.
	
	::Capture "DiskPart list disk" output using FOR loop
	echo Physical Drives connected:
	FOR /F "USEBACKQ tokens=1,2,3,4,5,6,7 skip=9" %%a IN (`
		
		^( echo list disk ^) ^| diskpart 
		
		
	`) DO (
			set "outputLine=%%a"
			set "diskSpace=0"
			IF not [!outputLine!]==[DISKPART^>] (
				echo  !outputLine! %%b ^| %%d%%e !selection[%%b]!
				IF [!selection[%%b]!]==[^<--] (
					set "selectedDiskCapacity=%%d%%e" & TITLE [%~nx0] Selected Physical Drive -^> %currentSelection% - !selectedDiskCapacity!
					echo                  [Repeat to confirm.]
				)
			)
			

			
			)   && 	if not [%%b]==[] set /A "countedOptions=%%b"
			
			::Reset previous selection, if it is out of bound.
			
			IF !currentSelection! GTR %countedOptions% (
				set "selection[!previousSelection!]="
				set "previousSelection="
		)
	

	
	::Clear previous selection
	set "selection[!previousSelection!]="
	
	::Choosing PhysicalDrive
	choice /C 0123456789 /M "Enter PhysicalDrive Number: "
		set /A "errorLevelOutput=%errorlevel% -1"

	::Set new selection  
	set "currentSelection=!errorLevelOutput!"
	set "selection[!errorLevelOutput!]=<--"
	IF [!previousSelection!]==[!currentSelection!] (
		cls
		
		call :partitionToolGdisk !currentSelection!
	)
	


	
call :GainInformationFromDiskPart !currentSelection!



:partitionToolGdisk
set "currentSelection=%~1"


::Physical drive examples 
::  \\.\physicaldrive0
::  \\.\physicaldrive1
::  \\.\physicaldrive2
::  1:
::  2:
::  3:

set "physicalDrive=!currentSelection!:"


::Execute commands inside gdisk32.exe, 
::on the selected physical drive.

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
	
	

	
	
) | gdisk32.exe %physicalDrive%
echo.
pause
exit

