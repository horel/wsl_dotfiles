export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"

export EDITOR=nvim

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"
export _ZL_DATA="${ZSH_CACHE_DIR}/.zlua"

export YARN_BIN="${XDG_DATA_HOME}/yarn/bin"

export PATH="${PATH}:${YARN_BIN}"
