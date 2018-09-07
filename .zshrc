# Path to your oh-my-zsh installation.
export ZSH=/Users/natalysheinin/.oh-my-zsh

ZSH_THEME="kubernetes-context"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# k8s
alias k="kubectl"

# git
alias gs="git status"
alias gas="git add . && git status"
alias gp="git push"
alias gc="git commit"

# OTHER ALIASES
alias decode="openssl enc -base64 -d <<<" 

# k8s path
#export KPATH=/opt/k8s-workflow-utils-master
#export PATH=$PATH:$KPATH

# go path
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin 
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

export PATH=$PATH:/usr/local/Cellar/openvpn/2.4.4/sbin
export GPG_TTY=$(tty)

# powerline-shell
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
