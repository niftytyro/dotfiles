# zsh settings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt histignorespace

# zsh plugins
. ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# nvm
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
. ~/.zsh/zsh-nvm/zsh-nvm.plugin.zsh

export PIP_REQUIRE_VIRTUALENV=true

eval "$(starship init zsh)"

if [ ! -e "/tmp/vscvm_check_update" ]; then
  vscvm_check_update
fi

function ta {
  tmux attach -t "$1"
}

function tn {
  tmux new -s "$1"
}

function tx {
  tmux kill-session -t "$1"
}

function txls {
  tmux ls
}

alias ..="cd .."
alias py=python3

eval "$(keychain --eval --agents ssh)"
