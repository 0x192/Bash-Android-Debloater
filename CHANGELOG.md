# This is an important one (v1.4)

### Added : 
- Even more package to debloat for Xiaomi, Nokia & Sony devices

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
- **New drand's specific debloat list** : 
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