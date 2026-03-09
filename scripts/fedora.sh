#!/bin/bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo 'This script must be run with sudo.'
  exit 1
fi

## disable the "Install pending software updates" when shutting down

# packagekit provides backend for GUI software updates (GNOME Software, Discover)
sudo systemctl stop packagekit.service
sudo systemctl disable packagekit.service
sudo systemctl mask packagekit.service

# packagekit-offline-update applies pending updates at boot (used by GNOME Software)
sudo systemctl stop packagekit-offline-update.service
sudo systemctl disable packagekit-offline-update.service
sudo systemctl mask packagekit-offline-update.service

