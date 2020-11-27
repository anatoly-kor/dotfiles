set nocompatible              " be iMproved, required
filetype off                  " required



" ==================================================
" --------------------Vim-Plug----------------------
" ==================================================
call plug#begin('~/.vim/plugged')


Plug 'tpope/vim-fugitive' "TODO: LEARN
Plug 'tpope/vim-surround'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'} " :CocInstall coc-json coc-tsserver
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'fisadev/vim-isort'
Plug 'vim-test/vim-test'
Plug 'christoomey/vim-system-copy'
Plug 'fcpg/vim-osc52'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'

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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = ' ❤  '
let g:airline_right_sep = ''
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


" ==================================================
" --------------------VIM---------------------------
" ==================================================

" nnoremap <Leader><space> <CR>
let mapleader=" "

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc<CR>
nnoremap <silent><leader>2 :source ~/.vimrc \| :PlugInstall<CR>

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

" move between buffers
map <C-h> <Esc>:bprev<CR>
map <C-l> <Esc>:bnext<CR>

" Foldings
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

set colorcolumn=0

" Tagbar
nnoremap <leader>tb :TagbarToggle<CR>

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

au BufNewFile,BufRead *.py 
    \ set foldmethod=indent

" ALE
let g:ale_linters = {'python': ['flake8', 'pylint']}
" :ALEFix

" coc

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references) coc

" isort
nnoremap <Leader>is :Isort<CR>
let g:vim_isort_python_version = 'python3'

" Tests
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Debug
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

" Run script
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" ==================================================
" --------------------GIT---------------------------
" ==================================================
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gl :diffget //2<CR>
nnoremap <leader>gs :G <CR>
" dv for resolve merge conflict

set mouse=a

vmap <C-c> y:Oscyank<CR>
xmap <F7> y:Oscyank<CR>



" ==================================================
" --------------------FZF---------------------------
" ==================================================
" let g:fzf_command_prefix = 'Fzf'
" :Files
" :Files!
" :GFiles open only git files 
" :Commits

nnoremap <C-g> :Ag<Cr>
nnoremap <silent><leader>l :Buffers<CR>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <leader>gc :GCheckout<CR>


" ==================================================
" --------------------tmux--------------------------
" ==================================================
