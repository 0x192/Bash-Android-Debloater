# Universal Android Debloater

**DISCLAIMER**: Use this script at your own risk. I am not responsible for anything that could happen to your phone. 

## Summary
I try to maintain a universal tool which removes bloatwares on any Android phones by using ADB.

The main goal is to improve battery performance and privacy by removing unnecessary and obscure system apps. This can also contribute to improve security by reducing [the attack surface](https://en.wikipedia.org/wiki/Attack_surface). The script has a menu that lets you choose what debloat list you want to use. I strongly encourage you to take a look at the lists because the default selection may not suit you. All packages are as well documented as possible in order to provide a better understanding of what you can delete or not.

This script *should* be safe with the default selection. The worse thing which could happen is preventing an essential system process to be loaded during boot causing then an unfortunate bootloop. If you used the non-root solution, after about 5 failed system boots, the phone will automatically reboot in recovery mode and you'll have to perform a FACTORY RESET. So make a backup!

If you have a rooted device you can also physically delete the apks. Ironically this solution is safer because the script saves the apks before their removal. In case of bootloop you just need to run the script from a recovery with ADB support (e.g TWRP) and restore them.

In any case, you can NOT brick your device with this script! That's the main thing, right?

## Features 
* [X] Quick search among all the packages of an android device
* [X] Uninstallation of system/user packages (manually or with the debloat lists)
* [X] Reinstallation of system packages (manually or with the debloat lists)
* [X] ADB backup/restore (not really reliable, see the [FAQ](https://gitlab.com/W1nst0n/universal-android-debloater/-/wikis/FAQ))
* [X] Device brand detection and auto-selection of the appropriate manufacturer debloat list
* [X] Logging:`debloated_packages.txt`, `remaining_packages.txt`, `deleted_apks.txt` (for root users)
* [X] Root support
* [ ] Installation of alternative open-source apps replacing stock apps (list in the WIKI section) (WIP)

NB : The non-root method is NOT a real uninstallation for system apps (see the [FAQ](https://gitlab.com/W1nst0n/universal-android-debloater/-/wikis/FAQ))

## Universal debloat lists 
* [X] GFAM (Google/Facebook/Amazon/Microsoft)
* [X] AOSP
* [X] Manufacturers (OEM)
* [X] Mobile carriers
* [X] Qualcomm / Mediatek / Miscellaneous

## Manufacturers debloat lists
* [ ] Archos
* [X] Asus
* [ ] Blackberry
* [ ] Gionee
* [X] LG
* [X] Google
* [ ] HTC
* [X] Huawei
* [X] Motorola
* [X] Nokia
* [X] OnePlus
* [X] Oppo  
* [X] Samsung
* [X] Sony
* [ ] TCL
* [ ] Wiko
* [X] Xiaomi
* [ ] ZTE

## Mobile carriers debloat lists
|   Country       | Carriers                          |
|-----------------|-----------------------------------|
| France          | Orange, SFR, Free, Bouyges/Sosh   |
| USA             | T-Mobile, Verizon, Sprint, AT&T   |  
| Germany         | Telekom                           |


## How to use it 
- **Read the [FAQ](https://gitlab.com/W1nst0n/universal-android-debloater/-/wikis/FAQ)!**
- **Do a proper backup of your data! You can never be too careful!**
- Enable *Developer Options* on your smartphone.
- Turn on *USB Debugging* from the developper panel.
- From the settings, disconnect from any OEM accounts (when you delete OEM account package it could lock you on the lockscreen because the phone can't associate your identity anymore)
<p>
<details>
<summary>LINUX</summary>

- Install *Android platform tools* and *qpdf* on your PC :

Debian Base:
```bash
$ sudo apt install android-sdk-platform-tools qpdf zip
```
Arch-Linux Base:
```bash
$ sudo pacman -S android-tools qpdf zip
```
Red Hat Base:
```bash
$ sudo yum install android-tools qpdf zip
```
</details>
</p>

<p>
<details>
<summary>MAC OS</summary>

- Install [Homebrew](https://brew.sh/)
- Install *Android platform tools* and *qpdf*

You will also need to upgrade bash because Apple ships a very old bash version (3.2.57) due to licencing issues.

```bash
$ brew install android-platform-tools qpdf bash
```
</details>
</p>

<p>
<details>
<summary>WINDOWS</summary>

Windows can't natively run bash script. Choose a workaround:

## Method 1: Live Linux USB
Create a Linux Live USB. Boot your computer on it and follow the instructions of the `LINUX` section. If you are a new to Linux, this will be a good opportunity to discover this wonderful OS. I recommend Linux Mint: [Instructions](https://itsfoss.com/install-linux-mint/)

**Note:** Just in case, I recall that you don't need to install Linux on your computer. You can do whatever your want direclty on the Live USB.

## Method 2: WSL (W10 only)
This method consists of installing WSL, a compatibility layer for running Linux binary executables natively on Windows 10.

For now, there is no USB support in the WSL. This means you need to install both Windows and Linux platform-tools and force the use of Windows adb server.

- Download [android platform tools](https://dl.google.com/android/repository/platform-tools-latest-windows.zip) and unzip it somewhere. [Add the folder to your PATH](https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/).
- [Install USB drivers of your device](https://developer.android.com/studio/run/oem-usb#Drivers)
- Check your device is detected:
```batch
> adb devices
```

- Install [WSL2 (Windows Subsystem for Linux)](https://itsfoss.com/install-bash-on-windows/) in order to be able to run bash scripts.
- Install *Android platform tools* and *qpdf* from the Debian/Ubuntu shell
```bash
$ sudo apt update && sudo apt upgrade
$ sudo apt install android-sdk-platform-tools qpdf zip
```
- Check the version of ADB on Linux & Windows
```bash
adb version
```
You need the same version otherwise it will not work. It's very likely your Ubuntu/Debian ADB version is older than the Windows one. 
Download the lastest linux platform tools from Google and replace your adb binaries with the new ones :
```bash
$ wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
$ unzip platform-tools-latest-linux.zip
$ sudo cp platform-tools/adb /usr/bin/adb
$ sudo chmod 755 /usr/bin/adb
$ adb version
```
Kill the WSL adb server:
```bash
$ adb kill-server
```
And start the ADB server on Windows: 
```batch
> adb kill-server
> adb start-server
> adb devices
```
Note: You can access your Windows files under `/mnt/c/`

</details>
</p>


- Download [the lastest release of Android Universal Debloater](https://gitlab.com/W1nst0n/universal-android-debloater/-/releases).
- Browse through the debloat lists to be sure the default selection suits you.
- Run `debloat_script.sh` from a Unix terminal.
```bash
$ bash debloat_script.sh
```

**NOTE:** Chinese phones users may need to use the AOSP list for removing some stock apps because those chinese manufacturers (especially Xiaomi and Huawei) have been using the name of AOSP packages for their own (modified & closed-source) apps.

**IMPORTANT NOTE:** You will have to run this script whenever your OEM push an update to your phone as some *uninstalled* system apps could be reinstalled.

## How to contribute

Hey-hey-hey! Don't go away so fast! This is a community project. That means I need you! I'm sure you want to make this project better anyway.

==> [How to contribute](https://gitlab.com/W1nst0n/universal-android-debloater/-/wikis/home#how-to-contribute)