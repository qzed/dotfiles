# Improve directory management and `cd`


# Improve `cd`. Implement ZSH auto_pushd-like functionality.
cd()
{
    if [ $# -eq 0 ]; then
        DIR="${HOME}"
    else
        DIR="$1"
    fi

    builtin pushd "${DIR}" > /dev/null
}

alias d="dirs -v | head -10"        # Alias for displaying directory stack
alias pd="popd"

# Sortcuts for `ls`
if is_command "eza" ; then          # Use `eza` if available
    alias ll="exa -lhb --group-directories-first --sort=Name"
    alias la="exa -lhba --group-directories-first --sort=Name"
    alias ls="exa --group-directories-first --sort=Name"
    alias t="exa -T --group-directories-first --sort=Name"
elif is_command "exa" ; then          # Use `exa` if available (deprecated, prefer eza)
    alias ll="exa -lhb --group-directories-first --sort=Name"
    alias la="exa -lhba --group-directories-first --sort=Name"
    alias ls="exa --group-directories-first --sort=Name"
    alias t="exa -T --group-directories-first --sort=Name"
else                                                # Fallback to `ls`
    alias ll="ls -lhF --color=auto"
    alias la="ls -lAhF --color=auto"
    alias ls="ls -F --color=auto"
    alias t="tree"
fi
