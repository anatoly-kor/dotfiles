return {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    dependencies = { "junegunn/fzf" },
    config = function()
        vim.keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "[Q]uickfix list [O]pen" })
        vim.keymap.set("n", "<leader>qc", ":cclose<CR>", { desc = '[Q]uickfix list [C]lose' })
        vim.keymap.set("n", "<leader>qn", "<cmd>cnext<CR>", { desc = '[Q]uickfix list [N]ext' })
        vim.keymap.set("n", "<leader>qp", "<cmd>cprev<CR>", { desc = '[Q]uickfix list [P]revious' })

        require("bqf").setup({
            auto_enable = true,
            auto_resize_height = true, -- highly recommended enable
            preview = {
                win_height = 12,
                win_vheight = 12,
                delay_syntax = 80,
                border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
                show_title = false,
                should_preview_cb = function(bufnr, qwinid)
                    local ret = true
                    local bufname = vim.api.nvim_buf_get_name(bufnr)
                    local fsize = vim.fn.getfsize(bufname)
                    if fsize > 100 * 1024 then
                        -- skip file size greater than 100k
                        ret = false
                    elseif bufname:match("^fugitive://") then
                        -- skip fugitive buffer
                        ret = false
                    end
                    return ret
                end,
            },
            -- make `drop` and `tab drop` to become preferred
            func_map = {
                -- drop = "o",
                -- openc = "O",
                -- split = "<C-s>",
                tabdrop = "<C-t>",
                closeall = "<C-c>",
                -- tabc = "",
                -- ptogglemode = "z,",
            },
            filter = {
                fzf = {
                    action_for = {
                        ["ctrl-s"] = "split",
                        ["ctrl-t"] = "tab drop",
                        ["ctrl-c"] = "tab closeall",
                    },
                    extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                },
            },
        })
    end,
}
