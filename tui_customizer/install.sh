#!/bin/bash

# --- Configuration ---
# The URL of your public GitHub repository.
# IMPORTANT: YOU MUST REPLACE THE URL BELOW WITH YOUR OWN GITHUB REPO URL.
REPO_URL="https://github.com/YOUR_USERNAME/tui-customizer.git"

# --- Script Body ---
set -e # Exit immediately if a command exits with a non-zero status.

# Function to check for a command's existence
check_dep() {
  if ! command -v "$1" &> /dev/null; then
    echo "Error: Required command '$1' is not installed. Please install it and try again." >&2
    exit 1
  fi
}

main() {
  echo "--- Preparing Linux TUI Customizer ---"

  # 1. Check for dependencies
  check_dep "git"
  check_dep "python3"
  check_dep "pip"

  # 2. Create a temporary directory for the project
  local TEMP_DIR
  TEMP_DIR=$(mktemp -d)
  
  # 3. Set up a trap to clean up the temporary directory on exit
  trap 'rm -rf "$TEMP_DIR"' EXIT

  # 4. Clone the repository
  echo "Cloning repository..."
  git clone --depth 1 "$REPO_URL" "$TEMP_DIR" > /dev/null

  # 5. Install Python dependencies
  echo "Installing Python dependencies..."
  pip install -r "$TEMP_DIR/requirements.txt" > /dev/null

  # 6. Run the application
  echo "Starting the application..."
  echo ""
  python3 "$TEMP_DIR/tui_customizer.py"

  echo ""
  echo "--- TUI exited. Cleaning up. ---"
}

# Run the main function
main