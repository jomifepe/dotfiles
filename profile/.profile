export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export JAVA_HOME="/usr/lib/jvm/default"
export ANDROID_HOME="$HOME/Android/Sdk"

# Default apps
export BROWSER="google-chrome-stable"
export TERMINAL="termite"
export EDITOR="vim"
export LOCKER="i3lock-blur"
export VFILES="pcmanfm"
export TFILES="ranger"

# Home directory clean-up
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export HISTFILE="$XDG_CONFIG_HOME/zsh/.zsh_history"
export ERRFILE="$XDG_CACHE_HOME/.xsession-errors"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

[ -z "$ZSH_COMPDUMP" ] && \
	ZSH_COMPDUMP="${ZDOTDIR:-${ZSH}}/cache/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

# Adding to path: user scripts, user binaries, android home and tools
export PATH="$PATH:$HOME/.scripts:$HOME/.local/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

setxkbmap -layout pt

