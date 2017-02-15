# Aliases
alias em='emacs -nw'
alias la='ls -la'
alias ll='ls -l'
alias grer='grep -r'

# Rails aliases
alias bx='bundle exec'
alias brake='bx rake'

# Use terminal 256color
set TERM xterm-256color

# Use RBenv
set PATH $PATH ~/.rbenv/bin
status --is-interactive and . (rbenv init -|psub)

# Use Haxe
set PATH $PATH /usr/lib/haxe

# Use Erlang
set PATH $PATH /usr/bin/kerl
set PATH $PATH ~/.rebar3

# Don't use Vim meh
alias vi='em'
alias vim='em'
alias vim.tiny='em'

# OPAM configuration
# source /home/bastien/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# Erlang
. /home/$username/erlang/versions/19.2/activate.fish
