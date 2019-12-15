# Universal Android Debloater

**DISCLAIMER** : I am not responsible for thermonuclear war, you getting fired because you broke the alarm app or for anything that could happen to your phone actually.

But don't worry. This script *should* be safe as long as you only use my debloat lists and the stable release. If not, the worse thing you can do is preventing a essential system process to be loaded during boot thus causing an unfortunate bootloop. After about 5 failed system boot, the phone will automatically boot into recovery mode and you'll have to perform a FACTORY RESET. 

In any case, you can NOT brick your device with this script ! That's the main thing, right ? :smiley:

**Don't forget to backup importants things before doing anythings ! You can never be too careful**

## Features :
* [X] Quick search among all the packages of your phone
* [X] Uninstall any system/user package
* [X] Reinstall system packages
* [X] ADB backup (see FAQ)
* [X] Brand device detection and auto-selection of the appropriate debloat list
* [X] Light/heavy debloat
* [ ] Installation of alternative FOSS apps replacing stock apps (list in the WIKI section)

## Universal debloat lists :
* [X] Amazon 
* [X] Manufacturer bloat
* [X] Facebook
* [X] Generic Android bloat
* [X] Google
* [X] Microsoft
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

## Phone carriers debloat list : 
 - France 
	* [ ] Free 
	* [ ] SFR
	* [ ] Orange
	* [ ] Bouygues Telecom
- USA
	* [X] T-Mobile 
	* [ ] Verizon 
	* [ ] AT&T

## How to use it (Newbies) :
- **Read the [FAQ](https://gitlab.com/W1nst0n/universal-android-debloater/-/wikis/FAQ) !!** 
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

