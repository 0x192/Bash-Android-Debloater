# Universal Android Debloater

**DISCLAIMER** : Use this script at you own risk. I am not responsible for anything that could happen to you. Don't eat it ! It is not comestible.

But don't worry. This script *should* be safe as long as you only use my preselections and the last stable release. The worse thing which can happen is preventing an essential system process to be loaded during boot causing then an unfortunate bootloop. After about 5 failed system boots, the phone will automatically reboot in recovery mode and you'll have to perform a FACTORY RESET. 

In any case, you can NOT brick your device with this script ! That's the main thing, right ? :smiley:

**Don't forget to backup importants things before doing anything ! You can never be too careful !**

## Features :
* [X] Quick search among all the packages of your phone
* [X] Uninstall* any system/user package
* [X] Reinstall system packages
* [X] ADB backup (see FAQ)
* [X] Brand device detection and auto-selection of the appropriate debloat list
* [ ] Installation of alternative FOSS apps replacing stock apps (list in the WIKI section) (WIP)

* It is not a real uninstallation for system apps (see the [FAQ](https://gitlab.com/W1nst0n/universal-android-debloater/-/wikis/FAQ))

## Universal debloat lists :
* [X] GFAM (Google/Facebook/Amazon/Microsoft)
* [X] Manufacturer bloat
* [X] AOSP bloat
* [X] Miscellaneous

## Manufacturers debloat list:
* [ ] Archos
* [X] Asus
* [X] LG
* [ ] Google
* [ ] HTC
* [X] Huawei
* [ ] Motorola
* [X] Nokia
* [ ] OnePlus	
* [X] Samsung
* [X] Sony
* [ ] Wiko
* [X] Xiaomi

## Phone carriers debloat lists : 
 - France 
	* [ ] Free 
	* [ ] SFR
	* [ ] Orange
	* [ ] Bouygues Telecom
- USA
	* [X] T-Mobile 
	* [X] Verizon 
	* [ ] AT&T

## How to use it :
- **Read the [FAQ](https://gitlab.com/W1nst0n/universal-android-debloater/-/wikis/FAQ) !!**

### LINUX
- Install *Android plateform tools* with your package manager :

 	Debian Base : 
 	```console
 	apt-get install android-sdk-platform-tools
 	```
 	Arch-Linux Base :
 	```console
 	pacman -S android-tools
 	```
- Go to the release section and download the .zip file
- Execute *debloat_script.sh* et voilà !

### WINDOWS
- Install [WSL (Windows Subsystem for Linux)](https://itsfoss.com/install-bash-on-windows/) in order to be able to use bash script.

- Install [ADB](https://dl.google.com/android/repository/platform-tools-latest-windows.zip). If you want ADB support everywhere on your PC, you need to add the path of ADB folder in the system variables (see [this](https://www.xda-developers.com/adb-fastboot-any-directory-windows-linux/)).

- Go to the release section and download the .zip file

- Execute *debloat_script.sh* from the Ubuntu bash shell et voilà !


