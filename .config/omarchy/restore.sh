#!/bin/bash
# Restore packages and PWA after Omarchy reinstall
# Run this after installing base Omarchy system

set -e

OMARCHY_DIR="$HOME/.config/omarchy"

echo "=== Restoring packages ==="

# Install official repo packages
if [ -f "$OMARCHY_DIR/packages.txt" ]; then
    echo "Installing official packages..."
    sudo pacman -S --needed - < "$OMARCHY_DIR/packages.txt"
fi

# Install AUR packages (requires yay)
if [ -f "$OMARCHY_DIR/packages-aur.txt" ]; then
    echo "Installing AUR packages..."
    yay -S --needed - < "$OMARCHY_DIR/packages-aur.txt"
fi

echo ""
echo "=== PWA to reinstall manually ==="
if [ -f "$OMARCHY_DIR/pwa.txt" ]; then
    echo "Open Chrome/Chromium and install these PWAs:"
    echo ""
    cat "$OMARCHY_DIR/pwa.txt" | while IFS=' | ' read name app_id; do
        echo "  - $name"
        echo "    https://chrome.google.com/webstore/detail/$app_id"
    done
fi

echo ""
echo "=== Done ==="
echo "Note: Gaming packages (gamemode, mangohud, etc.) may require:"
echo "  sudo usermod -aG gamemode \$USER"
