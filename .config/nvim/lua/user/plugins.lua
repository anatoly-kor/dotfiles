local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

local plugins = {
    "nvim-lua/plenary.nvim",

    -- Colorschemes
    "rose-pine/neovim",
    "AlexvZyl/nordic.nvim",
    { "Yazeed1s/oh-lucy.nvim", priority = 1000 },
    { "kyazdani42/nvim-web-devicons" },

    -- Treesitter(syntax highlighting)
    { "nvim-treesitter/nvim-treesitter" },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },

    -- Navigation
    "ThePrimeagen/harpoon",
    {
        "kyazdani42/nvim-tree.lua",
        tag = "nightly",
    },
    "nvim-telescope/telescope.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "debugloop/telescope-undo.nvim",

    -- GIT
    "tpope/vim-fugitive",
    { "mbbill/undotree", event = "VeryLazy" },
    "pwntester/octo.nvim",
    "f-person/git-blame.nvim",
    "sindrets/diffview.nvim", -- CONFIGURE ME

    -- Bufferline
    "ojroques/nvim-hardline",

    -- UI
    "startup-nvim/startup.nvim",
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
    { "stevearc/dressing.nvim", event = "VeryLazy" },

    -- Code
    "tpope/vim-commentary",
    "tpope/vim-surround", -- FIXME: check for configure. s is braking
    "editorconfig/editorconfig-vim",
    "Vimjas/vim-python-pep8-indent",
    "puremourning/vimspector",
    -- {
    --     "mfussenegger/nvim-dap-python",
    --     dependencies = { "mfussenegger/nvim-dap" },
    -- },
    -- {
    --     "rcarriga/nvim-dap-ui",
    --     dependencies = { "mfussenegger/nvim-dap" },
    -- },
    "vim-test/vim-test",
    "jgdavey/tslime.vim",
    "lukas-reineke/indent-blankline.nvim",
    "m4xshen/smartcolumn.nvim",
    "andythigpen/nvim-coverage",
    "Wansmer/treesj",
    {
        "kevinhwang91/nvim-bqf",
        dependencies = {
            "junegunn/fzf",
        },
    },

    -- cmp
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            -- snippets
            "L3MON4D3/LuaSnip", -- snippet engine
            "saadparwaiz1/cmp_luasnip", -- for autocompletion
        },
    },

    -- lsp
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "onsails/lspkind.nvim", -- vs-code like icons for autocompletion
    "ray-x/lsp_signature.nvim",

    -- formatting and linting
    "jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
    "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
    "windwp/nvim-autopairs", -- autoclose parens brackets, quotes, etc...

    -- remote development
    -- use("chipsenkbeil/distant.nvim")

    -- cheatsheet
    { "sudormrfbin/cheatsheet.nvim", event = "VeryLazy" },
}
require("lazy").setup(plugins, opts)
