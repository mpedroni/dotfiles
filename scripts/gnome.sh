#!/bin/bash
set -euo pipefail

# Key remaps
## Caps Lock: Ctrl
## Shift + Caps Lock: turn on/off caps lock
## `man xkeyboard-config` for more info on the available xkb-options
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_shifted_capslock']"
