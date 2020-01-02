#!/bin/sh

git clone git@github.com:katyanna/dotfiles.git ~/.dotfiles && cd ~/.dotfiles || exit

mkdir ~/.config
for package in $(ls -d */)
  do
    echo "Instaling package: $package"
    $(stow $package)
  done

if [ -s ~/.vim/autoload/plug.vim ]; then
  echo "VimPlug already installed for Vim"
else
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim +PlugInstall +qall

git clone git@github.com:powerline/fonts.git ~/fonts
cd ~/fonts && ./install.sh
rm -r ~/fonts

source ~/.zshrc
