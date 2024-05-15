return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "yioneko/nvim-yati", -- FIXME: check is it usefull indent
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
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

            indent = {
                enable = false,
            },

            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = {
                enable = false,
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                -- `false` will disable the whole extension
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
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
            yati = {
                enable = true,
                -- Disable by languages, see `Supported languages`
                -- disable = { "python" },
                default_lazy = true,
                -- Determine the fallback method used when we cannot calculate indent by tree-sitter
                --   "auto": fallback to vim auto indent
                --   "asis": use current indent as-is
                --   "cindent": see `:h cindent()`
                -- Or a custom function return the final indent result.
                default_fallback = "auto",
            },
        })
    end,
}
