#!/bin/bash

# COLORS - REFINED THEME
R="\e[1;31m"
G="\e[1;32m"
Y="\e[1;33m"
C="\e[1;36m"
W="\e[1;37m"
D="\e[1;90m"
N="\e[0m"

# 7oq1_ CUSTOM BLOCK ART
print_logo() {
    echo -e "${C}"
    echo -e "░▒▓████████▓▒░░▒▓██████▓▒░ ░▒▓██████▓▒░   ░▒▓█▓▒░ "
    echo -e "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓████▓▒░ "
    echo -e "        ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░ "
    echo -e "       ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░ "
    echo -e "       ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░ "
    echo -e "      ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░ "
    echo -e "      ░▒▓█▓▒░  ░▒▓██████▓▒░ ░▒▓██████▓▒░   ░▒▓█▓▒░ "
    echo -e "                             ░▒▓█▓▒░               "
    echo -e "                              ░▒▓██▓▒░             "
    echo -e "${D}           Made by Jishnu | ${C}Modified by 7oq1_${N}\n"
}

print_header() {
    clear
    print_logo
    echo -e "${C}-------------------------------------------------------${N}"
    echo -e "${W}         [ DEVELOPMENT MANAGEMENT CONSOLE ]          ${N}"
    echo -e "${C}-------------------------------------------------------${N}\n"
}

print_option() {
    local num="$1"
    local text="$2"
    local color="$3"
    printf "  ${color}> ${W}[${color}$num${W}]  %-32s ${color}>>${N}\n" "$text"
}

print_status() {
    echo -e "\n${C}-------------------------------------------------------${N}"
    echo -e "  ${G}* STATUS:${N} $1"
    echo -e "${C}-------------------------------------------------------${N}\n"
}

# MAIN MENU LOOP
while true; do
    print_header
    
    print_option "1" "GitHub VPS Maker" "$C"
    print_option "2" "IDX Tool Setup" "$C"
    print_option "3" "IDX VPS Maker" "$C"
    print_option "4" "Exit Console" "$R"

    echo -e "\n${C}  +---------------------------------------------------+${N}"
    echo -ne "${C}  +-- Selection [1-4]: ${Y}"
    read op
    echo -ne "${N}"
    
    case $op in
    1)
        clear
        print_logo
        print_status "Launching GitHub VPS Environment..."
        RAM=15000; CPU=4; DISK_SIZE=100G
        CONTAINER_NAME=hopingboyz; IMAGE_NAME=hopingboyz/debain12
        VMDATA_DIR="$PWD/vmdata"
        mkdir -p "$VMDATA_DIR"
        echo -e "${C}*${W} Config: ${G}$CPU Cores / $RAM MB RAM${N}\n"
        docker run -it --rm --name "$CONTAINER_NAME" --device /dev/kvm -v "$VMDATA_DIR":/vmdata -e RAM="$RAM" -e CPU="$CPU" -e DISK_SIZE="$DISK_SIZE" "$IMAGE_NAME"
        echo -ne "\n${C}*${W} Press Enter to return...${N}"
        read
        ;;
    2)
        clear
        print_logo
        print_status "Initializing IDX Development Setup..."
        cd; rm -rf myapp flutter; mkdir -p vps123/.idx; cd vps123/.idx
        cat <<EOF > dev.nix
{ pkgs, ... }: {
  channel = "stable-24.05";
  packages = with pkgs; [ unzip openssh git qemu_kvm sudo cdrkit cloud-utils qemu ];
  env = { EDITOR = "nano"; };
  idx = {
    extensions = [ "Dart-Code.flutter" "Dart-Code.dart-code" ];
    workspace = { onCreate = { }; onStart = { }; };
    previews = { enable = false; };
  };
}
EOF
        echo -e "${G}* .idx/dev.nix generated successfully.${N}"
        echo -ne "\n${C}*${W} Press Enter to return...${N}"
        read
        ;;
    3)
        clear
        print_logo
        print_status "Fetching Remote IDX Script..."
        bash <(curl -s https://raw.githubusercontent.com/MR-X-DEV/firebase-studio/refs/heads/main/vm.sh)
        echo -ne "\n${C}*${W} Press Enter to return...${N}"
        read
        ;;
    4)
        clear
        print_logo
        echo -e "${C}  +---------------------------------------------------+${N}"
        echo -e "${C}  |${W}       Session closed. System Terminated.        ${C}|${N}"
        echo -e "${C}  +---------------------------------------------------+${N}"
        sleep 1.2
        exit 0
        ;;
    *)
        echo -e "${R}! Invalid selection!${N}"
        sleep 1
        ;;
    esac
done
