if isdirectory($HOME . '/.local/share/nvim/undo') == 0
    :silent !mkdir -p ~/.local/share/nvim/undo > /dev/null 2>&1
endif

if isdirectory($HOME . '/.local/share/nvim/backup') == 0
    :silent !mkdir -p ~/.local/share/nvim/backup > /dev/null 2>&1
endif

if isdirectory($HOME . '/.local/share/nvim/swap') == 0
    :silent !mkdir -p ~/.local/share/nvim/swap > /dev/null 2>&1
endif

set undodir=~/.local/share/nvim/undo/
set backupdir=~/.local/share/nvim/backup/
set directory=~/.local/share/nvim/swap/

syntax on

set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

set number

set mouse=a
