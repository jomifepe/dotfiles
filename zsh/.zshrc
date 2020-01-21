# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export SCHOOL="$HOME/Dropbox/MEI-MC/Y1_S1/"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias list-aliases='sed -n '/BEGIN-ALIASES-FUNCTIONS/,/END-ALIASES-FUNCTIONS/p' $HOME/.zshrc'

# *** BEGIN-ALIASES-FUNCTIONS ***
alias ls='ls --color=auto -FHh'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'
alias df='df -h'
alias dff='df -Th'
alias ipp='curl ipinfo.io/ip'
alias del='trash-put'

# pacman
alias paci-pckg='sudo pacman -S' # install package
alias pacrm-pckg='sudo pacman -R' # remove package
alias pacrm-unused='sudo pacman -Rns' # remove package and unused
alias pacsy='sudo pacman -Sy' # synchonize package databases
alias pacl-all-pckgs='pacman -Qm' # list all installed packages
alias pacl-aur-pckgs='pacman -Qe' # list installed aur packages
alias pacl-pckg-info='pacman -Qii' # list information on package
alias pacs-file='pacman -Fs' # search the package of a file
alias pacs-installed-pckg='pacman -Qs' # search installed packages for keywords
alias pacs-file-owner='pacman -Qo' # search the owner of a file

alias google-chrome='google-chrome-stable'
alias CShell='java -jar /usr/bin/cshell/CShell.jar'

alias i3conf="vim $HOME/.config/i3/config"
alias polyconf="vim $HOME/.config/polybar/config"
alias zshconf="vim $HOME/.zshrc"

alias minecraft-server-1.12.2='cd /media/storage/Games/Minecraft/minecraft-server-1.12.2/; sh ./start-forge-server.sh'

function homestead() { ( cd ~/Homestead && vagrant $* ) }
function sfind() { pacman -Qql $1 | grep -Fe .service -e .socket }
function pport() { sudo lsof -i:$1 }
function lports() { sudo lsof -i -P -n | grep LISTEN }
# *** END-ALIASES-FUNCTIONS ***

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Avoid vim freeze when pressing ctrl+s
stty -ixon
