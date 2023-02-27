zmodload -i zsh/complist

# Load completion system
autoload -U compinit


# Set completion options
setopt no_menu_complete         # If completion is ambiguous, do not jump into menu directly
setopt auto_menu                # If completion is ambiguous, jump into menu after second request
setopt complete_in_word         # Enable completion inside words
setopt no_list_beep             # Disable beeping for ambiguous completions


# Set completer functions to apply and their order
zstyle ':completion:*' completer _complete _ignored _correct _approximate

# Enable caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path "${ZSH_CACHE_DIR}/compcache"

# Use menu selection
zstyle ':completion:*:*:*:*:*' menu select

# Case insensitive matching and partial-word completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Allow up to two errors for corrections in completion
zstyle ':completion:*:correct:*' max-errors 2 non-numeric

# Allow up to five errors for approximate completion, depending on the word length
zstyle -e ':completion:*:approximate:*' max-errors '
    local n=$(( ($#PREFIX + $#SUFFIX) / 3 ))
    reply=$(( n > 5 ? 5 : (n < 1 ? 1 : n) ))numeric'

# Verbose completion, i.a. useful for `kill`
zstyle ':completion:*' verbose yes

# Sort file completions by their name
zstyle ':completion:*' file-sort name

# Hide parent and current directory when completing directories
zstyle ':completion:*' ignore-parents parent pwd .. directory

# Use LS_COLORS for file/directory/... completions (must be set previously)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Ignore system users (this also includes their respective named directories)
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav colord cups daemon dbus deluge distcache dnsmasq dovecot fax ftp \
        games gdm git gkrellmd gopher hacluster haldaemon halt hsqldb http \
        ident junkbust kdm ldap lp mail mailman mailnull man messagebus \
        mldonkey mysql nagios named netdata netdump news nfsnobody nobody nscd \
        ntp nut nvidia-persistenced nx obsrun openvpn operator pcap polkitd \
        postfix postgres privoxy pulse pvm quagga radvd rpc rpcuser rpm rtkit \
        scard shutdown squid sshd statd svn sync systemd-bus-proxy \
        systemd-coredump systemd-journal-gateway systemd-journal-remote \
        systemd-journal-upload systemd-network systemd-resolve systemd-timesync \
        tftp ups usbmux uucp uuidd vcsa wwwrun xfs '_*'

# Display an ignored match if it is the only one found
zstyle '*' single-ignored show

# Disable completion for named directories when using cd
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Improve ssh host completion by forcing fall-through to parse `~/.ssh/config`.
# Note: `_my_hosts` can be defined as function, in which case this will be called instead.
zstyle -e ':completion:*:*:(ssh|scp):*:my-accounts' users-hosts \
    '[[ -f ~/.ssh/config && $key = hosts ]] && key=my_hosts reply=()'

# Specialze completion for kill and processes
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u ${USER} -o pid,user,comm -w -w"


# Initialize completion system. Note: Completion-plugins must be loaded before this call.
compinit -d "${ZSH_CACHE_DIR}/compdump"
