#!/bin/sh

###################################################
echo '\n### Clone dotfiles configurations'
###################################################
git clone git@github.com:katyanna/dotfiles.git ~/.dotfiles && cd ~/.dotfiles || exit

###################################################
echo '\n### Install packages'
###################################################
packages=("stow" "tmux" "fish" "fzf" "starship" "gh" "neovim" "ripgrep" "tree")
for package in "${packages[@]}"
do
    brew install "$package"
done

mkdir ~/.config
for package in $(ls -d */)
do
  stow --verbose=2 --target=$HOME "$package"
done

###################################################
echo '\#### Clone tmux plugins'
###################################################
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
plugins=("tmux-net-speed" "tmux-cpu" "tmux-battery")
for plugin in "${plugins[@]}"
do
    git clone https://github.com/tmux-plugins/$plugin ~/.dotfiles/tmux/.config/tmux/plugins/$plugin
done
tmux source ~/.tmux.conf

###################################################
echo '\n### Install fonts'
###################################################
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

###################################################
echo '\n### Get private configs'
###################################################
read -p 'Get from repository: ' repo
git clone git@github.com:katyanna/$repo.git ~/.config-pvt && cd ~/.config-pvt || exit
