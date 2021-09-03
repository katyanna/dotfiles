#!/bin/sh

git clone git@github.com:katyanna/dotfiles.git ~/.dotfiles && cd ~/.dotfiles || exit

brew install stow tmux zplug the_silver_searcher gh
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

mkdir ~/.config
for package in $(ls -d */)
do
  stow --verbose=2 "$package"
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

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

source ~/.zshrc
