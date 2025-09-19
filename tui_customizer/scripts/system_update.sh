#!/bin/bash
echo "🚀 --- Starting System Update & Upgrade ---"
sudo apt update && sudo apt upgrade -y
echo ""
echo "✅ --- Update Complete ---"
read -p "👉 Press Enter to return to the menu..."