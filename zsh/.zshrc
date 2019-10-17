# Path to your oh-my-zsh installation.
export ZSH="/home/jmfp/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ls='ls --color=auto -FHh'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'
alias ..='cd ..'
alias ...='cd ...'
alias df='df -h'
alias dff='df -Th'
alias ipp='curl ipinfo.io/ip'

alias i3conf='vim ~/.config/i3/config'
alias polyconf='vim ~/.config/polybar/config'
alias zshconf='vim ~/.zshrc'

alias minecraft-server-1.12.2='cd /media/storage/Games/Minecraft/minecraft-server-1.12.2/; sh ./start-forge-server.sh'

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

function sfind() {
	pacman -Qql $1 | grep -Fe .service -e .socket
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
