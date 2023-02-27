# ZSH history settings.

HISTFILE="${HOME}/.zhistory"

HISTSIZE=10000                  # Number of history items to store in memory
SAVEHIST=10000                  # Number of history items to store to disk

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
