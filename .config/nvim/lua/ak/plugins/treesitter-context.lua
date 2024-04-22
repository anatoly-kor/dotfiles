return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        -- build = ":TSUpdate",
    },
    config = function()
        require("treesitter-context").setup({
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers = true,
            trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
            multiline_threshold = 20, -- Maximum number of lines to show for a single context
            -- patterns = {              -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            --     -- For all filetypes
            --     -- Note that setting an entry here replaces all other patterns for this entry.
            --     -- By setting the 'default' entry below, you can control which nodes you want to
            --     -- appear in the context window.
            --     default = {
            --         "class",
            --         "function",
            --         "method",
            --         "conditions",
            --     },
            --     -- Patterns for specific filetypes
            --     -- If a pattern is missing, *open a PR* so everyone can benefit.
            --     markdown = {
            --         "section",
            --     },
            --     json = {
            --         "pair",
            --     },
            --     yaml = {
            --         "block_mapping_pair",
            --     },
            -- },

            -- [!] The options below are exposed but shouldn't require your attention,
            --     you can safely ignore them.
            zindex = 20, -- The Z-index of the context window
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = nil,
            on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        })
    end,
}
