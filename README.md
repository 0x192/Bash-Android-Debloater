# Universal Android Debloater

Bash script using ADB for unrooted smartphones.

## Features :
- Quick search among all the packages of a phone
- Uninstall system/user package
- Reinstall system package
- Backup all .apk from system/user apps stored in internal memory
- Restore an existed backup
- Brand device detection and auto-selection of the appropriate debloat list

## Supported brands :
- Asus
- LG
- Huawei
- Nokia
- Samsung
- Sony
- Xiaomi

## Debloat lists :
- Brand's firmware related
- Facebook related
- T-Mobile related
- Microsoft related
- Google related
- Miscellaneous 


## === TODO list === 
- **Add debloat list for Wiko, Motorola, Google (Pixel)**
- Add optionnal installation of alternative FOSS apps (F-droid, YalpStore,Silence...)
- Improve UI/UX
- Add Windows compatibility
- Add in comment the purpose of each deleted package


## How to use it (Newbies) :
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

