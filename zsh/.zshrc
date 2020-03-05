export ZSH="$HOME/.oh-my-zsh"

ZLE_RPROMPT_INDENT=2

SPACESHIP_HOST_SHOW=always
SPACESHIP_USER_SHOW=always
SPACESHIP_TIME_SHOW=true
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_USER_SUFFIX=""
SPACESHIP_USER_PREFIX=""
SPACESHIP_TIME_SUFFIX=""
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_TRUNC=2
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_PREFIXES_SHOW=true
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_PROMPT_ORDER=(
    user
    host
    line_sep
    dir
    char
)
SPACESHIP_RPROMPT_ORDER=(
    git
)

ZSH_THEME="spaceship"
# ZSH_THEME="robbyrussell"

plugins=(
    git
    colored-man-pages
    zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.config/nvm"

# *** BEGIN-ALIASES-FUNCTIONS ***
alias ls='ls --color=auto -FN'
alias la='exa -lah --group-directories-first'
alias ll='exa -lh --group-directories-first'
alias t='exa -T'
alias tl='exa -Tla -L 2'
alias df='df -h'
alias dff='df -Th'
alias ipp='curl ipinfo.io/ip'
alias del='trash-put'
alias v='vim'
alias p='sudo pacman'

alias s="cd $HOME/Dropbox/School/MEI-CM/Y1_S2"
alias dl="cd $HOME/Downloads"

alias paci='sudo pacman -S' # install package
alias pacrm='sudo pacman -R' # remove package
alias pacrmu='sudo pacman -Rns' # remove package and unused
alias pacrmo='sudo pacman -Rns $(pacman -Qtdq)' # remove orphan packages
alias pacsy='sudo pacman -Sy' # synchonize package databases
alias pacl='pacman -Q' # list all installed packages
alias paclm='pacman -Qm' # list all manually installed packages
alias paclaur='pacman -Qe' # list installed aur packages
alias pacli='pacman -Qii' # list information on package
alias paclo='pacman -Qtdq' # list orphan packages
alias pacsp='pacman -Qs' # search installed packages for keywords
alias pacsf='pacman -Fs' # search the package of a file
alias pacsfo='pacman -Qo' # search the owner of a file
alias pacb="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'" # browse installed packages

alias google-chrome='google-chrome-stable'
alias CShell='java -jar /usr/bin/cshell/CShell.jar'

# Loading nvm on startup is slow
alias loadnvm=". $NVM_DIR/nvm.sh && . $NVM_DIR/bash_completion"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function homestead() { ( cd ~/Homestead && vagrant $* ) }
function sfind() { pacman -Qql $1 | grep -Fe .service -e .socket }
function pport() { sudo lsof -i:$1 }
function lports() { sudo lsof -i -P -n | grep LISTEN }
# *** END-ALIASES-FUNCTIONS ***

# Avoid vim freeze when pressing ctrl+s
stty -ixon

# Fuck
eval $(thefuck --alias)
