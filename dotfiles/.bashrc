#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Wrapper for yazi to allow changing directories
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# Defines commands or something
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias bebefetch='neofetch'

#Change display name in terminal
# PS1='[\u@\h \W]\$ '
# bluemint="\e[38;5;43m"
PS1='\W \[\e[38;5;43m\] \[\e[0m\]'

# Set some env variables
export EDITOR=nvim
export PATH=$PATH:/var/lib/flatpak/exports/bin
# export PATH=$PATH:/var/lib/flatpak/exports/share/applications
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share/applications

# Runs neofetch at terminal start
neofetch
