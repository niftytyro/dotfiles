if status is-interactive
    # Commands to run in interactive sessions can go here
end


starship init fish | source
nvm use v18 > /dev/null

set -x PATH $HOME/flutter/bin $HOME/.pub-cache/bin $PATH

alias z="cd (fd -t d . '~/dev/' | fzf -e)"
alias txls="tmux ls"
alias nv=nvim
alias n="nvim ."

function ta 
  tmux attach -t $argv
end

function tn
  tmux new -s $argv
end

function tx
  tmux kill-session -t $argv
end


# pnpm
set -gx PNPM_HOME "/home/niftytyro/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end