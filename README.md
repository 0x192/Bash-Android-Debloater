# Universal Android Debloater

**DISCLAIMER**: Use this script at your own risk. I am not responsible for anything that could happen to your phone. 

## Summary
I try to provide and maintain a universal tool which remove bloatwares on any unrooted Android phones. 

The main goal is to improve battery performance and privacy by limiting the tracking from preinstalled apps. The script has a menu that lets you choose what debloat list you want to use. I strongly encourage you to take a look at the lists because some apps are commented out by default. All packages are as well documented as possible in order to provide the a better understanding of what you can delete or not.

This script *should* be safe with the default selection. The worse thing which could happen is preventing an essential system process to be loaded during boot causing then an unfortunate bootloop. After about 5 failed system boots, the phone will automatically reboot in recovery mode and you'll have to perform a FACTORY RESET. 

In any case, you can NOT brick your device with this script ! That's the main thing, right ? :smiley:

## Features 
* [X] Quick search among all the packages of your phone
* [X] Uninstallation of system/user packages (manually or with the debloat lists)
* [X] Reinstallation of system packages
* [X] ADB backup (not really reliable, see the FAQ)
* [X] Device brand detection and auto-selection of the appropriate manufacturer debloat list
* [X] Logs in `debloated_packages.txt` and `remaining_packages.txt`.
* [ ] Installation of alternative open-source apps replacing stock apps (list in the WIKI section) (WIP)

NB : It is NOT a real uninstallation for system apps (see the [FAQ](https://gitlab.com/W1nst0n/universal-android-debloater/-/wikis/FAQ))

## Universal debloat lists 
* [X] GFAM (Google/Facebook/Amazon/Microsoft)
* [X] AOSP bloat
* [X] Manufacturers bloat
* [X] Mobile carriers bloat
* [X] Miscellaneous bloat

## Manufacturers debloat lists
* [ ] Archos
* [X] Asus
* [X] LG
* [X] Google
* [ ] HTC
* [X] Huawei
* [X] Motorola
* [X] Nokia
* [X] OnePlus	
* [X] Samsung
* [X] Sony
* [ ] Wiko
* [X] Xiaomi
* [ ] ZTE

## Mobile carriers debloat lists 

|**France**       | **USA**  |**Germany** |
|:---------------:|:--------:|:----------:|
| Orange          | T-Mobile |  Telekom   |
| SFR             | Verizon  |            |
| Free            | Sprint   |            |
| Bouygues / Sosh | AT&T     |            |


## How to use it 
- **Read the [FAQ](https://gitlab.com/W1nst0n/universal-android-debloater/-/wikis/FAQ) !!**
- **Do a proper backup of your data ! You can never be too careful !**
- Enable *Developer Options* on your smartphone.
- Turn on *USB Debugging*.

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

- Go to the release section, download the lastest release and enjoy : 
```
bash debloat_script.sh
```


### WINDOWS
- Install [WSL (Windows Subsystem for Linux)](https://itsfoss.com/install-bash-on-windows/) in order to be able to use bash script.

- Install [ADB](https://dl.google.com/android/repository/platform-tools-latest-windows.zip). If you want ADB support everywhere on your PC, you need to add the path of ADB folder in the system variables (see [this](https://www.xda-developers.com/adb-fastboot-any-directory-windows-linux/)).

- Go to the release section and download the lastest release.

- Execute the script from the Ubuntu bash shell et voilà !
```
bash debloat_script.sh
```

- **Don't forget to check the debloat lists to see what are my default choices and to avoid any bad surprises.**

