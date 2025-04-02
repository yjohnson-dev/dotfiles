# ~/.bashrc: executed by bash(1) for non-login shells.

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Filesystem modification commands
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Filesystem visualization commands
if command -v exa > /dev/null 2>&1; then
    alias __ls=exa
    alias ls='__ls --group --color-scale -aF'
    alias ll='__ls --long --header --group --color-scale -aF'
    alias tree1='__ls --tree --level=1 --long --header -aF'
    alias tree2='__ls --tree --level=2 --long --header -aF'
    alias tree3='__ls --tree --level=3 --long --header -aF'
    alias tree='tree2'
elif command -v eza > /dev/null 2>&1; then
    alias __ls=eza
    alias ls='__ls --group --color-scale -aF'
    alias ll='__ls --long --header --group --color-scale -aF'
    alias tree1='__ls --tree --level=1 --long --header -aF'
    alias tree2='__ls --tree --level=2 --long --header -aF'
    alias tree3='__ls --tree --level=3 --long --header -aF'
    alias tree='tree2'
else
    alias __ls=ls
fi

# Miscellaneous command modifiers
alias iplist='ip -br a'

# Readability aliases
alias df='df -h'
alias du='du -ch'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

# pipx
export PATH="$PATH:/root/.local/bin"

# Fixes some VS Code issues
export LANG="C.UTF-8"

get_host_ip()
{
    hostname -I | awk "{print \$1}"
}

# Shell preference
PS1='\n\[\e[2m\][\[\e[0;38;5;72m\]\H\[\e[97;2m\]@\[\e[0m\]$(get_host_ip)\[\e[2m\]]\[\e[0m\] \[\e[93m\]\@\[\e[0m\] \[\e[2m\]|\[\e[0m\] \[\e[92m\]\w\[\e[0m\] \[\e[2m\]|\[\e[0m\] \[\e[91m\]$?\[\e[0m\] $(git branch --show-current 2>/dev/null)\n\$ '
