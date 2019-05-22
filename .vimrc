syntax on
set hlsearch
set incsearch

set title             " show file in titlebar
set ruler             " show cursor position in status bar

set nocompatible      " don't do weird stuff for backwards compatibility with vi
set number            " turn on line numbers
set relativenumber    " turn on relative line numbers
set showcmd           " multi-keystroke commands will be shown in bottom right
set noerrorbells      " disable error bells
set belloff=all       " disable bell for non-errors, too

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
set wildmode=list,full
" eg.
" - hit tab to :find by partial match
" - use * to make it fuzzy
" - :b to autocomplete an open buffer

" use spaces instead tabs
set expandtab
" set tab size
set tabstop=2

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" add ruler at column 80
" set colorcolumn=80
" highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" customize popup menu color
highlight Pmenu ctermfg=white guifg=white ctermbg=darkgrey guibg=darkgrey
highlight PmenuSel ctermfg=yellow guifg=yellow ctermbg=darkblue guibg=darkblue
highlight PmenuSbar ctermbg=darkgrey guibg=darkgrey
highlight PmenuThumb ctermbg=lightgrey guibg=lightgrey

" wean off the arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

