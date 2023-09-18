# BASH history settings.

HISTSIZE=10000                  # Number of history items to store in memory
HISTFILESIZE=10000              # Number of history items to store to disk

HISTCONTROL=ignoreboth:erasedups
shopt -s histappend             # Append to history, don't overwrite it
