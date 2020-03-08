# zsh config
#

alias sudo="sudo "
alias ls="ls -G"
alias vi="nvim"
alias vim="nvim"
alias ll="ls -al"
alias ln="ln -v"
alias ":q"="exit"
alias mkdir="mkdir -p"

# case insensitive globbing
setopt NO_CASE_GLOB

# don't replace commands (make like bash)
setopt GLOB_COMPLETE

# auto cd
setopt AUTO_CD

# HISTORY
# save history upon exit (presence of this envvar is required)
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
# share history across multiple zsh sessions (avoid overwriting history file)
setopt SHARE_HISTORY
setopt APPEND_HISTORY
# add commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST 
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# maybe fix typos
setopt CORRECT
setopt CORRECT_ALL

# no leak curl/wget
alias wget="wget -U 'smoke'"
alias curl="curl --user-agent 'smoke'"

# editor
export EDITOR="nvim"

# LD_PRELOAD
export LD_PRELOAD=""

# Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [ "$#" -gt 0 ]; then
    git "$@"
  else
    git status
  fi
}

source ~/.git-prompt.sh
setopt PROMPT_SUBST
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
precmd () { __git_ps1 "%n" ":%~$ " "|%s" }
