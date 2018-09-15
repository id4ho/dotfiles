#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias sudo="sudo "
alias ls="ls --color=auto"
alias vi="nvim"
alias vim="nvim"
alias ll="ls -al"
alias ln="ln -v"
alias mkdir="mkdir -p"
alias e="$EDITOR"
alias v="$VISUAL"

# Copy/Paste
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

# Ensure ssh_auth_sock var is set (started by systemd)
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

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

source /usr/share/chruby/chruby.sh
source /usr/share/chruby/auto.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
