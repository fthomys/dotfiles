export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd notify

plugins=(
  git
  kubectl
  docker
  helm
  kubectx
  fzf
  extract
  web-search
  history-substring-search
  sudo
  colored-man-pages
  command-not-found
  dirhistory
  copypath
  copyfile
  jsontools
  urltools
  encode64
  git-extras
  forgit
  common-aliases
  aliases
  zsh-completions
  fzf-tab
  you-should-use
  zsh-autopair
  zsh-autosuggestions
  zsh-syntax-highlighting
)
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

invy-client() {
  if [[ "$1" == report && "$2" == send ]]; then
    local d="$HOME/.local/share/invy-client"
    sudo systemd-run --wait --pipe --quiet -p User="$USER" \
      -p WorkingDirectory="$d" \
      -p BindReadOnlyPaths="$d/os-release:/usr/lib/os-release" \
      "$HOME/.local/share/pipx/venvs/invy-client/bin/invy-client" "$@"
  else
    command invy-client "$@"
  fi
}

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
eval "$(zoxide init --cmd cd zsh)"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


eval "$(starship init zsh)"
export LS_COLORS="$(/home/linuxbrew/.linuxbrew/bin/vivid generate catppuccin-mocha)"


export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
[[ -f $HOME/.local/bin/env ]] && source $HOME/.local/bin/env

export PATH="/home/fthomys/.local/bin:$PATH"

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC
[[ -f /etc/profile.d/devkit-env.sh ]] && source /etc/profile.d/devkit-env.sh


export PATH="$PATH:$HOME/.local/share/depot_tools"
unalias fastfetch

export DOTNET_ROOT="/home/linuxbrew/.linuxbrew/opt/dotnet/libexec"
export PATH="$HOME/.dotnet/tools:$PATH"
