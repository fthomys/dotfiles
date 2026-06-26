export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd notify

plugins=(git kubectl docker)

source "$ZSH/oh-my-zsh.sh"

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='none'
ZSH_HIGHLIGHT_STYLES[builtin]='none'
ZSH_HIGHLIGHT_STYLES[function]='none'
ZSH_HIGHLIGHT_STYLES[alias]='none'

bindkey "^[[3~" delete-char
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

export EDITOR=nvim
export VISUAL=nvim

alias ll="ls -la"
alias vim="nvim"
alias grep="grep --color=auto"
alias myip4="curl myip.wtf -4"
alias myip6="curl myip.wtf -6"
alias svim='sudo -E nvim'
alias dotfiles='yadm'

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

eval "$(zoxide init --cmd cd zsh)"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


eval "$(starship init zsh)"


export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
