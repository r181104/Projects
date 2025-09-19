#!/bin/bash
echo "🧹 --- Cleaning apt package cache ---"
sudo apt clean
echo ""
echo "✅ --- Cache Cleaned Successfully ---"
read -p "👉 Press Enter to return to the menu..."