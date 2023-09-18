# BASH Theme.

text_bold="$(tput bold)"
text_reset="$(tput sgr0)"
text_red="\[\e[0;31m\]"

__bash_prompt_statusmsg()
{
    local exit="$1"
    local msg=""

    if [[ "${exit}" != "0" ]]; then
        msg+="${text_red}[${exit}]${text_reset}"
    fi

    printf "%*s" $COLUMNS "$msg"
}

__bash_prompt_command()
{
    local exit="$?"
    
    PS1="\[$(tput sc; __bash_prompt_statusmsg ${exit}; tput rc)\][\u@\h ${text_bold}\W${text_reset}]\$ "
}
PROMPT_COMMAND=__bash_prompt_command
