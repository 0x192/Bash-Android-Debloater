# Universal Android Debloater

**DISCLAIMER** : I am not responsible for thermonuclear war, you getting fired because you broke the alarm app or for anything that could happen to your phone actually. 


Don't worry, this script is (pretty) safe if you only use my debloat lists. If not, the worse thing you can do is preventing a essential system process to be loaded during boot and causing thus an unfortunate bootloop. After about 5 failed system boot, the phone will automatically boot into recovery mode and you'll have to perform a FACTORY RESET. 

In any case, you can NOT brick your device with this script ! That's the main thing, right ? :smiley:

## Features :
* [X] Quick search among all the packages of a phone
* [X] Uninstall system/user package
* [X] Reinstall system package
* [X] Backup all .apk from system/user apps stored in internal memory
* [X] Restore an existed backup
* [X] Brand device detection and auto-selection of the appropriate debloat list
* [ ] Installation of alternative FOSS apps replacing stock apps (list in the WIKI section)

## Supported brands :
* [ ] Archos
* [X] Asus
* [X] LG
* [ ] Google
* [ ] HTC
* [X] Huawei
* [ ] Motorola
* [X] Nokia
* [X] Samsung
* [X] Sony
* [ ] Wiko
* [X] Xiaomi

## Debloat lists :
* [X] Amazon 
* [X] Brand's firmware specific
* [X] Facebook
* [X] Generic Android bloat
* [X] Google
* [X] Microsoft
* [X] Miscellaneous

Phone carriers :
* [X] T-Mobile
* [ ] Verizon 
* [ ] AT&T
* [ ] Free 
* [ ] SFR
* [ ] Orange
* [ ] Bouygues Telecom


## How to use it (Newbies) :
- **Read the [FAQ](https://gitlab.com/W1nst0n/universal-android-debloater/wikis/FAQ) !!** 
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

