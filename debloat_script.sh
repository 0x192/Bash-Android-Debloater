#!/bin/bash
#
# BASH 4.3 or newer is needed ! (use of locale -n)

for file in ./lists/* ; do
  if [ -f "$file" ] ; then . "$file"; fi
done

# Script version 
VERSION="v2.2 (March 17th 2020)"

# Colors used for printing
BRED='\033[1;31m' # Bold + Red
BBLUE='\033[1;34m' # Bold + Blue
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color
Bold=$(tput bold) 
nBold=$(tput sgr0)


function debloat {
	local action="" # restore/debloat
	(($restore)) && action='cmd package install-existing $package' || action='pm uninstall ${option_needed:=""} $package'
	
	# Android 7.1 and older can't reinstall packages
	if [[ $old_android -eq 1 ]] && [[ ${force_uninstall:=0} -eq 0 ]]; then
		(($restore)) && action='pm enable $package' || action='pm disable-user $package && am force-stop $package && pm clear $package'
	fi

	local -n list=$1 # list is a nameref. Array is passed by reference.
	clear
	printf "\n${BRED}${Bold}=== $1 debloat list ===${nBold}${NC}\n"
	for package in "${list[@]}"; do
		printf "${BRED}$package${NC} --> "
		local output=$(eval adb shell $action)
		echo "$output"
		if ! [[ "$output" =~ "Failure" ]] && [[ $restore -eq 0 ]]; then echo "$package" >> "debloated_packages.txt"; fi
	done
}

function lists_selection {
	clear
	for ((i=1; i<=$#; i++)); do
		echo "$i - ${!i}"
	done

	printf "\n${BRED}${Bold}Your choice (e.g 1 2 3) : ${nBold}${NC}"
	read -a REPLY

	for list in ${REPLY[@]}; do
		if [[ $list -gt $# ]] || [[ $list -lt 1 ]]; then continue; fi
		debloat ${!list}
	done
}

function list {
	clear
	printf "\n${BRED}${Bold}Search for packages (grep used):${nBold}${NC} "
	read
	echo
	adb shell "pm list packages | grep -i $REPLY" | sed -r 's/package://g' | sort
	echo
	printf "\e[5mPress any key to continue\033[0m"
	read -n 1 -s
}

function remove_or_install_one {
	local choice=""
	local action=''
	if (($restore)); then choice="restore"; action='cmd package install-existing $REPLY';
	else choice="uninstall"; action='pm uninstall ${option_needed:=""} $REPLY';
	fi

	# Android 7.1 and older can't reinstall packages
	if [[ $old_android -eq 1 ]] && [[ ${force_uninstall:=0} -eq 0 ]]; then
		(($restore)) && action='pm enable $REPLY' || action='pm disable-user $REPLY && am force-stop $REPLY && pm clear $REPLY'
	fi

	clear
	printf "\n${BRED}${Bold}Package name to $choice :${nBold}${NC} "
	read
	local output=$(eval adb shell $action)
	echo "$output"
	if ! [[ "$output" =~ "Failure" ]] && [[ $restore -eq 0 ]]; then echo "$REPLY" >> "debloated_packages.txt"; fi
	echo
	printf "\e[5mPress any key to continue\033[0m"
	read -n 1 -s
}

function restore {
	clear
	printf "${BRED}Enter the path of the backup to restore :${NC} "
	read
	check_backup_integrity $REPLY && adb restore $REPLY || printf "\n${BRED}${Bold}The backup is corrupted. Abort!${nBold}${NC}\n"
	echo
	printf "\e[5mPress any key to continue\033[0m"
	read -n 1 -s
}

function check_backup_integrity {
	printf "\n${BBLUE}\n[($1)] Backup integrity checking :${NC} ";
	[[ -f $1 ]] || { printf "${BRED}Backup not found${NC}\n\n"; return 1;}
	{ dd if="$1" bs=24 skip=1 | zlib-flate -uncompress | tar tf - >/dev/null; } ||:
	(( $? )) && printf "${BRED}FAILED$${NC}\n\n" >&2
}

###############################################  MAIN SCRIPT  ##########################################################

set -euo pipefail # Safer bash script

brand=$(adb shell getprop ro.product.brand | awk '{print tolower($0)}')
old_android=$(echo "$(adb shell getprop ro.build.version.release) < 8.0" | bc -l)

# '--user 0' option doesn't exist in Android SDK API version < 20
if [[ $(adb shell getprop ro.build.version.sdk) > 20 ]]; then option_needed="--user 0"; fi

clear
echo   " ================================================"
echo   " #                                              #"
echo   " #       UNIVERSAL ANDROID DEBLOAT SCRIPT       #"
echo   " #                                              #"
printf " #${BRED}%$(((46-${#VERSION})/2))s${VERSION}%$(((47-${#VERSION})/2))s${NC}#\n"
echo   " #                                              #"
echo   " ================================================"
echo

adb devices
printf "${BRED}Please carefully read the FAQ before using this script!\n\n${NC}"
printf "Do you want to do an ADB backup ? [Yes/No] ?\n\n"
read -r
if [[ $REPLY =~ [Yy]+[Ee]*[Ss]* ]]; then
	clear;
	backup=$(date +%Y-%m-%d-%H:%M:%S)
	adb backup -apk -all -system -f "${PHONE:-phone}-${backup}.adb"  # -noshare option is default
	echo 
	read -n 1 -s -p "Press a key when the backup is done (your phone will tell you) "
	check_backup_integrity "${PHONE:-phone}-${backup}.adb";
fi

if (( $old_android )); then 
	printf "${BRED}WARNING : Your android version is too old (< 8.0). Uninstalled packages can't be restoBRED.\n";
	printf "By default the script will force-disable the apps instead of uninstalling them so that you can restore them if needed\n\n"
	printf "If you still want to force-uninstall the apps, type '1' ('0' otherwise): ${NC}"
	read $force_uninstall
fi

while true; do
	clear
	
	printf "\n${Bold}${ORANGE}===================  MAIN MENU  ===================\n"
	printf "#                                               ${ORANGE}  #\n"
	printf "#${nBold}${NC}%12s 0  -  List packages               ${ORANGE}  #\n"
	printf "#${NC}             1  -  Restore a save              ${ORANGE}  #\n"
	printf "#${NC}             2  -  Restore packages            ${ORANGE}  #\n"
	printf "#${NC}             3  -  Debloat packages            ${ORANGE}  #\n"
	printf "#${NC}                                               ${ORANGE}  #\n"
	printf "${Bold}===================================================${NC}${nBold}\n\n"

	printf "${BRED}DON'T FORGET TO REBOOT YOUR PHONE ONCE THE DEBLOAT IS OVER.${NC}\n\n"
	read -p "${Bold}Choose an action : ${nBold}" action
	echo

	if [[ $action = 0 ]]; then list; fi
	if [[ $action = 1 ]]; then restore; fi

	if [[ $action = 2 || $action = 3 ]]; then
		clear

		declare -p $brand &>/dev/null || printf "\n${BRED}No $brand debloat list found. Feel free to contribute ! :)\n"

		[[ $action = 2 ]] && { title="RESTORE"; restore=1; } || { title="DEBLOAT"; restore=0; }

		printf "\n${Bold}${ORANGE}====================  $title  ====================\n"
		printf "#                                               ${ORANGE}  #\n"
		printf "#${NC}             1  -  $title a package     ${ORANGE}  %-6s#\n" | awk '{print tolower($0)}'
		declare -p $brand &>/dev/null && printf "#${nBold}${NC}%12s 2  -  ${brand} %$((25-${#brand}))s  ${ORANGE}  #\n"
		printf "#${NC}             3  -  GFAM                        ${ORANGE}  #\n"
		printf "#${NC}             4  -  Carriers                    ${ORANGE}  #\n"
		printf "#${NC}             5  -  Others                      ${ORANGE}  #\n"
		printf "#${NC}             6  -  AOSP                        ${ORANGE}  #\n"
		printf "#${NC}                                               ${ORANGE}  #\n"
		printf "#${NC}             0  -  Pending list /!\\    %4s    ${ORANGE}  #\n"
		printf "#${NC}                                               ${ORANGE}  #\n"
		printf "${Bold}===================================================${NC}${nBold}\n\n"
		read -p "${Bold}Your selection (e.g: 2 3 4 5 6): ${nBold}" action
		echo

		if [[ "$action" =~ 4 ]]; then lists_selection us_carriers french_carriers german_carriers; fi
		if [[ "$action" =~ 3 ]]; then lists_selection google facebook amazon microsoft; fi
		if [[ "$action" =~ 1 ]]; then remove_or_install_one; fi
		if [[ "$action" =~ 2 ]]; then debloat $brand; fi
		if [[ "$action" =~ 5 ]]; then debloat misc; fi
		if [[ "$action" =~ 6 ]]; then debloat aosp; fi
		if [[ "$action" =~ 0 ]]; then debloat pending; fi
	fi

adb shell 'pm list packages -s' | sed -r 's/package://g' | sort > remaining_packages.txt

done