#!/bin/bash

source debloat_lists.sh

RED='\033[0;31m'
NC='\033[0m' # No Color
bold=$(tput bold) 
normal=$(tput sgr0)

function debloat {
	name=$1[@]
	bloat=("${!name}")
	printf "${RED}${bold}=== $brand debloat list ===${normal}${NC}\n"
	for i in "${bloat[@]}"; do
		printf "${RED}$i${NC} -->"
		adb shell "
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
	printf "${RED}${bold}Restaurer une sauvegarde${normal}${NC}\n"
	read -p "Nom ${bold}exact${normal} de la sauvegarde : "
	adb restore $REPLY
}

function check_backup_integrity {
	set -o pipefail
	for a in *.adb; do
		echo "Vérification de la sauvegarde ($a)";
		dd if="$a" bs=24 skip=1 | zlib-flate -uncompress | tar tf - >/dev/null;
		if [ $? = 0 ]; then 
			printf "${RED}${bold}La sauvegarde générée est intègre${normal}${NC}\n"
		else printf "${RED}${bold}La sauvegarde générée est corrompue ! ${normal}${NC}\n"
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
printf " # %13s${RED}${bold}v1.2.1 (21-04-2019)${normal}${NC}%13s#\n"
printf " #                                              #\n"
printf " ================================================\n"
echo

adb devices
printf "${RED}${bold}AVERTISSEMENT : Lisez attentivement la FAQ avant de vous servir de ce script\n\n"
printf "Voulez vous faire une sauvegarde de toutes les applications du téléphone [Yes/No] ? (recommandé)\n\n${normal}${NC}"
printf "RAPPEL : Il est probable que toutes les applications ne soient pas sauvegardées (cf. FAQ).\n\n"
read
if [[ $REPLY =~ [Yy]+[Ee]*[Ss]* ]]; then
	echo 
	adb backup -apk -all -system -f "${PHONE:-phone}-`date +%Y%m%d-%H%M%S`.adb"  # -noshare option is default
	echo "Verification de l'intégrité de la sauvegarde..."
	check_backup_integrity;
else printf "${RED}${bold}Pas de sauvegarde${normal}${NC}\n"
fi
while true; do
	printf "\n${bold}======= MENU PRINCIPAL =======  ${normal}\n\n"
	printf "1    - Lister des paquets\n"
	printf "2    - Désinstaller un paquet\n"
	printf "3    - Réinstaller un paquet\n"
	printf "4    - Auto-Debloat\n"
	printf "5    - Restaurer une sauvegarde\n"
	printf "6    - Debloat Google\n"
	printf "7    - Debloat T-Mobile\n"
	printf "8    - Debloat Amazon\n"
	printf "9    - Debloat Facebook\n"
	printf "10   - Debloat Microsoft\n"
	printf "11   - Debloat Divers\n"
	printf "12   - Debloat Android\n"
	printf "exit - Quitter\n\n"
	printf "${RED}${bold}PENSEZ À REDEMARRER VOTRE TELEPHONE UNE FOIS LE DEBLOAT TERMINE. ${normal}${NC}\n\n"
	read -p "${bold}Choisissez une action : ${normal}" action
	echo

	brand=$(brand_detection)
	case $action in
		1) list ;;
		2) remove ;;
		3) install ;;
		4) debloat $brand ;;
		5) restore ;;
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
