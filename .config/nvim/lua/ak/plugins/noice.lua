-- TODO: configure me
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        -- Either disable the other plugin or set `config.lsp.signature.enabled = false` in your **Noice** config.
        local noice = require("noice")

        noice.setup({
            routes = {
                {
                    -- show @recording messages
                    view = "cmdline",
                    filter = { event = "msg_showmode" },
                },
                {
                    -- Ignore certain lsp servers for progress messages
                    filter = {
                        event = "lsp",
                        kind = "progress",
                        cond = function(message)
                            local client = vim.tbl_get(message.opts, "progress", "client")
                            return client == "lua_ls"
                        end,
                    },
                    opts = { skip = true },
                },
                {
                    -- hide written messages
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "written",
                    },
                    opts = { skip = true },
                },
                {
                    -- always route any messages with more than N lines to the split view
                    view = "split",
                    filter = { event = "msg_show", min_height = 10 },
                    opts = {},
                },
                {
                    -- always route any messages with more than N lines to the split view
                    view = "split",
                    filter = { event = "notify", min_height = 10 },
                    opts = {},
                },
                {
                    -- route to mini Already up to date msg
                    view = "mini",
                    filter = {
                        event = "msg_show",
                        find = "Already up",
                    },
                },
                {
                    -- route to split git merge branch message
                    view = "split",
                    filter = {
                        event = "msg_show",
                        find = "remote: To create a merge request for",
                    },
                },
            },
            presets = {
                bottom_search = false,        -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true,        -- add a border to hover docs and signature help
            },
            -- views = {
            --     notify = {
            --         merge = true,
            --     },
            -- },
            lsp = {
                progress = {
                    enabled = true,
                    format = "lsp_progress",
                    format_done = "lps_progress_done",
                    throttle = 1000 / 30,
                    view = "mini",
                },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                signature = { enabled = false },
            },
        })
    end,
}
