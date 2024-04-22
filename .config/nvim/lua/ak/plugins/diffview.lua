return {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
        vim.keymap.set("n", "<leader>dvf", ":DiffviewFileHistory %<CR>", { desc = "[D]iff[V]iew [F]ile History" })
        vim.keymap.set("n", "<leader>dvc", ":DiffviewClose<CR>", { desc = "[D]iff[V]iew [C]lose" })
    end,
}
