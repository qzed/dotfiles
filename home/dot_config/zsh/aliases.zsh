# ZSH alias definitions.


# Use nvim if available, else vim
if is_command "nvim" ; then
    alias vim="nvim"
    alias vi="nvim"

elif is_command "vim" ; then
    alias vi="vim"
    alias nvim="vim"
fi


alias hist="fc -li"             # History with timestamps


# View archives based on their suffixes
alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s tar.gz="echo "

# Open files based on their suffixes
alias -s pdf="xdg-open"

# Open files with fzf
alias fzf-open="fzf --bind 'enter:execute-silent(xdg-open {})+abort'"
