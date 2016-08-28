# Aliases
alias emacs='emacs -nw'
alias em='emacs -nw'
alias la='ls -la'
alias ll='ls -l'
alias grer='grep -r'

# Rails aliases
alias be='bundle exec'
alias brake='be rake'
alias r='rails'
alias rc='r c'
alias rs='r s'

# Use terminal 256color
set TERM xterm-256color

# Use RBenv
set PATH $PATH ~/.rbenv/bin
. (rbenv init -|psub)

# Use Haxe
set PATH $PATH /usr/lib/haxe

# Use Erlang
set PATH $PATH /usr/bin/kerl
set PATH $PATH ~/.rebar3

# Don't use Vim
alias vi='em'
alias vim='em'
alias vim.tiny='em'

status --is-interactive and . (rbenv init -|psub)

# OPAM configuration
# source /home/bastien/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
