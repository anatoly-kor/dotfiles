set nocompatible              " be iMproved, required
filetype off                  " required

" -- Clipboard
" set clipboard=unnamed

" -- Display
set title			" Update the title of your window or your terminal
set number relativenumber	" Display hybrid line numbers
set wrap			" Wrap lines when they are too long

" Enable syntax highlighting
syntax enable

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

" ==================================================
" --------------------Vundle------------------------
" ==================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive' "TODO: LEARN
Plugin 'git://git.wincent.com/command-t.git' "TODO: LEARN
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'editorconfig/editorconfig-vim'


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
" --------------------Airline------------------------
" ==================================================
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1 
let g:airline_left_sep = ' ❤  '
let g:airline_section_warning = '' 
let g:airline_section_x = '' 
let g:airline_section_y = '' 
let g:airline_section_z = '' 

" ==================================================
" --------------------NerdTree------------------------
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
