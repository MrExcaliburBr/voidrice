# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.config/oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
 CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-vim-mode zsh-syntax-highlighting) 


source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
 export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.

#path
export PATH="$PATH":~/code/scripts/

#XDG base directory specification
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache

# default programs
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="qutebrowser"
export READER="zathura"
export VISUAL="nvim"
export TMUX=""

# ~/ cleanup
export TASKDATA="$XDG_DATA_HOME"/task
export TASKRC="$XDG_CONFIG_HOME"/task/taskrc
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE=-
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export NNN_PLUG='f:fzcd;y:.cbcp'
export NNN_FIFO=/tmp/nnn.fifo

# vi mode
bindkey -v
export KEYTIMEOUT=1

#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#928374'

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey "^E" edit-command-line

#Auto tmux
if [ -n "$PS1" ] &&
	[ -n "$DISPLAY" ] &&
	[[ ! "$TERM" =~ linux ]] &&
	[[ ! "$TERM" =~ tmux ]] &&
	[ -z "$TMUX" ] &&
	! [ -e ~/storage/shared ]; then
	if command -v tmux &>/dev/null; then
		exec tmux
	fi
fi

# kill all tmux sessions with no terminal emulator attached
tmkill() {
	LIST="$(tmux ls)"
	TSESSIONS=""
	while read -r line; do
		if ! echo "$line" | grep 'attached'; then
			tmux kill-session -t "$(echo $line | grep -oP '^\d\d?')"
		fi
	done <<<"$LIST"
}

#aliases
alias firefox='glibc firefox'
alias nnn='nnn -e'
alias tmux='tmux -2'
alias clo='cloner.sh'
alias se='fuzzyfinder.sh'
alias la='ls -A'
alias ..='cd ..'
alias xi='sudo xbps-install'
alias xu='sudo xbps-install -Su'
alias xq='xbps-query'
alias xr='sudo xbps-remove'
alias weather='curl wttr.in'
#alias tmaster='tmux-autostart.sh'
alias tfm='tmux new-session -A -s nnn tmux linkw -s master:fm'
alias tsm='tmux new-session -A -s sys tmux linkw -s master:sm'
alias tmus='tmux new-session -A -s cmus tmux linkw -s master:mus'
alias tnew='tmux new-session -A -s newsboat tmux linkw -s master:new'
alias tchat='tmux new-session -A -s cordless tmux linkw -s master:chat'
alias tkill='tmux kill-session -t'
alias tkillall='tmux kill-server'
alias tbind='vim .config/tmux/tmux-cheatsheet.markdown'
alias tls='tmux ls'
alias ytdlm='youtube-dl -x --audio-format mp3 '
alias ytdlv='youtube-dl '
alias tmuxn='tmux new-session -s $$'
alias gimp='flatpak run org.gimp.GIMP'
_trap_exit() { tmux kill-session -t $$; }
trap _trap_exit EXIT

#source "$XDG_CONFIG_HOME/oh-my-zsh/custom/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh"
#source "$XDG_CONFIG_HOME/oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

