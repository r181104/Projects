#!/bin/bash
# Uses neofetch for a cool system overview.
if ! command -v neofetch &> /dev/null
then
    echo "🛑 Error: neofetch is not installed."
    echo "Please install it with: sudo apt install neofetch"
    read -p "👉 Press Enter to return to the menu..."
    exit 1
fi
neofetch
read -p "👉 Press Enter to return to the menu..."