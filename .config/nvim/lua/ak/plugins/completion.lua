return {
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "hrsh7th/nvim-cmp",
        },
        version = "v0.*",
        opts = {
            keymap = {
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
                ["<C-y>"] = {
                    function(cmp)
                        cmp.show({ providers = { "snippets" } })
                    end,
                },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                ["<CR>"] = {
                    function(cmp)
                        if cmp.snippet_active() then
                            return cmp.accept()
                        else
                            return cmp.select_and_accept()
                        end
                    end,
                    "snippet_forward",
                    "fallback",
                },
                ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
            },
            cmdline = {
                keymap = {
                    ["<Tab>"] = { "select_next", "fallback" },
                    ["<S-Tab>"] = { "select_prev", "fallback" },
                    ["<C-y>"] = { "accept", "fallback" },
                    ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
                },
            },

            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                },
                accept = { auto_brackets = { enabled = true } },
                menu = {
                    auto_show = true,
                },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "buffer", "snippets" },
                per_filetype = {
                    sql = { 'dadbod' },
                    lua = {
                        inherit_defaults = true,
                        -- 'lazydev',
                    }
                },
                providers = {
                    dadbod = { module = "vim_dadbod_completion.blink" },
                }
            },

            signature = { enabled = true },
        },
        -- opts_extend = { "sources.default" },
    },
}
