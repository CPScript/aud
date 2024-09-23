install() {
    echo "Installing..."
    
    if command -v apt-get &>/dev/null; then
        sudo apt-get update
        sudo apt-get install -y nmap hydra
    elif command -v pacman &>/dev/null; then
        sudo pacman -Syu --noconfirm nmap hydra
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y nmap hydra
    else
        echo "Package manager not supported. Please install nmap and hydra manually."
        exit 1
    fi
}

uninstall() {
    echo "Uninstalling..."
    
    if command -v apt-get &>/dev/null; then
        sudo apt-get remove --purge -y nmap hydra
    elif command -v pacman &>/dev/null; then
        sudo pacman -Rns --noconfirm nmap hydra
    elif command -v dnf &>/dev/null; then
        sudo dnf remove -y nmap hydra
    else
        echo "Package manager not supported. Please uninstall nmap and hydra manually."
        exit 1
    fi
}

main() {
    echo "[1] Install required packages"
    echo "[2] Un-install required packages"
    echo "[99] exit"

    read -p "Choose [1/2]: " choice

    case $choice in
                1) install ;;
                2) uninstall ;;
                99) exit 0 ;;
    esac
}


clear
main
