# Improve directory management and `cd`


# Improve `cd`
setopt auto_pushd                   # Make `cd` behave like pushd
setopt pushd_minus                  # Make `cd -` behave like `pushd -` (rotate the stack)
setopt pushd_ignore_dups            # Ignore duplicates in pushd stack

alias d="dirs -v | head -10"        # Alias for displaying directory stack
alias pd="popd"

# Sortcuts for `ls`
if is_command "eza" ; then          # Use `eza` if available
    alias ll="eza -lhb --group-directories-first --sort=Name"
    alias la="eza -lhba --group-directories-first --sort=Name"
    alias ls="eza --group-directories-first --sort=Name"
    alias t="eza -T --group-directories-first --sort=Name"
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
