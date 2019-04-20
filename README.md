# Universal Android Debloater

Bash script using ADB for unrooted smartphones.


> **DISCLAIMER** : I am not responsible for thermonuclear war, you getting fired because you disabled the alarm app or for anything that could happen to your phone actually. :)
>

Don't worry, this script is pretty safe if you only use my debloat lists. The worse thing you can do is "deleting" (you don't delete actually -- cf.FAQ) a system packet essential to the system preventing the phone to boot correctly (bootloop). After about 5 failed system boot, the phone will automatically boot into recovery mode enabling you to do a FACTORY RESET. 

You can NOT brick your device with this script ! 

## Features :
* [X] Quick search among all the packages of a phone
* [X] Uninstall system/user package
* [X] Reinstall system package
* [X] Backup all .apk from system/user apps stored in internal memory
* [X] Restore an existed backup
* [X] Brand device detection and auto-selection of the appropriate debloat list
* [ ] Installation of alternative FOSS apps replacing stock app (list in the WIKI section)

## Supported brands :
* [X] Asus
* [X] LG
* [ ] Google
* [X] Huawei
* [ ] Motorola
* [X] Nokia
* [X] Samsung
* [X] Sony
* [ ] Wiko
* [X] Xiaomi

## Debloat lists :
* [X] Brand's firmware related
* [X] Facebook related
* [X] Google related
* [X] Microsoft related
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
- **Read the FAQ (Wiki Section)**
- Install *Android plateform tools* with your package manager :

 	Debian Base : 
 	```console
 	apt-get install android-sdk-platform-tools
 	```
 	Arc-Linux Base :
 	```console
 	pacman -S android-tools
 	```
- Go to the release section and download the .zip file
- Execute *debloat_script.sh* et voilà ! 

