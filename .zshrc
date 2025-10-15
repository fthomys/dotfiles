source ~/.profile
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=10000
setopt autocd notify
zstyle :compinstall filename '/home/fthomys/.zshrc'

autoload -Uz compinit
compinit
[[ $- != *i* ]] && return


# Keybinds 
bindkey "^[[3~" delete-char
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

