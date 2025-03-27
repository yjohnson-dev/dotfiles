# ~/.bashrc: executed by bash(1) for non-login shells.

# Filesystem modification commands
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Filesystem visualization commands
alias ls='exa --group --color-scale -aF'
alias ll='exa --long --header --group --color-scale -aF'
alias tree1='exa --tree --level=1 --long --header -aF'
alias tree2='exa --tree --level=2 --long --header -aF'
alias tree3='exa --tree --level=3 --long --header -aF'
alias tree='tree2'

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