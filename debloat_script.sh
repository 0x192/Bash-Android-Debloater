#!/usr/bin/env bash

# BASH 4.4 or newer is needed!
if (( "${BASH_VERSINFO[0]}" < 5 )); then printf "\n%s\n\n" "Please upgrade to a bash version >= 4.4" && exit 1; fi

if ! adb get-state &>/dev/null; then printf "\n%s\n\n" "Your phone is not detected by ADB." && exit 1; fi

set -Eeuo pipefail # Safer bash script

readonly BRED='\033[1;31m' # Bold + Red
readonly BBLUE='\033[0;34m' # Bold + Blue
readonly BGREEN='\033[1;32m'
readonly BORANGE='\033[1;33m'
readonly NC='\033[0m' # No Color
readonly Bold=$(tput bold) 
readonly nBold=$(tput sgr0)

# Trap error
trap 'catch $LINENO' ERR

catch() {
    (( $? == 0 )) && exit 0;
    printf "\n\n${BRED}%s\n" "[EXIT TRAP] Hum... something is wrong. Error on line $1"
    printf "\n%s\n" "If you think this is a bug. Please report it :)"
    printf "%s${NC}\n\n" "==> https://gitlab.com/W1nst0n/universal-android-debloater/-/issues"
}

# Include debloat lists
for file in ./lists/* ; do
  if [ -f "$file" ] ; then . "$file"; fi
done

###############################################  MAIN SCRIPT  ##########################################################

main() {
    readonly SRC_URI="https://gitlab.com/W1nst0n/universal-android-debloater/-/archive/master/universal-android-debloater-master.tar.gz"
    readonly VERSION="v2.8 (January 10th 2021)"
    readonly PAD=$(((48-${#VERSION})/2))

    readonly BRAND="$(get_brand)"
    readonly BRAND_SUPPORTED=$( declare -p "$BRAND" &>/dev/null && echo "1" || echo "0")

    readonly OLDER_THAN_ANDROID_8=$(( $(adb shell getprop ro.build.version.sdk | tr -d '\r') < 26 ))
    readonly OLDER_THAN_ANDROID_5=$(( $(adb shell getprop ro.build.version.sdk | tr -d '\r') < 21 ))

    declare -a CUSTOM_LIST=() # Trimed APK/package list from the debloat lists only containing packages/APK on the device (populated by generate_custom_list())
    declare -a EXTERNAL_LIST=() # APK/package list provided by the user (populated by import_external_list())
    declare -a USERS=() # User list (populated by debloat_or_restore())
    declare -ra LISTS=(us_carriers french_carrier german_carriers "$BRAND" google facebook amazon microsoft \
                      qualcomm mediatek misc aosp pending)

    declare -i FORCE_UNINSTALL=0
    declare -i RESTORE=0
    declare -i ROOT=0

    clear
    printf "\n${BORANGE}%s\n"                       "================================================"
    printf "%s\n"                                   "#                                              #"
    printf "%-8s${NC}%s${BORANGE}%8s\n"             "#"     "UNIVERSAL ANDROID DEBLOAT SCRIPT"     "#"
    printf "%s\n"                                   "#                                              #"
    printf "%-${PAD}s${BRED}%s${BORANGE}%${PAD}s\n" "#"               "${VERSION}"                 "#"
    printf "%s\n"                                   "#                                              #"
    printf "%s${NC}\n\n"                            "================================================"

    printf "${Bold}%s\n\n"                          "Please carefully read the FAQ before using this script!"

    if [[ $(adb get-state) = "recovery" ]]; then uad_recovery_mode || exit; fi

    printf "%s${nBold} "                            "Do you want to do an ADB backup ? [Y/N]"
    read -r
    if [[ $REPLY =~ [Yy]+[Ee]*[Ss]* ]]; then backup; fi

    if (( OLDER_THAN_ANDROID_8 )); then
        clear
        printf "\n${BRED}%s "                       "WARNING : Your android version is too old (< 8.0)."
        printf "%s${NC}\n\n"                        "Uninstalled packages can't be restored."
        printf "%s"                                 "The script will force-disable the apps instead of uninstalling them"
        printf "%s\n\n"                             "so that you can restore them if needed"
        printf "%s "                                "If you still want to force-uninstall the apps, type '1' ('0' otherwise):"

        read -r -n 1 FORCE_UNINSTALL
    fi

    while true; do

        adb shell 'pm list packages -s' | sed 's/package://g' > remaining_packages.txt &

        clear -x
        printf "\n${BORANGE}%s\n"                   "==================  MAIN MENU  =================="
        printf "%s\n"                               "#                                               #"
        printf "%-12s${NC}%s${BORANGE}%16s\n"       "#"          "0  -  Packages search"            "#"
        printf "%-12s${NC}%s${BORANGE}%15s\n"       "#"          "1  -  Restore a backup"           "#"
        printf "%-12s${NC}%s${BORANGE}%15s\n"       "#"          "2  -  Restore packages"           "#"
        printf "%-12s${NC}%s${BORANGE}%15s\n"       "#"          "3  -  Debloat packages"           "#"
        printf "%s\n"                               "#                                               #"
        printf "%-12s${NC}%s${BORANGE}%12s\n"       "#"          "4  -  Restore APKs (Root)"        "#"
        printf "%-12s${NC}%s${BORANGE}%12s\n"       "#"          "5  -  Debloat APKs (Root)"        "#"
        printf "%s\n"                               "#                                               #"
        printf "%-12s${NC}%s${BORANGE}%6s\n"        "#"          "X  -  Exit and reboot the phone"  "#"
        printf "%s\n"                               "#                                               #"
        printf "%s${NC}\n\n"                        "================================================="

        printf "${BRED}%s${NC}\n\n"                 "DON'T FORGET TO REBOOT YOUR PHONE ONCE THE DEBLOAT IS OVER."

        read -r -p "Choose an action : "

        if [[ $REPLY = 0 ]]; then list_installed_packages;

        elif [[ $REPLY = 1 ]]; then restore_backup;

        elif [[ $REPLY = 2 || $REPLY = 3 || $REPLY = 4 || $REPLY = 5 ]]; then
            clear -x

            (( !BRAND_SUPPORTED )) && printf "\n${BRED}%s\n" "No $BRAND debloat list found. Feel free to contribute ! :)"

            case $REPLY in
            2) { title="RESTORE"; RESTORE=1; };;
            3) { title="DEBLOAT"; RESTORE=0; };;
            4) { title="RESTORE"; RESTORE=1; ROOT=1;};;
            5) { title="DEBLOAT"; RESTORE=0; ROOT=1;};;
            esac

            ((!ROOT)) && printf "\n${BORANGE}%s\n"  "===================  $title  ==================="
            (( ROOT )) && printf "\n${BORANGE}%s\n" "================  $title (ROOT)  ==============="
            printf "%s\n"                           "#                                               #"
            printf "%-12s${NC}%s${BORANGE}%14s\n"   "#"          "1  -  $title a package"           "#" | awk '{print tolower($0)}'
            (( BRAND_SUPPORTED )) && printf         "#${NC}%8s   2  -  ${BRAND} %$((25-${#BRAND}))s  ${BORANGE}  #\n"
            printf "%-12s${NC}%s${BORANGE}%27s\n"   "#"          "3  -  GFAM"                       "#"
            printf "%-12s${NC}%s${BORANGE}%23s\n"   "#"          "4  -  Carriers"                   "#"
            printf "%-12s${NC}%s${BORANGE}%25s\n"   "#"          "5  -  Others"                     "#"
            printf "%-12s${NC}%s${BORANGE}%27s\n"   "#"          "6  -  AOSP"                       "#"
            printf "%-12s${NC}%s${BORANGE}%18s\n"   "#"          "7  -  External list"              "#"
            (( ROOT && !RESTORE )) && printf        "#${NC}%7s    8  -  Create a flashable zip${BORANGE}%7s #\n"
            printf "%s\n"                           "#                                               #"
            printf "%-12s${NC}%s${BORANGE}%15s\n"   "#"          "0  -  Pending list /!\\"          "#"
            printf "%s\n"                           "#                                               #"
            printf "%s\n${NC}\n"                    "================================================="

            read -r -p                              "Your selection (e.g: 2 3 4 5): "

            if [[ "$REPLY" =~ 7 ]]; then import_external_list && debloat_or_restore EXTERNAL_LIST; fi
            if [[ "$REPLY" =~ 4 ]]; then lists_selection us_carriers french_carriers german_carriers; fi
            if [[ "$REPLY" =~ 3 ]]; then lists_selection google facebook amazon microsoft; fi
            if [[ "$REPLY" =~ 1 ]]; then debloat_or_restore; fi
            if [[ "$REPLY" =~ 2 ]]; then debloat_or_restore "$BRAND"; fi
            if [[ "$REPLY" =~ 5 ]]; then lists_selection qualcomm mediatek misc; fi
            if [[ "$REPLY" =~ 6 ]]; then debloat_or_restore aosp; fi
            if [[ "$REPLY" =~ 8 ]]; then create_flashable_zip; fi
            if [[ "$REPLY" =~ 0 ]]; then debloat_or_restore pending; fi


        elif [[ "$REPLY" =~ [Xx] ]]; then adb reboot && exit 0;

        fi
    done
}

############################################  END OF MAIN SCRIPT  ######################################################

import_external_list() {
    local path=""
    while true; do
        printf "\n${BRED}%s${NC}"                   "Path to the list: "
        read -r path
        if readarray -t EXTERNAL_LIST < "$path"; then break; fi
    done

    for i in "${EXTERNAL_LIST[@]}"; do
        if [[ ROOT -eq 1 && $i =~ ^/.*\.apk$ ]]; then
            printf "\n${BRED}%s${NC}\n\n"             "Please use a package list, not an APK list"
            exit 1
        elif [[ ROOT -eq 0 && ! $i =~ ^[a-z][a-zA-Z0-9_]*(\.[a-zA-Z0-9_]+)+[0-9a-zA-Z_]$ ]]; then
            printf "\n${BRED}%s${NC}%s${BRED}%s${NC}%s\n\n" "$i" " is not a package (format is" " com.android.bips" ")"
            exit 1
        fi
    done
}

associate_path_with_package() {
    local -n ASSOCIATE="$1"
    declare -a PACKAGES=()
    readarray -t PACKAGES < <(adb shell 'pm list packages -s -u -f' | sed -r 's/package://g' | sort -i)
    
    for i in "${PACKAGES[@]}"; do
        ASSOCIATE["${i##*=}"]="${i%%=*}"
    done    
}

generate_custom_list() {
    local -n list="$1"
    [[ $# -eq 2 ]] && local user_id="$2"
    CUSTOM_LIST=()

    if (( ROOT )); then
        declare -A PACKAGE_AND_PATH=() # PACKAGE_AND_PATH[package]=path/to/apk
        declare -a TEMP=()
        associate_path_with_package PACKAGE_AND_PATH

        readarray -t TEMP < <(comm -12 <(for p in "${list[@]}"; do echo "${p}"; done|sort -i) \
                                       <(for p in "${!PACKAGE_AND_PATH[@]}"; do echo "$p"; done|sort -i))

        for p in "${TEMP[@]}"; do 
            CUSTOM_LIST+=("${PACKAGE_AND_PATH[$p]}")
        done

        [[ RESTORE -eq 1 ]] && readarray -t CUSTOM_LIST < <(comm -12 <(for p in "${CUSTOM_LIST[@]}"; do echo "${p}"; done|sort -i) \
                                                          <(sort -i deleted_apks.txt))
    else
        if (( RESTORE )); then
            readarray -t CUSTOM_LIST < <(comm -12 <(for p in "${list[@]}"; do echo "${p}"; done|sort -i) \
                                                  <(adb shell "pm list packages -s -u $user_id" | sed -r 's/package://g' | sort -i))
        else
            readarray -t CUSTOM_LIST < <(comm -12 <(for p in "${list[@]}"; do echo "${p}"; done|sort -i) \
                                                  <(adb shell "pm list packages -s $user_id" | sed 's/package://g' | sort -i))
        fi
    fi
    return 0
}

debloat_or_restore() {
    local action="" # restore or debloat
    local output=""
    local title=$( echo "$title" | tr '[:upper:]' '[:lower:]')

    # Android 7.1 and older can't reinstall packages
    if (( OLDER_THAN_ANDROID_8 )); then
        (( RESTORE )) && action='pm enable $package' || action='am force-stop $package && pm disable-user $package && pm clear $package'
    fi

    (( RESTORE && FORCE_UNINSTALL == 1 )) && action='cmd package install-existing $package' || action='pm uninstall $user $package'

    # parse user list on the phone
    readarray -t USERS < <(adb shell pm list users | grep -o "{[0-9]*" | grep -o "[0-9]*")

    clear -x
    if [[ $# -gt 0 ]]; then
        local list="$1"

        printf "\n${BORANGE}%s${NC}\n"          "==== $list debloat list ===="

        if (( ROOT )); then
            generate_custom_list "$list"
            if (( RESTORE )); then restore_apks "$list"; else root_debloat "$list"; fi
            return
        fi

        for u in "${USERS[@]}"; do
            local user=$( ((OLDER_THAN_ANDROID_5)) && echo "" || echo "--user $u" )
            generate_custom_list "$list" "$user"

            if [[ ${#CUSTOM_LIST[@]} -eq 0 ]]; then
                printf "${BBLUE}%s${NC}%s" "[user $u]" " Nothing to $title :)" && sleep 1 && continue
            fi

            for package in "${CUSTOM_LIST[@]}"; do
                do_package_action_and_log "$package" "$action" "$u"
            done
        done
        sleep 1

    else
        if (( ROOT )); then
            if (( RESTORE )); then restore_apks; else root_debloat; fi
            return
        fi

        printf "\n${BRED}%s${NC}"               "Package name to $title: "
        read -r package
        for u in "${USERS[@]}"; do
            local user=$( ((OLDER_THAN_ANDROID_5)) && echo "" || echo "--user $u" )
            do_package_action_and_log "$package" "$action" "$u"
        done
        sleep 1
    fi
}

do_package_action_and_log() {
    local package="$1"
    local action="$2"
    local user="$3"
    printf "${BBLUE}%s${BRED}%s${NC}%s"         "[user $user] " "$package --> "
    output="$(eval adb shell "$action")" && echo "$output"

    if [[ ! "$output" =~ Failure|Error ]]; then
        if [[ $RESTORE -eq 0 ]]; then 
            grep -qxF "$package" debloated_packages.txt || echo "$package" >> "debloated_packages.txt"
        else 
            grep -qFv "$package" debloated_packages.txt > temp.tmp || touch temp.tmp; mv temp.tmp debloated_packages.txt
        fi
    fi 
}

backup_apks() {
    printf "\n%s${BRED}%s${NC}%s\n\n"           "Your apks are beeing backed-up in" " apks_backup/" " (in case you mess up)"
    local -n apks="$1"
    mkdir -p apks_backup
    for apk in "${apks[@]}"; do
        adb pull "$apk" apks_backup/
    done
    printf "\n${BRED}%s${NC}\n\n"               "Backup done!"
}

create_flashable_zip() {
    clear -x
    declare -a selection=()

    echo
    for i in "${!LISTS[@]}"; do 
      printf "%-2s%s\n" "$i" " - ${LISTS[$i]}"
    done

    printf "\n${BRED}%s${NC} "                  "Your choice (e.g 1 2 3) :"
    read -r -a selection

    echo "#!/sbin/sh" > root_debloat_script.sh

    declare -i is_empty=1

    for list in "${selection[@]}"; do
        if (( list > ${#LISTS[@]} )) || (( list < 1 )); then continue; fi
        generate_custom_list "${LISTS[$list]}"

        for package in "${CUSTOM_LIST[@]}"; do
            echo "rm -rf $package" >> root_debloat_script.sh
        done
        [[ $is_empty -eq 1 && ${#CUSTOM_LIST[@]} -gt 0 ]] && is_empty=0 
    done

    if [[ $is_empty -eq 1 ]]; then 
        printf "\n${BRED}%s${NC}\n"             "Nothing to debloat!"
        rm root_debloat_script.sh
    else 
        if [[ ! -e META-INF/com/google/android/updater-binary ]]; then
            printf "\n${BBLUE}%s${NC}%s\n"           "META-INF/com/google/android/updater-binary" " is missing!"
        else 
            zip -r flashable_zip_UAD_v2.8.zip META-INF/ root_debloat_script.sh 1>/dev/null
            printf "\n${BRED}%s${NC}%s\n"           "flashable_zip_UAD_v2.8.zip" " has been generated."
        fi
    fi

    sleep 2
}

restore_apks() {
    declare -a path=()

    if [[ $# -eq 1 ]]; then

        [[ ${#CUSTOM_LIST[@]} -eq 0 ]] && echo "Nothing to restore" && sleep 1 && return 0

        printf "\n%s${BBLUE}%s${NC}%s${BBLUE}%s${NC}\n\n" "Deleted apks from " "$list" " will be restored from " "apks_backups/"
        printf "\n${BRED}%s${NC}\n\n"           "Check your phone: Magisk Manager is probably asking you to grand root permissions for ADB"

    else 
        printf "\n%s${BRED}%s${NC}%s"           "Android Path of the APK to restore (the APK will be restored from " "apks_backups/" "): "
        read -r path
        if [[ ! $path =~ ^/.*\.apk$ ]]; then
            printf "\n${BRED}%s${NC}%s${BRED}%s${NC}%s\n" "$path" "doesn't look like a valid APK path"
            sleep 2 && return 0
        fi
        CUSTOM_LIST=("$path")
    fi

    adb shell "su -c 'mount -o rw,remount /system'"
    

    for p in "${CUSTOM_LIST[@]}"; do # $p = path/to/app.apk
        local apk=$(echo "$p" | sed -r 's/.*\///g') # app.apk
        local dir=$(dirname "$p") # path/to
        if adb push "apks_backup/$apk" /sdcard && adb shell "su -c 'mkdir -p \"$dir\"; mv \"/sdcard/$apk\" \"$dir\"; chmod 644 \"$p\"'"; then
            grep -Fqv "$p" deleted_apks.txt > temp.tmp || touch temp.tmp; mv temp.tmp deleted_apks.txt
        fi
    done

    adb shell "su -c 'mount -o ro,remount /system'"
    printf "\n${BRED}%s${NC}%s\n"               "Reboot your phone and Android will reinstall the app(s)"
    printf "\n\e[5m%s\033[0m"                   "Press any key to continue"
    read -n 1 -r -s
}

root_debloat() {
    if [[ $# -eq 1 ]]; then

        [[ ${#CUSTOM_LIST[@]} -eq 0 ]] && echo "Nothing to debloat :)" && sleep 1 && return 0

        backup_apks CUSTOM_LIST
    else 
        printf "\n${BRED}%s${NC}"               "Android Path of the APK to delete: "
        read -r path
        if [[ ! $path =~ ^/.*\.apk$ ]]; then
            printf "\n${BRED}%s${NC}%s${BRED}%s${NC}%s\n" "$path" " doesn't look like a valid APK path"
            sleep 2 && return 0
        fi
        CUSTOM_LIST=("$path")
    fi

    read -r -p                                  "Type YES if you want to physically delete the apks: "
    if [[ $REPLY = "YES" ]]; then
        local commandes="mount -o rw,remount /system;"
        for apk in "${CUSTOM_LIST[@]}"; do
            grep -qxF "$apk" deleted_apks.txt || echo "$apk" >> "deleted_apks.txt"
            commandes+="echo \"rm -rf $apk\"; rm -rf \"$apk\";"
        done
        commandes+="mount -o ro,remount /system"
        printf "\n${BRED}%s${NC}\n\n"           "Check your phone: Magisk Manager is probably asking you to grand root permissions for ADB"
        adb shell "su -c '$commandes'"
        printf "\n${BRED}%s${NC}\n"             "DONE"
        printf "\n%s${BRED}%s${NC}\n"           "A list of deleted apks has been backed-up in " "deleted_apks.txt"
        printf "\n\e[5m%s\033[0m"               "Press any key to continue"
        read -n 1 -r -s
    fi
}

lists_selection() {
    clear -x
    declare -a selection=()

    for ((i=1; i<=$#; i++)); do
        printf "%-2s%s\n" "$i" " - ${!i}"
    done

    printf "\n${BRED}%s${NC} "                    "Your choice (e.g 1 2 3) :"
    read -r -a selection
    for list in "${selection[@]}"; do
        if (( list > $# )) || (( list < 1 )); then continue; fi
        debloat_or_restore "${!list}"
    done
}

list_installed_packages() {
    clear -x

    printf "\n${BRED}%s${NC}"                   "Search for packages (regex accepted): "
    read -r

    echo
    adb shell "pm list packages | grep -i $REPLY" | sed 's/package://g' | sort || true

    printf "\n\e[5m%s\033[0m"                   "Press any key to continue"
    read -n 1 -r -s
}

restore_backup() {
    clear -x

    printf "${BRED}%s${NC}"                     "Enter the path of the backup to restore : "
    read -r
    check_backup_integrity "$REPLY" && adb restore "$REPLY" || printf "\n${BRED}%s${NC}\n" "The backup is corrupted. Abort!"
    echo
    printf "\e[5m%s\033[0m"                     "Press any key to continue"
    read -n 1 -r -s
}

backup() {
    clear -x
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
    if ! dd if="$1" bs=128k skip=24 iflag=skip_bytes 2>/dev/null | zlib-flate -uncompress | tar tf - &>/dev/null; then 
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

uad_recovery_mode() {
    ROOT=1
    while true; do
        clear -x
        printf "\n${BBLUE}%s\n"                 "===========  MAIN MENU (RECOVERY MODE)  ==========="
        printf "%s\n"                           "#                                                 #"
        printf "%-14s${NC}%s${BBLUE}%12s\n"     "#"            "1  -  Restore APKs (Root)"        "#"
        printf "%-14s${NC}%s${BBLUE}%12s\n"     "#"            "2  -  Debloat APKs (Root)"        "#"
        printf "%s\n"                           "#                                                 #"
        printf "%-14s${NC}%s${BBLUE}%6s\n"      "#"            "X  -  Exit and reboot the phone"  "#"
        printf "%s\n"                           "#                                                 #"
        printf "%s${NC}\n\n"                    "==================================================="

        read -r -p                              "Choose an action : "

        case $REPLY in
        1)    { title="RESTORE"; RESTORE=1; };;
        2)    { title="DEBLOAT"; RESTORE=0; };;
        [Xx]) { adb reboot && exit 0; };;
        *) exit 
        esac

        clear -x
        printf "\n${BBLUE}%s\n"                 "=================  $title (ROOT)  ================"
        printf "%s\n"                           "#                                                 #"
        printf "%-14s${NC}%s${BBLUE}%17s\n"     "#"          "1  -  $title an APK"                "#" | awk '{print tolower($0)}'
        printf "%-14s${NC}%s${BBLUE}%18s\n"     "#"          "2  -  External list"                "#"
        ((RESTORE)) && printf                   "#${NC}%9s    3  -  deleted_apks.txt   ${BBLUE}%11s#\n"
        printf "%s\n"                           "#                                                 #"
        printf "%s\n${NC}"                      "==================================================="

        read -r -p "Choose an action : "

        if [[ $REPLY = 1 ]]; then

            printf "\n${BRED}%s${NC}"           "Android path of the APK to $title: "
            read -r path

            if [[ ! $path =~ ^/.*\.apk$ ]]; then
                printf "\n${BRED}%s${NC}%s${BRED}%s${NC}%s\n" "$path" " doesn't look like a valid APK path"
                sleep 3 && return 0
            fi
            CUSTOM_LIST=("$path")
        fi 
        
        if [[ $REPLY = 2 ]]; then import_external_list && CUSTOM_LIST=("${EXTERNAL_LIST[@]}"); fi
        if [[ $REPLY = 3 && $RESTORE -eq 1 ]]; then readarray -t CUSTOM_LIST < "deleted_apks.txt"; fi

        if [[ RESTORE -eq 0 ]]; then
            backup_apks CUSTOM_LIST
            printf "\n%s${BRED}%s${NC}%s\n\n"   "Your apks has been backed-up in" " apks_backup/" " (in case you messed up)"
        fi

        for p in "${CUSTOM_LIST[@]}"; do # $p = path/to/app.apk
            local apk=$(echo "$p" | sed -r 's/.*\///g') # app.apk
            local dir=$(dirname "$p") # path/to

            if [[ $RESTORE -eq 0 ]]; then 
                adb shell "rm -rf $p" && echo "rm -rf $p"
                grep -qxF "$p" deleted_apks.txt || echo "$p" >> "deleted_apks.txt"

            else
                echo "adb push apks_backup/$apk /\"$p\""
                if adb shell "mkdir -p $dir" && adb push "apks_backup/$apk" "/$p"; then
                    grep -qFv "$p" deleted_apks.txt > temp.tmp || touch temp.tmp; mv temp.tmp deleted_apks.txt
                fi
            fi
        done
        sleep 2
    done
}

main "$@"; exit