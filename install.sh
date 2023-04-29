#!/bin/sh

git clone git@github.com:katyanna/dotfiles.git ~/.dotfiles && cd ~/.dotfiles || exit

packages=("stow" "tmux" "zplug" "the_silver_searcher" "zsh-autosuggestions" "zsh-syntax-highlighting" "gh" "neovim")
for package in "${packages[@]}"
do
    brew install "$package"
done

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

mkdir ~/.config
for package in $(ls -d */)
do
  stow --verbose=2 "$package"
done

zplug install

git clone git@github.com:powerline/fonts.git ~/fonts
cd ~/fonts && ./install.sh
rm -r ~/fonts

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

source ~/.zshrc
