# dotfiles
# set $HOME as the working tree for the .dotfiles bare repo. The .dotfiles repo must be previous created
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# disable git search for untracked files
dotfiles config status.showUntrackedFiles no

alias l="ls -lah"

export EDITOR=/usr/bin/nvim

# golang
export PATH=$PATH:/usr/local/go/bin

GOPATH=$(go env GOPATH)
export PATH=$GOPATH/bin:$PATH

# emacs
export PATH=$HOME/.emacs.d/bin:$PATH

# nvim
alias vim="nvim"

# ruby
# export GEM_HOME="$(gem env user_gemhome)"
# export PATH="$PATH:$GEM_HOME/bin"

# rust
. "$HOME/.cargo/env"
