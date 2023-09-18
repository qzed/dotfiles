# ZSH alias definitions.


# Use nvim if available, else vim
if is_command "nvim" ; then
    alias vim="nvim"
    alias vi="nvim"

elif is_command "vim" ; then
    alias vi="vim"
    alias nvim="vim"
fi


alias hist="fc -l"


# Open files with fzf
alias fzf-open="fzf --bind 'enter:execute-silent(xdg-open {})+abort'"
