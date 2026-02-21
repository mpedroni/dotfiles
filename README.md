# dotfiles

## Setup

```sh
git clone git@github.com:mpedroni/dotfiles.git ~/dotfiles

# alias `dotfiles` must already be created. Check .profile
dotfiles checkout
```

## Key remaps

Caps Lock: Ctrl
Shift + Caps Lock: turn on/off caps lock

```sh
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_shifted_capslock']"

## for more info on the available xkb-options
man xkeyboard-config
```

## Config

*Disable the "Install pending software updates" when shuting down or restarting*

```sh
# packagekit provides backend for GUI software updates (GNOME Software, Discover)
sudo systemctl stop packagekit.service
sudo systemctl disable packagekit.service
sudo systemctl mask packagekit.service

# packagekit-offline-update applies pending updates at boot (used by GNOME Software)
sudo systemctl stop packagekit-offline-update.service
sudo systemctl disable packagekit-offline-update.service
sudo systemctl mask packagekit-offline-update.service
```
