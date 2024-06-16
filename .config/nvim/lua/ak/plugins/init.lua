return {
    "nvim-lua/plenary.nvim",

    { "kyazdani42/nvim-web-devicons" },

    { "tpope/vim-commentary" },
    { "tpope/vim-surround", event = "VeryLazy" },
    { "editorconfig/editorconfig-vim", event = "VeryLazy" },

    {
        "echasnovski/mini.cursorword",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("mini.cursorword").setup()
        end,
    },
    {
        "simrat39/symbols-outline.nvim",
        event = "VeryLazy",
        config = function()
            require("symbols-outline").setup()
            vim.keymap.set("n", "<leader>ol", "<cmd>SymbolsOutline<CR>", { desc = "[O]pen Out[L]ine" })
        end,
    },
}
