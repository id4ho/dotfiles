#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

source ~/.git-prompt.sh
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
