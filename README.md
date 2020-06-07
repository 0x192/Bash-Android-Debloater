# Universal Android Debloater

**DISCLAIMER**: Use this script at your own risk. I am not responsible for anything that could happen to your phone. 

## Summary
I try to provide and maintain a universal tool which remove bloatwares on any (non-rooted) Android phones. 

The main goal is to improve battery performance and privacy by removing unnecessary and obscure system apps. This can also contribute to improve security by reducing [the attack surface](https://en.wikipedia.org/wiki/Attack_surface). The script has a menu that lets you choose what debloat list you want to use. I strongly encourage you to take a look at the lists because the default selection may not suit you. All packages are as well documented as possible in order to provide a better understanding of what you can delete or not.

This script *should* be safe with the default selection. The worse thing which could happen is preventing an essential system process to be loaded during boot causing then an unfortunate bootloop. After about 5 failed system boots, the phone will automatically reboot in recovery mode and you'll have to perform a FACTORY RESET. So make a backup ! 

In any case, you can NOT brick your device with this script ! That's the main thing, right ? :smiley:

## Features 
* [X] Quick search among all the packages of your phone
* [X] Uninstallation of system/user packages (manually or with the debloat lists)
* [X] Reinstallation of system packages (manually or with the debloat lists)
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
* [ ] Oppo  
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
- **Read the [FAQ](https://gitlab.com/W1nst0n/universal-android-debloater/-/wikis/FAQ) !**
- **Do a proper backup of your data ! You can never be too careful !**
- Enable *Developer Options* on your smartphone.
- Turn on *USB Debugging* from the developper panel.
- Install *Android plateform tools* and *qpdf* on your PC.
- Download [the lastest release of the script](https://gitlab.com/W1nst0n/universal-android-debloater/-/releases) 
- Check the debloat lists to be sure the default selection suits you.
- Run `debloat_script.sh` from a Unix terminal 
```console
bash debloat_script.sh
```

### Installation of plateform tools and qpdf

#### LINUX
Debian Base :
```console
foo@bar:~$ sudo apt install android-sdk-platform-tools qpdf
```
Arch-Linux Base :
```console
foo@bar:~$ sudo pacman -S android-tools qpdf
```
Fedora :
```console
foo@bar:~$ sudo yum install android-tools qpdf
```

#### MAC OS
- Install [Homebrew](https://brew.sh/)
```console
foo@bar:~$ brew install android-platform-tools qpdf
```

### WINDOWS
- Install [WSL (Windows Subsystem for Linux)](https://itsfoss.com/install-bash-on-windows/) in order to be able to run bash scripts.
- Install *Android plateform tools* and *qpdf* :
```console
foo@bar:~$ sudo apt install android-sdk-platform-tools qpdf
```



