# Universal Android Debloater

Bash script using ADB for unrooted smartphones.

**DISCLAIMER** : I am not responsible for thermonuclear war, you getting fired because you disabled the alarm app or for anything that could happen to your phone actually. :)

Don't worry, this script is pretty safe if you only use my debloat lists. The worse thing you can do is "deleting" (this script doesn't delete because it's for non-rooted phone actually (see FAQ)) a system packet essential to the system preventing the phone to correctly boot (bootloop). After arround 5 try to boot, the phone will automatically boot into recovery mode enabling you to do a FACTORY RESET. You can NOT brick your device with this script ! 

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
- **Wiki and FAQ (What to do if the phone is in bootloop etc...)
- Add optionnal installation of alternative FOSS apps (F-droid, YalpStore,Silence...)
- Improve UI/UX
- Add Windows compatibility
- Add in comment the purpose of each deleted package


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

