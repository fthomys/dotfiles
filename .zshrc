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
  zsh-completions
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

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export JAVA_HOME=/home/fthomys/.local/share/JetBrains/Toolbox/apps/android-studio/jbr
export PATH="$JAVA_HOME/bin:$PATH"
eval "$(zoxide init --cmd cd zsh)"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


eval "$(starship init zsh)"


export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
[[ -f $HOME/.local/bin/env ]] && source $HOME/.local/bin/env

if [[ "${HOST:-$(hostname)}" == "ws-fthomys" ]]; then
enroll-secureboot() {
  local dev="$1"
  local pub=/etc/kernel/tpm2-pcr-public-key.pem
  if [[ -z "$dev" ]]; then
    dev=$(lsblk -rno NAME,FSTYPE | awk '$2=="crypto_LUKS"{print "/dev/"$1}')
    if [[ $(print -l -- $dev | grep -c .) -ne 1 ]]; then
      print -u2 "enroll-secureboot: could not auto-detect a single LUKS device; pass it explicitly."
      print -u2 "  candidates: ${dev:-none}"
      return 1
    fi
  fi
  if [[ ! -b "$dev" ]]; then
    print -u2 "enroll-secureboot: $dev is not a block device."
    return 1
  fi
  if [[ ! -f "$pub" ]]; then
    print -u2 "enroll-secureboot: PCR public key $pub missing — run setup-pcr11-autounlock.sh first."
    return 1
  fi
  print "Re-enrolling TPM2 (signed PCR-11 policy + PCR 7) on $dev — you'll be asked for your LUKS passphrase."
  sudo systemd-cryptenroll --wipe-slot=tpm2 --tpm2-device=auto \
    --tpm2-pcrs=7 \
    --tpm2-public-key="$pub" \
    --tpm2-public-key-pcrs=11 \
    "$dev"
}
fi


# Added by Antigravity CLI installer
export PATH="/home/fthomys/.local/bin:$PATH"

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC
[[ -f /etc/profile.d/devkit-env.sh ]] && source /etc/profile.d/devkit-env.sh


# depot_tools (Chromium)
export PATH="$PATH:$HOME/.local/share/depot_tools"
