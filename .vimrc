set nocompatible              " be iMproved, required
filetype off                  " required

" ==================================================
" --------------------Vundle------------------------
" ==================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive' "TODO: LEARN
Plugin 'git://git.wincent.com/command-t.git' "TODO: LEARN
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} "TODO: LEARN
Plugin 'preservim/nerdtree' "TODO: LEARN
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'editorconfig/editorconfig-vim' "TODO: LEARN
Plugin 'git://github.com/altercation/vim-colors-solarized.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'dracula/vim'
Plugin 'tmhedberg/SimpylFold' "TODO: LEARN
Plugin 'vim-scripts/indentpython.vim' "TODO: LEARN
Plugin 'vim-syntastic/syntastic' "TODO: LEARN
Plugin 'nvie/vim-flake8' "TODO: LEARN
Plugin 'kien/ctrlp.vim' "TODO: LEARN
" Plugin 'neoclide/coc.nvim', {'branch': 'release'} "TODO: LEARN



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ==================================================
" --------------------Airline-----------------------
" ==================================================
" let g:airline_theme = 'solarized'
" let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1 
let g:airline_left_sep = ' ❤  '
let g:airline_section_warning = '' 
let g:airline_section_x = '' 
let g:airline_section_y = '' 
let g:airline_section_z = '' 

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

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=120
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
let python_highlight_all=1
