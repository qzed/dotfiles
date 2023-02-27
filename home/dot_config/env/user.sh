# Environment variables to be set when the user logs in.


# Load utility functions (path_append, flags_append, ...)
source "${XDG_CONFIG_HOME:-${HOME}/.config}/env/utils.sh"


# Set `EDITOR` and `VISUAL`
if is_command "nvim" ; then         # Use `nvim` if available
    nvim="$(command -v nvim)"

    export VISUAL="${nvim}"
    export EDITOR="${nvim}"
    export SYSTEMD_EDITOR="${nvim}"

    unset nvim

elif is_command "vim" ; then        # Fallback 1: `vim`
    vim="$(command -v vim)"

    export VISUAL="${vim}"
    export EDITOR="${vim}"
    export SYSTEMD_EDITOR="${vim}"

    unset vim

elif is_command "vi" ; then         # Fallback 2: `vi`
    vi="$(command -v vi)"

    export VISUAL="${vi}"
    export EDITOR="${vi}"
    export SYSTEMD_EDITOR="${vi}"

    unset vi
fi


# Modify PATH etc., 
path_prepend PATH "${HOME}/.cargo/bin"
path_prepend PATH "${HOME}/.local/bin"


# pipenv
export PIPENV_VENV_IN_PROJECT="enabled"


# less configuration
if [[ -f "${HOME}/.local/bin/src-hilite-lesspipe.sh" ]] && is_command "lesspipe" ; then
    eval "$(lesspipe)"
    export LESS="-R"
    export LESSOPEN="| ${HOME}/.local/bin/src-hilite-lesspipe.sh %s"
elif is_command "src-hilite-lesspipe.sh" && is_command "lesspipe" ; then
    src_hilite_lesspipe="$(command -v src-hilite-lesspipe.sh)"
    eval "$(lesspipe)"
    export LESS="-R"
    export LESSOPEN="| ${src_hilite_lesspipe} %s"
elif is_command "lesspipe" ; then
    eval "$(lesspipe)"
fi
