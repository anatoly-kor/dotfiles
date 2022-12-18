vim.cmd.packadd('packer.nvim')

vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "nvim-lua/plenary.nvim"

    -- Colorschemes
    use({ 'rose-pine/neovim' })

    -- Treesitter(syntax highlighting)
    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use 'nvim-treesitter/nvim-treesitter-context'

    -- Navigation
    use "ThePrimeagen/harpoon"
    use { 
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons'
        },
    }
    use "nvim-telescope/telescope.nvim"
    -- use "ja-ford/delaytrain.nvim"  -- COMMENT: Надоело
    use "ggandor/leap.nvim"

    -- GIT
    use('tpope/vim-fugitive')
    use('mbbill/undotree')
    use "lewis6991/gitsigns.nvim"
    use 'pwntester/octo.nvim'

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- {'hrsh7th/cmp-nvim-lsp-signature-help'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            -- {'tzachar/cmp-tabnine', run='./install.sh'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- Bufferline
    use 'ojroques/nvim-hardline' -- bufferline and statusline

    -- Dashboard
    use 'glepnir/dashboard-nvim'

    -- Code
    use "tpope/vim-commentary"
    use "tpope/vim-surround"
    use "editorconfig/editorconfig-vim"
    use 'Vimjas/vim-python-pep8-indent'
    use 'puremourning/vimspector'
    use 'vim-test/vim-test'
    use 'jgdavey/tslime.vim'
    use 'lukas-reineke/indent-blankline.nvim'

end)

