return {
    "folke/trouble.nvim",
    -- cmd = "Trouble",
    -- keys = {
    --     {
    --         "<leader>ll",
    --         "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    --         desc = "LSP Definitions / references / ... (Trouble)",
    --     },
    --     {
    --         "<leader>tl",
    --         "<cmd>Trouble loclist toggle<cr>",
    --         desc = "Location List (Trouble)",
    --     },
    -- },
    config = function()
        vim.keymap.set("n", "<leader>tt", function()
            require("trouble").toggle({
                mode = "diagnostics",
                focus = false,
            })
        end, { desc = "Diagnostics (Trouble)" })
        vim.keymap.set("n", "t]", function()
            require("trouble").next({ skip_groups = true, jump = true })
        end, { desc = "Jump to next (Trouble)" })
        vim.keymap.set("n", "t[", function()
            require("trouble").prev({ skip_groups = true, jump = true })
        end, { desc = "Jump to prev (Trouble)" })

        vim.keymap.set("n", "<leader>ll", function()
            require("trouble").toggle({
                mode = "lsp",
                focus = false,
                win = { position = "right", type = "split" },
            })
        end, { desc = "LSP Definitions / references / ... (Trouble)" })

        vim.keymap.set("n", "<leader>tl", function()
            require("trouble").toggle({
                mode = "diagnostics",
                focus = false,
                filter = { buf = 0 },
            })
        end, { desc = "Diagnostics that file (Trouble)" })
    end,
}
