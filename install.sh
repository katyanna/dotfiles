#!/bin/sh

###
echo '\n### Clone dotfiles configurations'
git clone git@github.com:katyanna/dotfiles.git ~/.dotfiles && cd ~/.dotfiles || exit

echo '\n### Install packages'
packages=("stow" "tmux" "zplug" "the_silver_searcher" "zsh-autosuggestions" "zsh-syntax-highlighting" "gh" "neovim" "ripgrep")
for package in "${packages[@]}"
do
    brew install "$package"
done

mkdir ~/.config
for package in $(ls -d */)
do
  stow --verbose=2 --target=$HOME "$package"
done


###
echo '\n### Install fonts'
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font


###
echo '\n### Get private configs'
read -p 'Get from repository: ' repo
git clone git@github.com:katyanna/$repo.git ~/.config-pvt && cd ~/.config-pvt || exit


###
echo '\n### Configure and source zshrc'
zplug install

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! $HOME/.zshrc

source ~/.zshrc
