#!/bin/bash

# BASH 4.3 or newer is needed ! (use of locale -n)

for file in ./lists/* ; do
  if [ -f "$file" ] ; then . "$file"; fi
done

# Colors used for printing
RED='\033[0;31m'
BLUE='\033[0;34m'
BBLUE='\033[1;34m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color
Bold=$(tput bold) 
nBold=$(tput sgr0)


function debloat {

	# user choice : restore/debloat
	local action=""
	(($restore)) && action='cmd package install-existing $package' || action='pm uninstall $option_needed $package'

	# Android 7.1 and older can't reinstall packages
	if (( $(echo "$(adb shell getprop ro.build.version.release) < 8.0" | bc -l) && !$force_uninstall)); then
		(($restore)) && action='pm enable $package' || action='pm disable-user $package && am force-stop $package && pm clear $package'
	fi

	local -n list=$1 # list is a nameref. Array is passed by reference.
	clear
	printf "\n${RED}${Bold}=== $1 debloat list ===${nBold}${NC}\n"
	for package in "${list[@]}"; do
		printf "${RED}$package${NC} --> "
		local output=$(eval adb shell $action)
		echo "$output"
		if [[ "$output" != "Failure" ]]; then echo "$package" >> "debloated_packages.txt"; fi 
	done
}

function carrier_choice {
	clear
	echo "1 - US_carriers"
	echo "2 - French carriers"
	echo "3 - German carriers"
	printf "\n${RED}${Bold}Your choice : ${nBold}${NC}"
	read -n 1 
	case $REPLY in	
		1) debloat us_carriers_bloat ;;
		2) debloat french_carriers_bloat ;;
		3) debloat german_carriers_bloat ;;
	esac
}

function list {
	clear
	printf "\n${RED}${Bold}Search for packages (grep used):${nBold}${NC} "
	read
	printf "\n"
	adb shell "pm list packages | grep -i $REPLY" | sed -r 's/package://g' | sort
	echo
	printf "\e[5mPress any key to continue\033[0m"
	read -n 1 -s
}

function remove_or_install_one {
	local choice=""
	local action=''
	if (($restore)); then choice="restore"; action='cmd package install-existing $REPLY';
	else choice="uninstall"; action='pm uninstall $option_needed $REPLY';
	fi

	# Android 7.1 and older can't reinstall packages
	if (( $(echo "$(adb shell getprop ro.build.version.release) < 8.0" | bc -l) && !$force_uninstall )); then
		(($restore)) && action='pm enable $REPLY' || action='pm disable-user $REPLY && am force-stop $REPLY && pm clear $REPLY'
	fi

	clear
	printf "\n${RED}${Bold}Package name to $choice :${nBold}${NC} "
	read
	local output=$(eval adb shell $action)
	echo "$output"
	if [[ "$output" != "Failure" ]]; then echo "$REPLY" >> "debloated_packages.txt"; fi
	echo
	printf "\e[5mPress any key to continue\033[0m"
	read -n 1 -s
}

function restore {
	clear
	printf "${RED}${Bold}Enter the path of the backup to restore :${nBold}${NC}"
	read
	[[ "$(check_backup_integrity $REPLY)" = "${GREEN}${Bold}OK${nBold}${NC}\n" ]] && adb restore $REPLY || printf "${RED}${Bold}The backup is corrupted${nBold}${NC}\n"
}

function check_backup_integrity {
	set -o pipefail
	printf "\n${BBLUE}\n[($1)] Backup integrity checking : \n${NC}";
	dd if="$1" bs=24 skip=1 | zlib-flate -uncompress | tar tf - >/dev/null;
	[[ $? = 0 ]] && printf "${GREEN}${Bold}OK${nBold}${NC}\n\n" || printf "${RED}${Bold}FAILED${nBold}${NC}\n\n"
	printf "\e[5m Press any key to continue\033[0m"
	read -n 1 -s
}

#######################################################################################################

adb shell exit
opcode=$?
if (( $opcode )); then printf "${RED}${Bold}Device not connected${NC}\n"; exit -1; fi

brand=$(adb shell getprop ro.product.brand | awk '{print tolower($0)}')

option_needed="" # '--user 0' option doesn't exist in Android SDK API version < 20
if [[ $(adb shell getprop ro.build.version.sdk) > 20 ]]; then option_needed="--user 0"; fi 

#clear
printf "\n ================================================\n"
printf " #                                              #\n"
printf " #       UNIVERSAL ANDROID DEBLOAT SCRIPT       #\n"
printf " #                                              #\n"
printf " # %10s${RED}${Bold}v2.2 (February 4th 2020)${nBold}%11s#\n"
printf " #                                              #\n"
printf " ================================================\n"
echo

#adb devices
printf "${RED}${Bold}Please carefully read the FAQ before using this script!\n\n${NC}"
printf "Do you want to do an ADB backup ? [Yes/No] ?\n\n${nBold}"
read -r
if [[ $REPLY =~ [Yy]+[Ee]*[Ss]* ]]; then
	clear;
	backup=$(date +%Y-%m-%d-%H:%M:%S)
	adb backup -apk -all -system -f "${PHONE:-phone}-${backup}.adb"  # -noshare option is default
	echo 
	read -n 1 -s -p "Press a key when the backup is done (your phone will tell you)"
	check_backup_integrity "${PHONE:-phone}-${backup}.adb";
fi

while true; do
	clear;

	if (( $(echo "$(adb shell getprop ro.build.version.release) < 8.0" | bc -l) )); then 
	printf "${RED}${Bold}WARNING : Your android version is too old (< 8.0). Uninstalled packages can't be restored.\n";
	printf "By default the script will force-disable the apps instead of uninstalling them so that you can restore them if needed\n\n"
	printf "If you still want to force-uninstall the apps, type '1' ('0' otherwise): ${NC}"
	read $force_uninstall
	fi
	
	clear;
	printf "\n${Bold}${ORANGE}===================  MAIN MENU  ===================\n"
	printf "#                                               ${ORANGE}  #\n"
	printf "#${nBold}${NC}%12s 0  -  List packages               ${ORANGE}  #\n"
	printf "#${NC}             1  -  Restore a save              ${ORANGE}  #\n"
	printf "#${NC}             2  -  Restore packages            ${ORANGE}  #\n"
	printf "#${NC}             3  -  Debloat packages            ${ORANGE}  #\n"
	printf "#${NC}                                               ${ORANGE}  #\n"
	printf "${Bold}===================================================${NC}${nBold}\n\n"

	printf "${RED}${Bold}DON'T FORGET TO REBOOT YOUR PHONE ONCE THE DEBLOAT IS OVER. ${nBold}${NC}\n\n"
	read -p "${Bold}Choose an action : ${nBold}" action
	echo

	if [[ $action = 0 ]]; then list; fi
	if [[ $action = 1 ]]; then restore; fi

	if [[ $action = 2 || $action = 3 ]]; then
		clear
		title="DEBLOAT"
		restore=0
		if [[ $action = 1 ]]; then title="RESTORE"; restore=1; fi

		printf "\n${Bold}${ORANGE}====================  $title  ====================\n"
		printf "#                                               ${ORANGE}  #\n"
		printf "#${NC}             1  -  $title a package     ${ORANGE}  %-6s#\n" | awk '{print tolower($0)}'
		printf "#${nBold}${NC}%12s 2  -  ${brand} %$((25-${#brand}))s  ${ORANGE}  #\n"
		printf "#${NC}             3  -  GFAM                        ${ORANGE}  #\n"
		printf "#${NC}             4  -  Carriers                    ${ORANGE}  #\n"
		printf "#${NC}             5  -  Others                      ${ORANGE}  #\n"
		printf "#${NC}             6  -  AOSP                        ${ORANGE}  #\n"
		printf "#${NC}                                               ${ORANGE}  #\n"
		printf "#${NC}            -1  -  Pending list /!\\    %4s    ${ORANGE}  #\n"
		printf "#${NC}                                               ${ORANGE}  #\n"
		printf "${Bold}===================================================${NC}${nBold}\n\n"
		read -p "${Bold}Your selection (e.g: 2 3 4 5 6): ${nBold}" action
		echo

		if [[ "$action" =~ 4 ]]; then carrier_choice; fi
		if [[ "$action" =~ -1 ]]; then debloat pending; fi
		if [[ "$action" =~ 1 ]]; then remove_or_install_one; fi
		if [[ "$action" =~ 2 ]]; then debloat $brand; fi
		if [[ "$action" =~ 3 ]]; then debloat google_bloat && debloat microsoft_bloat && debloat amazon_bloat && debloat facebook_bloat; fi
		if [[ "$action" =~ 5 ]]; then debloat misc_bloat; fi
		if [[ "$action" =~ 6 ]]; then debloat aosp_bloat; fi	
	fi

adb shell 'pm list packages' | sed -r 's/package://g' | sort > remaining_packages.txt

done