# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZLE_RPROMPT_INDENT=2

# SPACESHIP_HOST_SHOW=always
# SPACESHIP_USER_SHOW=always
# SPACESHIP_TIME_SHOW=true
# SPACESHIP_HOST_PREFIX="@"
# SPACESHIP_USER_SUFFIX=""
# SPACESHIP_USER_PREFIX=""
# SPACESHIP_TIME_SUFFIX=""
# SPACESHIP_DIR_PREFIX=""
# SPACESHIP_DIR_TRUNC=2
# SPACESHIP_PROMPT_ADD_NEWLINE=true
# SPACESHIP_PROMPT_PREFIXES_SHOW=true
# SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
# SPACESHIP_PROMPT_ORDER=(
#     user
#     host
#     package
#     node
#     docker
#     golang
#     line_sep
#     dir
#     char
# )
# SPACESHIP_RPROMPT_ORDER=(
#     git
# )

DISABLE_MAGIC_FUNCTIONS=true
COMPLETION_WAITING_DOTS=true

alias ls='ls -G -F'
alias la='exa -lah --group-directories-first'
alias ll='exa -lh --group-directories-first'
alias t='exa -T'
alias tl='exa -Tla -L 2'
alias df='df -h'
alias ipp='curl ipinfo.io/ip'
alias del='trash-put'
alias v='vim'
alias hosts="sudo $EDITOR /etc/hosts"
alias grep="grep --color=always"
alias zshrc="vim ~/.zshrc"

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
# https://zdharma.org/zinit/wiki/Example-Minimal-Setup/
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet https://github.com/wting/autojump/blob/master/bin/autojump.zsh

eval $(thefuck --alias)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR="vim"
export GOPATH="$HOME/go"
[[ ":$PATH:" != *":$GOPATH/bin:"* ]] && export PATH="$GOPATH/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
[[ ":$PATH:" != *":$PYENV_ROOT/bin:"* ]] && export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/jmfp/.sdkman"
[[ -s "/Users/jmfp/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jmfp/.sdkman/bin/sdkman-init.sh"
