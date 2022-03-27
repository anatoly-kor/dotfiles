set nocompatible              " be iMproved, required
filetype off                  " required
set noswapfile
set scrolloff=7
set encoding=utf-8
set fileformat=unix

inoremap jk <esc>

let mapleader=" "



" ==================================================
" --------------------Vim-Plug----------------------
" ==================================================
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree' 
Plug 'editorconfig/editorconfig-vim'
" Plug 'tmhedberg/SimpylFold'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-commentary'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'vim-test/vim-test'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'majutsushi/tagbar'
Plug 'yggdroot/indentline'
Plug 'jgdavey/tslime.vim'
" Plug 'pineapplegiant/spaceduck'
Plug 'junegunn/goyo.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'fcpg/vim-osc52'
" Plug 'yamatsum/nvim-cursorline'
Plug 'jmcantrell/vim-virtualenv'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'thedenisnikulin/vim-cyberpunk'

call plug#end()

lua require('plugins')

" ==================================================
" --------------------Packer------------------------
" ==================================================
lua << EOF
require('gitsigns').setup()

require('hardline').setup{
    bufferline = true,
    theme = 'custom',   -- custom theme
    custom_theme = {
        text = {gui = "#000000", cterm = "NONE", cterm16 = "NONE"},
        normal = {gui = "#F72119", cterm = "NONE", cterm16 = "NONE"},
        insert = {gui = "#F72119", cterm = "NONE", cterm16 = "NONE"},
        replace = {gui = "#F72119", cterm = "NONE", cterm16 = "NONE"},
        inactive_comment = {gui = "#F72119", cterm = "NONE", cterm16 = "NONE"},
        inactive_cursor = {gui = "NONE", cterm = "NONE", cterm16 = "NONE"},
        inactive_menu = {gui = "#F72119", cterm = "NONE", cterm16 = "NONE"},
        visual = {gui = "#F72119", cterm = "NONE", cterm16 = "NONE"},
        command = {gui = "#F72119", cterm = "NONE", cterm16 = "NONE"},
        alt_text = {gui = "NONE", cterm = "NONE", cterm16 = "NONE"},
        warning = {gui = "#F72119", cterm = "NONE", cterm16 = "NONE"},
    },
    sections = {         -- define sections
        {class = 'mode', item = require('hardline.parts.mode').get_item},
        {class = 'high', item = require('hardline.parts.git').get_item, hide = 100},
        {class = 'med', item = require('hardline.parts.filename').get_item},
        '%<',
        {class = 'med', item = '%='},
        {class = 'low', item = require('hardline.parts.wordcount').get_item, hide = 100},
        {class = 'error', item = require('hardline.parts.lsp').get_error},
        {class = 'warning', item = require('hardline.parts.lsp').get_warning},
        {class = 'high', item = require('hardline.parts.filetype').get_item, hide = 80},
        {class = 'mode', item = require('hardline.parts.line').get_item},
        }
}
EOF

" ==================================================
" --------------------IndentLine--------------------
" ==================================================
let g:indentLine_setColors = 1
let g:indentLine_color_gui = '#F72119'
let g:indentLine_bgcolor_gui = '#000000'

" ==================================================
" --------------------Harpoon-----------------------
" ==================================================
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <leader>h :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>j :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>k :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>l :lua require("harpoon.ui").nav_file(4)<CR>


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

let $LC_MESSAGES = 'en_US'

" Source Vim configuration file and install plugins
if has('nvim')
    nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim \| :PackerCompile<CR>
    nnoremap <silent><leader>2 :source ~/.config/nvim/init.vim \| :PlugInstall \| :PackerUpdate<CR>
else
    nnoremap <silent><leader>1 :source ~/.vimrc<CR>
    nnoremap <silent><leader>2 :source ~/.vimrc \| :PlugInstall<CR>
endif
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme cyberpunk
let g:airline_theme='cyberpunk'
set cursorline
let g:cyberpunk_cursorline="default"
" Enable syntax highlighting
syntax enable

" -- Clipboard
set clipboard+=unnamedplus

" -- Reselect pasted text
nnoremap gp `[v`]

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
map <leader>n :noh<CR>

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
" close buffer
map <leader>bd :bd<CR>
map <leader>ba :bufdo bd<CR>

" Foldings
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

set colorcolumn=100

" Tagbar
nnoremap <leader>tb :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_width = 60


" Remaps
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z


" ==================================================
" --------------------Python------------------------
" ==================================================
let python_highlight_all=1
au BufNewFile,BufRead *.py
    \ set expandtab       |" replace tabs with spaces
    \ set autoindent      |" copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4

au BufNewFile,BufRead *.py 
    \ set foldmethod=indent

let g:flake8_show_in_gutter = 1
let g:flake8_show_in_file = 1


" Tests
" make test commands execute using dispatch.vim
let test#strategy = "tslime"
let test#python#runner = "pytest"
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>


" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>

" Debug
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint


" ==================================================
" --------------------GIT---------------------------
" ==================================================
nnoremap <leader>gh :diffget //2<CR>
nnoremap <leader>gl :diffget //3<CR>
nnoremap <leader>gs :G <CR>
" dv for resolve merge conflict

" Shift+D to show diff from status page
set diffopt+=vertical
set mouse=a

" ==================================================
" --------------------FZF---------------------------
" ==================================================
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Ag<Cr>
nnoremap <silent><leader>c :Commits<CR>
nnoremap <silent><leader>gb :GBranches<CR>
let g:fzf_preview_window = ['right:50%']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS='--reverse'

" ==================================================
" --------------------system------------------------
" ==================================================
set mouse=a

" ==================================================
" --------------------tslime------------------------
" ==================================================
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1


" ==================================================
" --------------------GOYO--------------------------
" ==================================================
let g:goyo_width=150
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


" ==================================================
" --------------------nvim-cmp----------------------
" ==================================================
lua << EOF
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
--  completion = {
--    autocomplete = true
--    },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
EOF

" ==================================================
" --------------------nvim-lspconfig----------------
" ==================================================
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local servers = { 'pyright' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']


" ==================================================
" --------------------markdown----------------------
" ==================================================
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
