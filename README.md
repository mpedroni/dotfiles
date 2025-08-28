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
