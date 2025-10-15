if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/usr/local/bin" ] ; then
    PATH="/usr/local/bin:$PATH"
fi
export PATH

if [ -n "$ZSH_NAME" ]; then
    CURRENT_SHELL="zsh"
elif [ -n "$BASH_VERSION" ]; then
    CURRENT_SHELL="bash"
else
    CURRENT_SHELL=$(ps -p $$ -o comm=)
fi

LANG="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

if [ -n "$BASH_VERSION" ]; then
  export HISTCONTROL=ignoreboth:erasedups
  shopt -s histappend cmdhist checkwinsize
elif [ -n "$ZSH_NAME" ]; then
  setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_ALL_DUPS EXTENDED_HISTORY
fi

# Aliase
alias sysupdate="sudo pacman -Syu"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias pacman-install="sudo pacman -S "
alias yay=paru
alias myip4="curl myip.wtf -4"
alias myip6="curl myip.wtf -6"

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"


eval "$(oh-my-posh init $CURRENT_SHELL --config ~/.local/share/oh-my-posh/poshcat.omp.json)"
#export DEVKITPRO=/opt/devkitpro
#export DEVKITARM=${DEVKITPRO}/devkitARM
#export DEVKITPPC=${DEVKITPRO}/devkitPPC


#export PATH="$HOME/.symfony5/bin:$PATH"
#export PATH=${DEVKITPRO}/tools/bin:$PATH

# Add .NET Core SDK tools
#export PATH="$PATH:/home/fthomys/.dotnet/tools"
alias dotfiles='/usr/bin/git --git-dir=/home/fthomys/.dotfiles/ --work-tree=/home/fthomys'
