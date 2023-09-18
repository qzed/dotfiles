# Misc. settings


# Set LS_COLORS, use `colors` file if available
# Note: Has to be set before its use in `completion.zsh`
if [[ -f "${XDG_CONFIG_HOME:-${HOME}/.config}/ls/colors" ]]; then
    eval $(dircolors "${XDG_CONFIG_HOME:-${HOME}/.config}/ls/colors")
else
    eval $(dircolors)
fi

shopt -s extglob                # Improve file-globbing
