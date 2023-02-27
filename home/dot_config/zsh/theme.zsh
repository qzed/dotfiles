# ZSH Theme.

# Load color variables.
autoload -U colors && colors

# Enable advanced prompt substitutions.
setopt prompt_subst

# Basic prompt line.
update_prompt () {
    PS1='[%n@%m %{$bold_color%}%1~%{$reset_color%}]%(!.#.$) '
    RPS1='%(?..%{$fg_no_bold[red]%}[%{$fg_bold[red]%}%?%{$fg_no_bold[red]%}]%{$reset_color%})'

    # Add vi-mode customization here if desired
}
update_prompt

# Basic cursor settings
update_cursor () {
    # Set cursor style (DECSCUSR), VT520.
    # - 0  ->  blinking block.
    # - 1  ->  blinking block (default).
    # - 2  ->  steady block.
    # - 3  ->  blinking underline.
    # - 4  ->  steady underline.
    # - 5  ->  blinking bar, xterm.
    # - 6  ->  steady bar, xterm.

    # keymap values:
    # - emacs
    # - viins|main
    # - vicmd
    # - viopp
    # - visual
    # - isearch
    # - command
    # - .safe

    local insm_cursor='\e[5 q'      # blinking bar
    local norm_cursor='\e[1 q'      # blinking block

    if [[ ${1} = 'normal' ]]; then
        echo -ne ${norm_cursor}
    elif [[ ${1} = 'insert' ]]; then
        echo -ne ${insm_cursor}
    elif [[ ${KEYMAP} == vicmd ]]; then
        echo -ne ${norm_cursor}
    elif [[ ${KEYMAP} == main ]] ||
         [[ ${KEYMAP} == viins ]]; then
        echo -ne ${insm_cursor}
    fi
}
update_cursor 'insert'

# Reset cursor for new prompt
_reset_cursor() {
    update_cursor 'insert'
}
precmd_functions+=(_reset_cursor)
