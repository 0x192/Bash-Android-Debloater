# New Release (v2.2)

## Bugfixes
- Android version checking (fixed #2).
- Fixed empty list bug when choosing "manufacturer debloat".
- Pending list selection.
- Misc bugs nobody saw because I'm the only user of this script ! :D

## New manufacturers supported
- **Zte**: 2 new packages. (yeah it's not great)

## Pending --> Official lists
- **Miscellaneous** : 47 new packages (including 3 new *Qualcomm* packages)
- **Carriers** : 7 new packages (3 Sprint packages + 4 AT&T Packages)
- **Samsung** : 1 new package 

## Miscellaneous
- Code improvements and cleaning.
- Some minor UI/UX improvements.
- Improved documentation for some packages.
- Better error handling. Script should now exit with a useful error output if something went wrong.
- You can now choose separately `Google`, `Facebook`, `Amazon` and `Microsoft` lists.


# New Release (v2.1)

## Alternative method for Android 8.0 and older
Older Android versions can't reinstall uninstalled packages. The script now detects this case and proposes disabling the apps and clearing data instead of uninstalling them.
Concretely, the script will use : `pm disable-user $package && am force-stop $package && pm clear $package`. Restore will use `pm enable $package`.

## More packages added
- **AOSP** : 3 new packages
- **Miscellaneous** : 2 new packages
- **Carriers** : 6 new packages (4 AT&T packages + 2 Sprint packages)
- **Pending** : 26 new packages (Oppo packages)

## Miscellaneous
- Fixed a (dumb) bug that forced *uninstall* choice even if the user choosed *restore*.
- Fixed a (dumb again) bug that prevented the backup integrity check function to find the backup. 
- Improved the debloat/restore function to avoid checking redondant if statements.
- Added a step for people who can't uninstall the Google Play services.
- Minor spelling corrections.

# New Release (v2.0)

I worked hard for this release ! This is a big one ! Enjoy ! :rocket:

## Major overhaul of the script
- Improved UI/UX.
- Performance improvement (you will not feel it but still local variables are used and packages arrays are passed by reference to avoid useless copy).
- Miscellaneous code improvement.

## New features
 - You can now select (restore/debloat) several lists at once 
 - Debloated packages are now listed in a file called `debloated_packages.txt`.
 - A list of all your packages (after debloat) is automatically exported in a file called `remaining_packages.txt`.

## New manufacturers supported
- **OnePlus**: 32 new packages.
- **Motorola** : 60 new packages.

## New mobiles carriers supported
- `[FR]` **Orange/Sosh** : 13 new packages.
- `[FR]` **Bouygues** : 3 new packages** (not much bloat it seems).
- `[FR]` **SFR** : 5 new packages (not much bloat neither).
- `[DE]` **Telekom**: 1 new package (idem).
- `[US]` **Sprint** : 25 new packages.
- `[US]` **AT&T** : 15 new packages.

## Always more packages ! 
- **AOSP** : 8 new packages.
- **Google** : 5 new packages.
- **Miscellaneous** : 30 new packages including 13 new *Qualcomm* packages.
- **Carriers** : 14 new *Verizon* packages.
- **Sony** : 2 new packages (commented-out by default).

## Pending list
New list added in the main menu (`-1 - Pending list`). Packages are located in `lists/0 - Pending.sh` file. 

**List packages are undocumented. This mean I did no proper search yet so it's not impossible that some packages are unsafe to delete.**
Currentlty this means that I either found them in debloat lists lying around on XDA forums or that I preselected them from a full packages list of a phone I had on hand.

In the future, when some nice users will help me, packages will get off the pending list faster ! ;)

## Miscellaneous
- Commented out all the packages I put outside of the arrays (because you should never delete them) to remove (harmless) bash errors at the script startup.
- Documentation and official support for the 26 new Samsung packages added in *v1.8*.
- Improved the documentation for some packages.
- Added some worth reading stuff about US mobile carriers scandals.
- Fixed 2 bad package name.
- Fixed some spelling mistakes.
- Moved *com.trustonic.tuiservice* from Samsung list to Miscellaneous file.
- Moved *org.codeaurora.gps.gpslogsave* from Xiaomi list to Miscellaneous list.
- Deleted some leftover duplicates.
- Android 4.4 (API level 19) is now supported. `--user 0` is removed when API is < 21 because it causes error (unknown option)
- Commented out some packages after testing.


# New Release (v1.9)

## Added : 
- Full documentation for **Nokia** and **Sony** packages.
- **A lot** of country specific Nokia packages.

## Misc
- Added 1 new package to Sony list.
- Moved *com.android.simappdialog* from Nokia list to AOSP list
- Moved *com.quicinc.cne.CNEService* from Nokia list to Miscellaneous list (it's a Qualcomm package)


# New Release (v1.8)

## Added : 
- Full documentation for *Asus* & *LG* packages.
- **26** new samsung packages at the end of the *Samsung file*. **They are not deleted by default because I haven't documented them yet but it should be safe to debloat.**


## Misc
- Removed a duplicate Samsung package.
- Minor improvements on documention for some packages (including evidences that Samsung Device Care sends data to China)
- Moved *com.caf.fmradio* from *Samsung* file and *Asus* file (they were duplicates) to *Miscellaneous* file
- Moved 5 packages from *Asus* file to *Miscellaneous* file.
- Minor spelling corrections.


# New Release (v1.7)

## New : 
- Full documentation for :
	- Xiaomi packages
	- Huawei packages

## Misc
- Fixed 2 package name (com.miui.analytics & com.huawei.hwid) that was miswritten. 
- **Removed a lot of Xiaomi duplicates** (I think I forgot checking for duplicate after adding a list of new packages...).
- Regrouped some Xiaomi packages together because you may not want to delete it (but you should if you ask me).
- Moved *com.eterno* (Daily hunts News) from Xiaomi list to Miscellaneous list.
- Moved *com.opera.preinstall* (Opera Max Data Saving) from Xiaomi list to Miscellaneous list.
- Moved *com.phonepe.app* (PhonePe) from Xiaomi list to Miscellaneous list.
- Removed *com.samsung.aasaservice* from Xiaomi list (dafuk ? O_O).
- Reordered the Xiaomi list (alpabetic order + advanced debloat).
- **Removed an extra space at the end of all package name strings in Huawei file causing the script to not find any Huawei packages** (whoops :/)


# New Release (v1.6)

## New : 
- Complete documentation for :
	- Carriers packages
	- Miscellaneous packages
	- Google packages

- Added somes new packages 

## Misc
- Fix 3 wrong packages names
- Moved Verizon Motorola-exclusive bloat from *Motorola* file to *Carriers* file
- Some cleaning (some packages were still not in the right file)
- Updated pre-selection for Miscellenaous packages


# Happy new year (v1.5)

## New : 
- A bunch of new packages for Samsung devices added
- Verizon carrier bloatwares added
- **Full documentation for listed packages** (It takes a lot of time !) : 
	- Google 
	- Samsung
	- AOSP
- Merge carrier bloat into a single category (7 - Carrier) in the main menu. US carriers and EU carriers are traited separatly.
- When searching for packages, *grep* is now used with *-i* argument to be case insensitive.
- Generic android packages regrouped in the appropriate list (they were spread out among the others lists). List renamed in AOSP.
- Better categorization of packages. Somes were not in the good file.
- **Each manufacturer has now its own file**. This idea is to document all the packages so you can choose what you want to debloat. There will still be a preselection.


### Misc 
- Fixed some glitches with bold and colors
- UI/UX improved
- Full english translation (Finally !)
- Code improvement and cleaning


# This is an important one (v1.4)

### Added : 
- Even more packages to debloat for Xiaomi, Nokia & Sony devices

### Changed:
- Package **com.google.android.packageinstaller** removed because it causes bootloop on Xiaomi Note 5. I don't know why I added this one on the list. It's a essential core package.

# Reminder is important (v1.2.1)

### Added : 
- **Reminder for the user** 
	- To read the FAQ before using the script
	- To reboot the phone after debloat
	- The backup is not what you could think (refer to the FAQ)

# More supported devices (v1.2)
	
### Added : 	
- **Asus debloat list**	
- **LG debloat list**	
- **Nokia debloat list**
	

# What a naughty bug (v1.1)

### Added : 
- **Sony debloat list**
### Changed :
- **Some changes in other debloat lists**

### Bugfixes : 
- **Package display when debloating**


# Here we go (v1.0)

### New features : 
- **Restore a backup**
- **Brand auto-detect**
	- new option "Auto debloat" added which use the debloat list adapted to your phone.

### Changed : 
- **UI/UX adjustments**
- **Some improvement in the code**


# Beta Version (v0.9)

### New features :
- **Backup before debloating**
	- Backup all .apk apps (system ones included)
	- Only those stored in internal memory
	- Backup is stored in current directory under "phone-DDMMYY-HHMMSS.adb"
	- Adding 

### Changed :
- **Minor UI changes**


# Beta Version (v0.8)

### New features :
- **New debloat list** :
	- Miscellaneous

### Changed :
- **Most of android bloat (independant from brand device) is now moved into its own list (Android bloat) in order to avoid duplicate in the others lists**
- **UI/UX improvement :**
	- Colors added
	- New banner
- **Moved the debloat lists into a another file (debloat_lists.sh)**
- **Removing 2 packages from the "Android debloat list" causing issue when importing contacts from a file**
- **Minor performances improvement**


# Beta Version (v0.7)

### New features :
- **New drand's specific debloat list** : 
	- Huawei
- **New debloat list** :
	- T-Mobile related
	- Microsoft related
	- Google related 
	- "Android in general" related

### Changed :
- **Most of android bloat (independant from brand device) is now moved into its own list (Android bloat) in order to avoid duplicate in the others lists
- **UI/UX improvement :**
	- Adding Colors
	- New banner


# Beta Version (v0.6)

### New features added :
- **New Brand's specific debloat list** : 
	- Xiaomi (not complete)
- **New debloat list** :
	- Facebook related

### Changed : 
- **Improving Samsung debloat list
- **UI/UX improvements**


# Initial Beta Version (v0.5)

### Features :
- **Debloat list for Samsung (Galaxy S)**
- **Quick search among all the packages of the phone**
- **Debloat specific package**
- **Restore specific package**