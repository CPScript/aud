#!/bin/bash

install_linux() {
    echo "Installing on Linux..."
    sudo apt-get update
    sudo apt-get install -y nmap hydra
}

install_darwin() {
    echo "Installing on Darwin (macOS)..."
    brew install nmap hydra  # Assumes Homebrew is installed
}

install_android() {
    echo "Since your on android you will only able to use basic scripts... loading in 5 seconds"
    sleep 6
    echo "Installing on Android (Termux)..."
    pkg install -y nmap hydra
}

uninstall_linux() {
    echo "Uninstalling from Linux..."
    sudo apt-get remove --purge -y nmap hydra
}

uninstall_darwin() {
    echo "Uninstalling from Darwin (macOS)..."
    brew uninstall nmap hydra  # Assumes Homebrew is installed
}

uninstall_android() {
    echo "Uninstalling from Android (Termux)..."
    pkg uninstall -y nmap hydra
}

back() {
    clear
    main
}

main() {
    echo "Choose your platform:"
    echo "[1] Linux"
    echo "[2] Darwin (macOS)"
    echo "[3] Android (Termux)"
    echo "[99] Exit"

    read -p "Select platform [1/2/3]: " platform_choice

    case $platform_choice in
        1)
            clear
            echo "[1] Install required packages"
            echo "[2] Uninstall required packages"
            echo "[3] back"
            read -p "Choose [1/2]: " choice
            case $choice in
                1) install_linux ;;
                2) uninstall_linux ;;
                3) back ;;
                *) echo "Invalid choice." ;;
            esac
            ;;
        2)
            clear
            echo "[1] Install required packages"
            echo "[2] Uninstall required packages"
            echo "[3] back"
            read -p "Choose [1/2]: " choice
            case $choice in
                1) install_darwin ;;
                2) uninstall_darwin ;;
                3) back ;;
                *) echo "Invalid choice." ;;
            esac
            ;;
        3)
            clear
            echo "[1] Install required packages"
            echo "[2] Uninstall required packages"
            echo "[3] back"
            read -p "Choose [1/2]: " choice
            case $choice in
                1) install_android ;;
                2) uninstall_android ;;
                3) back ;;
                *) echo "Invalid choice." ;;
            esac
            ;;
        99)
            exit 0
            ;;
        *)
            echo "Invalid platform choice."
            ;;
    esac
}

clear
main
