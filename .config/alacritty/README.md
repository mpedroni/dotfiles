# alacritty

## Installation

Install Rust. See https://www.rust-lang.org/tools/install
```sh
# it will modify .zshrc/.bashrc to include ~/.cargo/bin in the PATH
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Install SO dependecies (Fedora)
```sh
sudo dnf install cmake freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel g++ gzip scdoc
```

Install Alacritty
```sh
git clone git@github.com:alacritty/alacritty.git ~/alacritty

cd ~/alacritty

# check the latest version
git checkout v0.15.1

cargo build --release --no-default-features --features=wayland

# install terminfo
infocmp alacritty

# install desktop entry 
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# install manual page
sudo mkdir -p /usr/local/share/man/man1
sudo mkdir -p /usr/local/share/man/man5
scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null

# zsh autocompletions
# ensure ~/.zsh_functions exists and is referenced by $fpath
cp extra/completions/_alacritty ~/.zsh_functions/_alacritty
```

