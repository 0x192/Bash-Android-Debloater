#!/bin/bash

source debloat_lists.sh

# Colors used for printing
RED='\033[0;31m'
BLUE='\033[0;34m'
BBLUE='\033[1;34m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
Bold=$(tput B) 
nBold=$(tput sgr0)


function debloat {
	name=$1[@]
	#bloat=("${!name}")
	printf "${RED}${Bold}=== $brand debloat list ===${nBold}\n"
	for i in "${name[@]}"; do
		printf "${RED}$i${nBold} -->"
		adb shell "pm uninstall --user 0 $i ${NC}"
	done
}

function list {
	read -r -p "\n${RED}${Bold}Search for packages : ${nBold}${NC} "	
	printf "\n"
	adb shell "pm list packages | grep $REPLY"
}

function remove {
	read -r -p "\n${RED}${Bold}package name to remove : ${nBold}${NC} "
	adb shell "pm uninstall --user 0 $REPLY"
}

function install {
	read -r -p "\n${RED}${Bold}package name to reinstall : ${nBold}${NC} "
	adb shell "cmd package install-existing $REPLY"
}

function restore {
	printf "${RED}${Bold}Restore a backup\n ${nBold}${NC}"
	read -p -r "Nom ${Bold}exact ${nBold} de la sauvegarde : "
	adb restore $REPLY
}

function check_backup_integrity {
	set -o pipefail
	for a in *.adb; do
		echo "Vérification de la sauvegarde ($a)";
		dd if="$a" bs=24 skip=1 | zlib-flate -uncompress | tar tf - >/dev/null;
		if [ $? = 0 ]; then 
			printf "${RED}${Bold}La sauvegarde générée est intègre${nBold}\n"
		else printf "${GREEN}${Bold}La sauvegarde générée est corrompue ! ${nBold}\n"
		fi
	done
}


function brand_detection {
	## brand = $(adb shell getprop ro.product.device) // peut-être plus judicieux d'utiliser ça
	for brand in ${brands[@]}; do
		check=$(adb shell getprop | grep -c $brand)
		if [[ $check>0 ]]; then 
			case $brand in
				"Asus")  
					echo "asus_bloat"
					return ;;
				"Huawei") 
					echo "huawei_bloat"
					return ;;
				"LG") 
					echo "lg_bloat"
					return ;;
				"Nokia") 
					echo "nokia_bloat"
					return ;;
				"Samsung") 
					echo "samsung_bloat"
					return ;; 
				"Sony") 	
					echo "sony_bloat"
					return ;;
				"Xiaomi") 	
					echo "xiaomi_bloat"
					return ;;
			esac
		fi
	done
	echo "Marque non supportée"
}

clear
printf "\n ================================================\n"
printf " #                                              #\n"
printf " #             SCRIPT ----- DEBLOAT             #\n"
printf " #         ALL DEVICES COMPATIBLE (WIP)         #\n"
printf " #                                              #\n"
printf " # %10s${RED}${Bold}v1.3 (23 September 2019)${nBold}%11s#\n"
printf " #                                              #\n"
printf " ================================================\n"
echo

adb devices
printf "${RED}${Bold}AVERTISSEMENT : Lisez attentivement la FAQ avant de vous servir de ce script\n\n"
printf "Voulez vous faire une sauvegarde de toutes les applications du téléphone [Yes/No] ?\n\n${nBold}"
printf "RAPPEL : Il est probable que toutes les applications ne soient pas sauvegardées (cf. FAQ).\n\n"
read
if [[ $REPLY =~ [Yy]+[Ee]*[Ss]* ]]; then
	echo 
	adb backup -apk -all -system -f "${PHONE:-phone}-`date +%Y%m%d-%H%M%S`.adb"  # -noshare option is default
	echo "Verification de l'intégrité de la sauvegarde..."
	check_backup_integrity;
else printf "${RED}${Bold}Pas de sauvegarde${nBold}\n"
fi

brand=$(brand_detection)

while true; do
	printf "\n${Bold}${ORANGE}======= MENU PRINCIPAL ======= ${NC}${nBold}\n\n"
	printf " 1   - Lister des paquets\n"
	printf " 2   - Désinstaller un paquet\n"
	printf " 3   - Réinstaller un paquet\n"
	printf " 4   - Restaurer une sauvegarde\n"
	printf "\n${Bold}${BBLUE}------- DEBLOAT -------${NC}${nBold}\n"
	printf " 5   - ${brand}\n"
	printf " 6   - Google\n"
	printf " 7   - T-Mobile\n"
	printf " 8   - Amazon\n"
	printf " 9   - Facebook\n"
	printf " 10  - Microsoft\n"
	printf " 11  - Divers\n"
	printf " 12  - Générique\n"
	printf "\n exit - Quitter\n\n"
	printf "${Bold}${ORANGE}==============================${NC}${nBold}\n\n"

	printf "${RED}${Bold}PENSEZ À REDEMARRER VOTRE TELEPHONE UNE FOIS LE DEBLOAT TERMINE. ${nBold}${NC}\n\n"
	read -p "${Bold}Choisissez une action : ${nBold}" action
	echo

	case $action in
		1) list ;;
		2) remove ;;
		3) install ;;
		4) restore ;;
		5) debloat $brand ;;
		6) debloat google_bloat ;;
		7) debloat T_Mobile_bloat ;;
		8) debloat amazon_bloat ;;
		9) debloat facebook_bloat ;;
		10) debloat microsoft_bloat ;;
		11) debloat misc_bloat ;;
		12) debloat generic_bloat ;;
		"exit") break ;;
	esac
done
