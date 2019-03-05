syntax on
set hlsearch
set incsearch

set nocompatible      "don't do weird stuff for backwards compatibility with vi
set number            "turn on line numbers
set showcmd           "multi-keystroke commands will be shown in bottom right
set noerrorbells      "disable error bells
set belloff=all       "disable bell for non-errors, too

" nicer tabing
set wildmenu
set wildmode=list,full

" tab config
set expandtab       " Use TABs instead of spaces
"set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set tabstop=2
