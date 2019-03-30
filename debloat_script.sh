#!/bin/bash

source debloat_lists.sh

RED='\033[0;31m'
NC='\033[0m' # No Color
bold=$(tput bold) 
normal=$(tput sgr0)

function debloat {
	name=$1[@]
	bloat=("${!name}")

	for i in "${bloat[@]}"; do
		adb shell "
		printf '${RED}$i${NC} --> '
		pm uninstall --user 0 $i
		"
	done
}

function list {
	printf "\n${RED}${bold}Rechercher des paquets : ${normal}${NC}"
	read -r package
	printf "\n"
	adb shell "
	pm list packages | grep $package
	"
}

function remove {
	printf "\n${RED}${bold}Nom du paquet à désinstaller : ${normal}${NC}"
	read -r nom_paquet
	adb shell "
	 pm uninstall --user 0 $nom_paquet
	"
}

function install {
	printf "\n${RED}${bold}Nom du paquet à installer : ${normal}${NC}"
	read -r nom_paquet
	adb shell "
	cmd package install-existing $nom_paquet
	"
}

function restore {
	printf"Réstauration d'une sauvegarde\n"
	adb shell "restore backup.ab"
}

function check_backup {
	set -o pipefail
	for a in *.adb; do
		echo "Vérification de la sauvegarde ($a)";
		dd if="$a" bs=24 skip=1 | zlib-flate -uncompress | tar tf - >/dev/null;
		if [ $? = 0 ]; then 
			printf "${RED}${bold}La sauvegarde généré est intègre${normal}${NC}\n"
		else printf "${RED}${bold}La sauvegarde généré est corrompue ! ${normal}${NC}\n"
		fi
	done
}

clear
printf "\n ================================================\n"
printf " #                                              #\n"
printf " #             SCRIPT ----- DEBLOAT             #\n"
printf " #         ALL DEVICES COMPATIBLE (WIP)         #\n"
printf " #                                              #\n"
printf " #            ${RED}${bold}VERSION DE TEST : V 0.9${normal}${NC}           #\n"
printf " #                                              #\n"
printf " ================================================\n"

sleep 1
echo
adb devices

printf "${RED}${bold}Voulez vous faire une sauvegarde du téléphone ? (recommandé) ${normal}${NC}\n"
read -p "YES / NO : "
if [[ $REPLY =~ [Yy]+[Ee]*[Ss]* ]]; then
	echo 
	adb backup -apk -all -system -f "${PHONE:-phone}-`date +%Y%m%d-%H%M%S`.adb"  # -noshare option is default
	check_backup;
else printf "${RED}${bold}Pas de sauvegarde${normal}${NC}\n"
fi


# marque=$(adb shell getprop | grep manufacturer)


while true; do
	printf "\n${bold}======= MENU PRINCIPAL =======  ${normal}\n"
	printf "\n1  - Lister des paquets\n"
	printf "2  - Désinstaller un paquet\n"
	printf "3  - Réinstaller un paquet\n"
	printf "4  - Debloat Google\n"
	printf "5  - Debloat Samsung\n"
	printf "6  - Debloat T-Mobile\n"
	printf "7  - Debloat Amazon\n"
	printf "8  - Debloat Facebook\n"
	printf "9  - Debloat Microsoft\n"
	printf "10 - Debloat Autres\n"
	printf "11 - Debloat Huawei\n"
	printf "12 - Debloat Android\n"
	printf "13 - Debloat Xiaomi\n"
	printf "exit - Quitter\n\n"
	read -p "${bold}Choisissez une action : ${normal}" action
	echo

	case $action in
		1) list ;;
		2) remove ;;
		3) install ;;
		4) debloat google_bloat ;;
		5) debloat samsung_bloat ;;
		6) debloat T_Mobile_bloat ;;
		7) debloat amazon_bloat ;;
		8) debloat facebook_bloat ;;
		9) debloat microsoft_bloat ;;
		10) debloat misc_bloat ;;
		11) debloat huawei_bloat;;
		12) debloat generic_bloat ;;
		13) debloat xiaomi_bloat ;;
		"exit") break ;;
	esac
done	
