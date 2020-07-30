#!/usr/bin/env bash

# BASH 4.3 or newer is needed ! (use of local -n)
(( BASH_VERSINFO < 5 )) && echo "Please upgrade to a bash version >= 4.3"

set -euo pipefail # Safer bash script

# Colors used for printing
readonly BRED='\033[1;31m' # Bold + Red
readonly BBLUE='\033[0;34m' # Bold + Blue
readonly BGREEN='\033[1;32m'
readonly BORANGE='\033[1;33m'
readonly NC='\033[0m' # No Color
readonly Bold=$(tput bold) 
readonly nBold=$(tput sgr0)

# Trap error
trap 'catch' EXIT

catch() {
  printf "\n\n${BRED}%s\n" "[EXIT ERROR TRAP] Hum... something is wrong."
  printf "\n%s\n" "Unless you interrupted yourself the script bravo, you found a bug. Please report it :"
  printf "%s${NC}\n\n" "https://gitlab.com/W1nst0n/universal-android-debloater/-/issues :)"
}

# Include debloat lists
for file in ./lists/* ; do
  if [ -f "$file" ] ; then . "$file"; fi
done

###############################################  MAIN SCRIPT  ##########################################################

main() {

    readonly VERSION="v2.4.2 (July 30th 2020)"
    readonly PAD=$(((48-${#VERSION})/2))

    readonly BRAND="$(get_brand)"
    readonly BRAND_SUPPORTED=$( declare -p "$BRAND" &>/dev/null && echo "1" || echo "0")

    # Legacy support
    readonly OLDER_THAN_ANDROID_7_1=$(( $(adb shell getprop ro.build.version.sdk | tr -d '\r') < 26 ))   # < Android 7.1
    readonly OLDER_THAN_ANDROID_5=$(( $(adb shell getprop ro.build.version.sdk | tr -d '\r') < 21 ))   # < Android 5.0
    readonly OPTION_NEEDED=$( ((OLDER_THAN_ANDROID_5)) && echo "" || echo "--user 0" ) # '--user 0' option doesn't work sometimes

    FORCE_UNINSTALL=0
    RESTORE=0

    clear
    echo                                            " ================================================"
    echo                                            " #                                              #"
    echo                                            " #       UNIVERSAL ANDROID DEBLOAT SCRIPT       #"
    echo                                            " #                                              #"
    printf " %-${PAD}s${BRED}%s${NC}%${PAD}s\n"      "#"               "${VERSION}"                 "#"
    echo                                            " #                                              #"
    echo                                            " ================================================"
    echo
    adb devices
    printf "${Bold}%s\n\n"                          "Please carefully read the FAQ before using this script!"
    printf "%s${nBold} "                            "Do you want to do an ADB backup ? [Y/N]"
    
    read -r
    if [[ $REPLY =~ [Yy]+[Ee]*[Ss]* ]]; then backup; fi

    if (( OLDER_THAN_ANDROID_7_1 )); then
        clear
        printf "\n${BRED}%s "                       "WARNING : Your android version is too old (< 8.0)."
        printf "%s${NC}\n\n"                        "Uninstalled packages can't be restored."
        printf "%s"                                 "The script will force-disable the apps instead of uninstalling them"
        printf "%s\n\n"                             "so that you can restore them if needed"
        printf "%s "                                "If you still want to force-uninstall the apps, type '1' ('0' otherwise):"

        read -r -n 1 FORCE_UNINSTALL
    fi

    while true; do
        clear
        
        printf "\n${BORANGE}%s\n"                   "===================  MAIN MENU  ==================="
        printf "%s\n"                               "#                                                 #"
        printf "%-14s${NC}%s${BORANGE}%18s\n"       "#"            "0  -  List packages"              "#"
        printf "%-14s${NC}%s${BORANGE}%15s\n"       "#"            "1  -  Restore a backup"           "#"
        printf "%-14s${NC}%s${BORANGE}%15s\n"       "#"            "2  -  Restore packages"           "#"
        printf "%-14s${NC}%s${BORANGE}%15s\n"       "#"            "3  -  Debloat packages"           "#"
        printf "%s\n"                               "#                                                 #"
        printf "%s${NC}\n\n"                        "==================================================="

        printf "${BRED}%s${NC}\n\n"                 "DON'T FORGET TO REBOOT YOUR PHONE ONCE THE DEBLOAT IS OVER."   
        read -r -p "Choose an action : "

        if [[ $REPLY = 0 ]]; then list_installed_packages; fi

        if [[ $REPLY = 1 ]]; then restore_backup; fi

        if [[ $REPLY = 2 || $REPLY = 3 ]]; then
            clear

            (( !BRAND_SUPPORTED )) && printf "\n${BRED}%s\n" "No $BRAND debloat list found. Feel free to contribute ! :)"

            [[ $REPLY = 2 ]] && { title="RESTORE"; RESTORE=1; } || { title="DEBLOAT"; RESTORE=0; }

            printf "\n${BORANGE}%s\n"               "====================  $title  ===================="
            printf "%s\n"                           "#                                                 #"
            printf "%-14s${NC}%s${BORANGE}%14s\n"   "#"          "1  -  $title a package"             "#" | awk '{print tolower($0)}'
            (( BRAND_SUPPORTED )) && printf         "#${NC}%12s 2  -  ${BRAND} %$((25-${#BRAND}))s  ${BORANGE}  #\n"
            printf "%-14s${NC}%s${BORANGE}%27s\n"   "#"          "3  -  GFAM"                         "#"
            printf "%-14s${NC}%s${BORANGE}%23s\n"   "#"          "4  -  Carriers"                     "#"
            printf "%-14s${NC}%s${BORANGE}%25s\n"   "#"          "5  -  Others"                       "#"
            printf "%-14s${NC}%s${BORANGE}%27s\n"   "#"          "6  -  AOSP"                         "#"
            printf "%s\n"                           "#                                                 #"
            printf "%-14s${NC}%s${BORANGE}%15s\n"   "#"          "0  -  Pending list /!\\"            "#"
            printf "%s\n"                           "#                                                 #"
            printf "%s\n${NC}"                      "==================================================="

            read -r -p "Your selection (e.g: 2 3 4 5): "
            echo

            if [[ "$REPLY" =~ 4 ]]; then lists_selection us_carriers french_carriers german_carriers; fi
            if [[ "$REPLY" =~ 3 ]]; then lists_selection google facebook amazon microsoft; fi
            if [[ "$REPLY" =~ 1 ]]; then debloat_or_restore; fi
            if [[ "$REPLY" =~ 2 ]]; then debloat_or_restore "$BRAND"; fi
            if [[ "$REPLY" =~ 5 ]]; then debloat_or_restore misc; fi
            if [[ "$REPLY" =~ 6 ]]; then debloat_or_restore aosp; fi
            if [[ "$REPLY" =~ 0 ]]; then debloat_or_restore pending; fi
        fi

    adb shell 'pm list packages -s' | sed -r 's/package://g' | sort > remaining_packages.txt &

    done
}

############################################  END OF MAIN SCRIPT  ######################################################


debloat_or_restore() {
    local action="" # restore or debloat
    local output=""

    (( RESTORE )) && action="cmd package install-existing \$package" || action="pm uninstall $OPTION_NEEDED \$package"

    # Android 7.1 and older can't reinstall packages
    if (( OLDER_THAN_ANDROID_7_1 )) && (( !FORCE_UNINSTALL )); then
        (( RESTORE )) && action="pm enable \$package" || action="am force-stop \$package \&\& pm disable-user \$package \&\& pm clear \$package"
    fi

    clear

    if [[ $# -gt 0 ]]; then

        # list is a nameref. Array is passed by reference.
        [[ -v "$1" ]] && local -n list=$1

        printf "\n${BORANGE}%s${NC}\n"             "==== $1 debloat list ===="
        for package in "${list[@]}"; do
            printf "${BRED}%s${NC} "            "$package -->"
            output=$(eval adb shell "$action") && echo "$output"
            if ! [[ "$output" =~ "Failure" ]] && [[ $RESTORE -eq 0 ]]; then echo "$package" >> "debloated_packages.txt"; fi
        done

    else
        printf "\n${BRED}%s${NC}"               "Package name to $title : " | tr '[:upper:]' '[:lower:]'
        read -r package
        printf "${BRED}%s${NC}"                 "$package --> "
        output="$(eval adb shell "$action")" || true
        echo "$output"
        if ! [[ "$output" =~ Failure|Error ]] && (( !RESTORE )); then echo "$package" >> "debloated_packages.txt"; fi
        sleep 2

    fi
}

lists_selection() {
    clear

    for ((i=1; i<=$#; i++)); do
        echo "$i - ${!i}"
    done

    printf "${BRED}%s${NC} "                    "Your choice (e.g 1 2 3) :"
    read -r -a selection
    for list in "${selection[@]}"; do
        if (( list > $# )) || (( list < 1 )); then continue; fi
        debloat_or_restore "${!list}"
    done
}

list_installed_packages() {
    clear

    printf "\n${BRED}%s${NC}"                   "Search for packages (regex accepted): "
    read -r

    echo
    adb shell "pm list packages | grep -i $REPLY" | sed -r 's/package://g' | sort

    printf "\n\e[5m%s\033[0m"                   "Press any key to continue"
    read -n 1 -r -s
}

restore_backup() {
    clear

    printf "${BRED}%s${NC}"                     "Enter the path of the backup to restore : "
    read -r
    check_backup_integrity "$REPLY" && adb restore "$REPLY" || printf "\n${BRED}%s${NC}\n" "The backup is corrupted. Abort!"
    echo
    printf "\e[5m%s\033[0m"                     "Press any key to continue"
    read -n 1 -r -s
}

backup() {
    clear
    local backup=$(date +%Y-%m-%d-%H:%M:%S)

    adb backup -apk -all -system -f "${PHONE:-phone}-${backup}.adb"  # -noshare option is default
    echo
    printf "\n\e[5m%s\033[0m"                   "Press a key when the backup is done (your phone will tell you) "
    read -n 1 -r -s
    check_backup_integrity "${PHONE:-phone}-${backup}.adb";
} 

check_backup_integrity() {
    printf "\n\n${BBLUE}%s${NC}"                "[($1)] Backup integrity checking : "
    
    ! [[ -f $1 ]] && printf "${BRED}%s${NC}\n\n" "Backup not found" && return 1

    # first 24 bytes are skipped (adb backup are modified compressed tar files with a 24B custom header)
    if ! dd if="$1" bs=1M skip=24 iflag=skip_bytes &>/dev/null | zlib-flate -uncompress | tar tf - &>/dev/null; then 
        printf "${BRED}%s${NC}\n\n" "FAILED" && return 1
    
    else printf "${BGREEN}%s${NC}\n\n" "OK"
    fi
}

get_brand() {
    local brand
    brand=$(adb shell getprop ro.product.brand | tr -d '\r' | awk '{print tolower($0)}')

    # Support for alternative name
    case "$brand" in
    "redmi") echo "xiaomi" ;;
    *) echo "$brand"
    esac
}

main "$@"; exit