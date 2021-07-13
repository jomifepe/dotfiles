# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZLE_RPROMPT_INDENT=2
COMPLETION_WAITING_DOTS=true
DISABLE_MAGIC_FUNCTIONS=true # make pasting into terminal faster
ZSH_AUTOSUGGEST_MANUAL_REBIND=1 # make prompt faster

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions
      
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet https://github.com/wting/autojump/blob/master/bin/autojump.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ls='ls -G -F'
alias la='exa -lah --group-directories-first'
alias ll='exa -lh --group-directories-first'
alias t='exa -T'
alias tl='exa -Tla -L 2'
alias df='df -h'
alias ipp='curl ipinfo.io/ip'
# alias del='trash-put'
alias v='vim'
alias hosts="sudo $EDITOR /etc/hosts"
alias grep="grep --color=always"
alias zshrc="vim ~/.zshrc"
alias brew-noau="HOMEBREW_NO_AUTO_UPDATE=1 brew"

eval $(thefuck --alias)

# SDKMAN
export SDKMAN_DIR="/Users/jmfp/.sdkman"
[[ -s "/Users/jmfp/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jmfp/.sdkman/bin/sdkman-init.sh"

bindkey '^R' history-incremental-search-backward
