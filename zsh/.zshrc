# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export GPG_TTY=$(tty)
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export TTC_SAY_BOX=parrot

source ~/.zsh/base16-ocean-dark.zsh
source ~/.scripts/git-prompt.sh
source ~/.scripts/z.sh
source ~/.zsh/history.zsh
#source ~/.zsh/pure.zsh

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)

export WORKON_HOME=~/.ve
export PROJECT_HOME=~/workspace


### NeoVim
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


### Python
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
#pyenv virtualenvwrapper_lazy
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
alias manage="python $VIRTUAL_ENV/../manage.py"


### Golang
export GOPATH=$HOME/workspace/go
export PATH=$PATH:$GOPATH/bin


### Postgres
export PATH="/usr/local/bin/:$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"


### kubectl
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)


### Aliases
alias k=kubectl
alias zk=zkubectl
alias zkc="zkubectl config current-context"
alias zga="kubectl get po,svc,deploy,stackset,stack,replicaset,hpa,vpa,configmap,secret,pcs,routegroup,ingress,serviceaccount,clusterrole,role"
alias n=nvim
alias nz="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
alias tree="tree -a -I '__pycache__|.git'"

gocover () {
    t="/tmp/go-cover.$$.tmp"
    go test -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# zplug "zsh-users/zsh-history-substring-search"
# zplug "zsh-users/zsh-syntax-highlighting"
# zplug "zsh-users/zsh-autosuggestions"
# zplug load
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
