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
    -- "rose-pine/neovim",
    -- "AlexvZyl/nordic.nvim",
    -- { "Yazeed1s/oh-lucy.nvim", priority = 1000 },
    { "navarasu/onedark.nvim", priority = 1000 },
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
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "debugloop/telescope-undo.nvim", event = "VeryLazy" },
    { "rmagatti/goto-preview", event = "VeryLazy" },

    -- GIT
    { "tpope/vim-fugitive", event = "VeryLazy" },
    -- "pwntester/octo.nvim",
    { "f-person/git-blame.nvim", event = "VeryLazy" }, -- FIXME: find replace for open url
    { "sindrets/diffview.nvim", event = "VeryLazy" }, -- CONFIGURE ME

    -- Bufferline
    -- "ojroques/nvim-hardline",
    "sontungexpt/sttusline",
    { "willothy/nvim-cokeline", config = true },

    -- UI
    "startup-nvim/startup.nvim",
    {
        "folke/noice.nvim", -- FIXME: CONFIGURE ME
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
    { "stevearc/dressing.nvim", event = "VeryLazy" },

    -- Code
    { "tpope/vim-commentary" },
    { "tpope/vim-surround", event = "VeryLazy" }, -- FIXME: check for configure. s is braking
    { "editorconfig/editorconfig-vim", event = "VeryLazy" },
    -- "Vimjas/vim-python-pep8-indent",  -- FIXME: Is it usefull?
    -- "puremourning/vimspector",
    -- {
    --     "mfussenegger/nvim-dap-python",
    --     dependencies = { "mfussenegger/nvim-dap" },
    -- },
    -- {
    --     "rcarriga/nvim-dap-ui",
    --     dependencies = { "mfussenegger/nvim-dap" },
    -- },
    { "vim-test/vim-test", event = "VeryLazy" },
    { "jgdavey/tslime.vim", event = "VeryLazy" },
    -- "lukas-reineke/indent-blankline.nvim",
    { "vidocqh/auto-indent.nvim", event = "InsertEnter" },
    { "m4xshen/smartcolumn.nvim", event = "VeryLazy" },
    { "Wansmer/treesj", event = "VeryLazy" },
    { "kevinhwang91/nvim-bqf", event = "VeryLazy", dependencies = { "junegunn/fzf" } },
    { "echasnovski/mini.cursorword", version = "*", event = "VeryLazy" },
    { "simrat39/symbols-outline.nvim", event = "VeryLazy" },
    { "arjunmahishi/flow.nvim", event = "VeryLazy" },

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
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    "neovim/nvim-lspconfig", -- RECONFIGURE ME
    "hrsh7th/cmp-nvim-lsp",
    { "onsails/lspkind.nvim", event = "VeryLazy" }, -- vs-code like icons for autocompletion
    { "ray-x/lsp_signature.nvim", event = "VeryLazy" },

    -- formatting and linting
    "nvimtools/none-ls.nvim",
    "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
    { "windwp/nvim-autopairs", event = "VeryLazy" }, -- autoclose parens brackets, quotes, etc...

    -- remote development
    -- use("chipsenkbeil/distant.nvim")

    -- cheatsheet
    { "sudormrfbin/cheatsheet.nvim", event = "VeryLazy" },
}
require("lazy").setup(plugins, opts)
