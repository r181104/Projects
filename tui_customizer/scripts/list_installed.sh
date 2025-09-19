#!/bin/bash
echo "📦 --- Listing all installed packages (press 'q' to quit) ---"
sleep 1
apt list --installed | less
echo "--- Closed package list ---"
read -p "👉 Press Enter to return to the menu..."