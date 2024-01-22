require("nvim-treesitter.configs").setup({
    -- parser_install_dir = "/Users/a.korobov/.local/share/nvim/parsers/",
    -- A list of parser names, or "all"
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        -- "help",
        "regex",
        "json",
        "yaml",
        "gitignore",
        "python",
        "markdown",
        "markdown_inline",
        "bash",
        "comment",
        "dockerfile",
        "gitcommit",
    },

    indent = { enable = true },

    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = { enable = true },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gis",
            node_incremental = "gin",
            scope_incremental = "gsi",
            node_decremental = "gdn",
        },
    },
})
