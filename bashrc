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

# no leak curl/wget
alias wget="wget -U 'smoke'"
alias curl="curl --user-agent 'smoke'"

# editor
export EDITOR="nvim"

# LD_PRELOAD
export LD_PRELOAD=""

# Copy/Paste
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

# Ensure ssh_auth_sock var is set (started by systemd)
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export PATH="$HOME/.gem/ruby/2.5.1/bin:$PATH"
export PATH="/opt/rubies/ruby-2.5.1/lib/ruby/gems/2.5.0/bin:$PATH"
export PATH="/opt/rubies/ruby-2.5.1/bin:$PATH"
export PATH="$HOME/.fzf/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

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
