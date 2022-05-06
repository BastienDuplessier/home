## GTK Fix
set -gx GDK_CORE_DEVICE_EVENTS 1

## Prompt
starship init fish | source

## ASDF
source /opt/asdf-vm/asdf.fish

## Daily
alias dc="docker-compose"
alias em='emacs -nw'
alias la='ls -la'
alias ll='ls -l'
alias grer='grep -r'
alias tailf='tail -f'

# Don't use Vim meh
alias vi='em'
alias vim='em'
alias vim.tiny='em'
