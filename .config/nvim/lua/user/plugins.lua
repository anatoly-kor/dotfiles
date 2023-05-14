-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim")

    -- Colorschemes
    use({ "rose-pine/neovim" })
    use({ "AlexvZyl/nordic.nvim" })
    use({ "Yazeed1s/oh-lucy.nvim" })

    -- Treesitter(syntax highlighting)
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ "nvim-treesitter/nvim-treesitter-context" })
    use({ "nvim-treesitter/nvim-treesitter-textobjects" })

    -- Navigation
    use({ "ThePrimeagen/harpoon" })
    use({
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        tag = "nightly",
    })
    -- {
    -- 	"nvim-telescope/telescope-fzf-native.nvim"
    -- 	build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    -- }
    use("nvim-telescope/telescope.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- GIT
    use({ "tpope/vim-fugitive" })
    use({ "mbbill/undotree" })
    use({ "lewis6991/gitsigns.nvim" })
    use({ "pwntester/octo.nvim" })
    use({ "f-person/git-blame.nvim" })

    -- Bufferline
    use("ojroques/nvim-hardline")

    -- Dashboard
    use("glepnir/dashboard-nvim")

    -- Code
    use({ "tpope/vim-commentary" })
    use({ "tpope/vim-surround" }) -- FIXME: check for configure. s is braking
    use({ "editorconfig/editorconfig-vim" })
    use({ "Vimjas/vim-python-pep8-indent" })
    use({ "puremourning/vimspector" })
    use({ "vim-test/vim-test" })
    use({ "jgdavey/tslime.vim" })
    use({ "lukas-reineke/indent-blankline.nvim" })
    use({ "m4xshen/smartcolumn.nvim" })
    use({ "andythigpen/nvim-coverage" })
    use({ "Wansmer/treesj" })
    use({ "kevinhwang91/nvim-bqf", run = ":TSUpdate" })

    -- cmp
    use({ "hrsh7th/nvim-cmp" })
    use({ "hrsh7th/cmp-buffer" })
    use({ "hrsh7th/cmp-path" })
    use({ "hrsh7th/cmp-nvim-lua" })

    -- snippets
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion

    -- lsp
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })

    use({ "neovim/nvim-lspconfig" })
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
    use({ "ray-x/lsp_signature.nvim" })

    -- formatting and linting
    use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
    use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
    use("windwp/nvim-autopairs") -- autoclose parens brackets, quotes, etc...

    -- remote development
    -- use("chipsenkbeil/distant.nvim")

    -- cheatsheet
    use({ "sudormrfbin/cheatsheet.nvim" })
end)
