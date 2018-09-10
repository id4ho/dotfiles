#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="ls --color=auto"
if type nvim > /dev/null 2>&1; then
  alias vim="nvim"
fi
alias ll="ls -al"
alias ln="ln -v"
alias mkdir="mkdir -p"
alias e="$EDITOR"
alias v="$VISUAL"

# Start ssh-agent with X
alias startx="ssh-agent startx"

# Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}

source ~/.git-prompt.sh
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
