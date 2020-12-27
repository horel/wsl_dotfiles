# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
setopt no_nomatch   # No match fixed

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="${ZSH_CACHE_DIR}/history"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

# case insensitive (all), partial-word and substring completion
if [[ "$CASE_SENSITIVE" = true ]]; then
	zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
  else
	if [[ "$HYPHEN_INSENSITIVE" = true ]]; then
	        zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
	else
		zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
	fi
fi
unset CASE_SENSITIVE HYPHEN_INSENSITIVE
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] ||
	   [[ $1 = 'block' ]]; then
	  echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] ||
	     [[ ${KEYMAP} == viins ]] ||
	     [[ ${KEYMAP} = '' ]] ||
	     [[ $1 = 'beam' ]]; then
	  echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
	zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
	echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-t:
autoload edit-command-line
zle -N edit-command-line
bindkey '^t' edit-command-line

# Load plugins
source "${ZDOTDIR}/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" 2> /dev/null
source "${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" 2> /dev/null
eval "$(lua "${ZDOTDIR}/plugins/z.lua/z.lua"  --init zsh)"

# alias
# List directory contents
alias ls='exa'
alias la='exa -lah'
#alias l='exa -lah'
#alias ll='exa -lh'
alias vi='nvim'
# alias svi='sudoedit'
alias df='df -Th'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

proxy_on () {
    export hostip=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*');
    export https_proxy="socks5://${hostip}:7890";
    export http_proxy="socks5://${hostip}:7890";
    echo "proxy on";
}
proxy_off () {
    unset https_proxy;
    unset http_proxy;
    echo "proxy off";
}
