set nocompatible              " be iMproved, required
filetype off                  " required

" ==================================================
" --------------------Vim-Plug----------------------
" ==================================================
call plug#begin('~/.vim/plugged')


" Plug 'tpope/vim-fugitive' "TODO: LEARN
Plug 'preservim/nerdtree' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim' "TODO: LEARN
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'dracula/vim'
Plug 'tmhedberg/SimpylFold' "TODO: LEARN
" Plug 'vim-scripts/indentpython.vim' "TODO: LEARN
Plug 'vim-syntastic/syntastic' "TODO: LEARN
Plug 'nvie/vim-flake8' "TODO: LEARN
Plug 'kien/ctrlp.vim' "TODO: LEARN
Plug 'tpope/vim-commentary'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim' " Plug 'jeetsukumaran/vim-pythonsense'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

call plug#end()
" PlugInstall [name]
" PlugUpdate [name]
" PlugClean!
" PlugUpgrade
" PlugStatus

" ==================================================
" --------------------Airline-----------------------
" ==================================================
let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = ' ❤  '
let g:airline_right_sep = ' 🟆  '
let g:airline_section_warning = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
set laststatus=2

" ==================================================
" --------------------NerdTree----------------------
" ==================================================
" -- Keys
map <C-n> :NERDTreeToggle<CR>
" switch to left / right split (mostly for Nerd Tree)
map <C-h> <C-W>h
map <C-l> <C-W>l

let NERDTreeShowHidden=1

" switch tab
map <C-k> :tabn<CR>
map <C-j> :tabp<CR>


" ==================================================
" --------------------VIM---------------------------
" ==================================================
colorscheme dracula
" Enable syntax highlighting
syntax enable

" -- Clipboard
set clipboard=unnamed

" -- Display
set title			" Update the title of your window or your terminal
set number relativenumber	" Display hybrid line numbers
set wrap			" Wrap lines when they are too long
set ruler

" -- Beep
set novisualbell
set noerrorbells

" -- Search
set ignorecase
set smartcase
set hlsearch

" spaces instead of tabs
set expandtab
set smarttab
set tabstop     =4
set shiftwidth  =4
set smartindent
set autoindent

set splitbelow
set splitright

"split navigations
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" Foldings
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1
nnoremap <space> za

set colorcolumn=0

" ==================================================
" --------------------Python------------------------
" ==================================================
set encoding=utf-8
let python_highlight_all=1
au BufNewFile,BufRead *.py
    \ set expandtab       |" replace tabs with spaces
    \ set autoindent      |" copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4

au BufNewFile,BufRead *.py \
  set foldmethod=indent
nnoremap <space> za

" ALE
let g:ale_linters = {'python': ['flake8', 'pylint']}

