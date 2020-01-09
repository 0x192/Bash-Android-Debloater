#!/bin/bash

for file in ./lists/* ; do
  if [ -f "$file" ] ; then
    . "$file"
  fi
done

# Colors used for printing
RED='\033[0;31m'
BLUE='\033[0;34m'
BBLUE='\033[1;34m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
Bold=$(tput bold) 
nBold=$(tput sgr0)


function debloat {
	name=$1[@]
	bloat=("${!name}")
	printf "${RED}${bold}=== $1 debloat list ===${normal}${NC}\n"
	for i in "${bloat[@]}"; do
		printf "${RED}$i${NC} -->"
		adb shell "pm uninstall --user 0 $i"
	done
}

function carrier_choice {
	clear
	echo "1 - US_carriers"
	echo "2 - French carriers"
	read -r
	case $REPLY in	
		1) clear;debloat US_carrier_bloat ;;
		2) clear;debloat French_carrier_bloat ;;
	esac
}

function list {
	clear
	printf "\n${RED}${Bold}Search for packages (grep used):${nBold}${NC} "
	read -r
	printf "\n"
	adb shell "pm list packages | grep -i $REPLY"
	echo
	read -n 1 -s -r -p "Press any key to continue"
}

function remove {
	clear
	printf "\n${RED}${Bold}package name to remove : ${nBold}${NC} "
	read -r
	adb shell "pm uninstall --user 0 $REPLY"
}

function install {
	clear
	printf "\n${RED}${Bold}package name to reinstall : ${nBold}${NC} "
	read -r
	adb shell "cmd package install-existing $REPLY"
}

function restore {
	clear
	printf "${RED}${Bold}Enter the exact name of the backup to restore : ${nBold}${NC} "
	read -r
	adb restore $REPLY
}

function check_backup_integrity {
	set -o pipefail
	for a in *.adb; do
		echo "Backup integrity checking ($a)";
		dd if="$a" bs=24 skip=1 | zlib-flate -uncompress | tar tf - >/dev/null;
		if [ $? = 0 ]; then 
			printf "${RED}${Bold}Bakcup integrity check : OK${nBold}\n"
		else printf "${GREEN}${Bold}Backup integrity check : FAILED${nBold}\n"
		fi
	done
}

function brand_detection {
	brand=$(adb shell getprop ro.product.brand)
	if [[ $brand>0 ]]; then 
		case $brand in
			"asus")  
				echo "asus_bloat" ;;
			"huawei") 
				echo "huawei_bloat" ;;
			"lg") 
				echo "lg_bloat" ;;
			"nokia") 
				echo "nokia_bloat" ;;
			"samsung") 
				echo "samsung_bloat" ;;
			"sony") 	
				echo "sony_bloat" ;;
			"xiaomi") 	
				echo "xiaomi_bloat" ;;
			*) 
				echo "Brand not supported (yet)" ;;
		esac
	fi
}

clear
printf "\n ================================================\n"
printf " #                                              #\n"
printf " #             SCRIPT ----- DEBLOAT             #\n"
printf " #         ALL DEVICES COMPATIBLE (WIP)         #\n"
printf " #                                              #\n"
printf " # %10s${RED}${Bold}v1.5 (January 9th 2019)${nBold}%12s#\n"
printf " #                                              #\n"
printf " ================================================\n"
echo

adb devices
printf "${RED}${Bold}WARNING : Read carefully the FAQ before using this script!\n\n"
printf "Do you want to do a backup of your apps ? [Yes/No] ?\n\n${nBold}"
printf "REMINDER : It is likely that some apps wil NOT be backed up (see FAQ).\n\n"
read -r
if [[ $REPLY =~ [Yy]+[Ee]*[Ss]* ]]; then
	echo 
	adb backup -apk -all -system -f "${PHONE:-phone}-`date +%Y%m%d-%H%M%S`.adb"  # -noshare option is default
	echo "Checking backup integrity..."
	check_backup_integrity;
fi

brand=$(brand_detection)

while true; do
	printf "\n${Bold}${ORANGE}========= MAIN MENU  ========= ${NC}${nBold}\n\n"
	printf " 1   - Find packages\n"
	printf " 2   - Uninstall a specific package\n"
	printf " 3   - Reinstall a package\n"
	printf " 4   - Restore a backup\n"
	printf "\n${Bold}${BBLUE}------- DEBLOAT -------${NC}${nBold}\n"
	printf " 5   - ${brand}\n"
	printf " 6   - Google\n"
	printf " 7   - Carrier\n"
	printf " 8   - Amazon\n"
	printf " 9   - Facebook\n"
	printf " 10  - Microsoft\n"
	printf " 11  - Miscellaneous\n"
	printf " 12  - AOSP\n"
	printf "\n exit\n\n"
	printf "${Bold}${ORANGE}==============================${NC}${nBold}\n\n"

	printf "${RED}${Bold}DON'T FORGET TO REBOOT YOUR PHONE ONCE THE DEBLOAT IS OVER. ${nBold}${NC}\n\n"
	read -p "${Bold}Choose an action : ${nBold}" action
	echo

	case $action in	
		1) list ;;
		2) remove ;;
		3) install ;;
		4) restore ;;
		5) debloat $brand ;;
		6) debloat google_bloat ;;
		7) carrier_choice ;;
		8) debloat amazon_bloat ;;
		9) debloat facebook_bloat ;;
		10) debloat microsoft_bloat ;;
		11) debloat misc_bloat ;;
		12) debloat AOSP_bloat ;;
		"exit") break ;;
	esac
done
