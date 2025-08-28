###############################################################################
###                              GENERAL                                    ###
###############################################################################
eval (/opt/homebrew/bin/brew shellenv)
if status --is-interactive
and not set -q TMUX # https://github.com/fish-shell/fish-shell/issues/4434#issuecomment-332626369
    tmux new-session -A -s km
end

starship init fish | source

set -gx LANG en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
# set -gx HOMEBREW_BUNDLE_FILE $HOME/.config/brew/Brewfile

set -gx GPG_TTY (tty)
set -gx EDITOR "nvim"
set -gx KUBE_EDITOR $EDITOR
set -gx GOPATH $HOME/Workspace/go

fish_add_path $GOPATH/bin
fish_add_path /opt/local/bin

set fish_theme nord
set -gx FZF_DEFAULT_OPTS "
     --height 40%
     --style full
     --preview 'fzf-preview.sh {}'
     --layout=reverse
     --inline-info
     --color=fg:#e5e9f0,hl:#81a1c1
     --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
     --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
     --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b"

fzf --fish | source

###############################################################################
###                              ALIASES                                    ###
###############################################################################
alias nf="nvim ~/.config/fish/config.fish"
alias sf="source ~/.config/fish/config.fish"
alias tree="tree -a -I '__pycache__|.git'"

abbr n nvim
abbr k kubectl

###############################################################################
###                              ERGONOMICS                                 ###
###############################################################################
function save_history --on-event fish_preexec
    history --save
    history --merge
end

function system_update
  fisher update
  brew bundle --cleanup -v
  nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
  . ~/.config/fish/config.fish
end
