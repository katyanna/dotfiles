# export GPG_TTY=$(tty)
# export LANG=en_US.UTF-8
# export LC_CTYPE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
#
# export TTC_SAY_BOX=parrot
#
# export ZPLUG_HOME=/opt/homebrew/opt/zplug
# source $ZPLUG_HOME/init.zsh
#
# export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
# eval $(thefuck --alias)
#
# export WORKON_HOME=~/.ve
# export PROJECT_HOME=~/workspace
#
# ### NeoVim
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#
# ### Python
# alias manage="python $VIRTUAL_ENV/../manage.py"
#
# ### Golang
# export GOPATH=$HOME/workspace/go
# export PATH=$PATH:$GOPATH/bin
# export GOPRIVATE="github.bus.zalan.do,github.com/zalando-*,github-zse/zalando-*"
#
# ### Postgres
# export PATH="/usr/local/bin/:$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
#
# ### kubectl
# [[ $commands[kubectl] ]] && source <(kubectl completion zsh)
#
# gocover () {
#     t="/tmp/go-cover.$$.tmp"
#     go test -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
# }
