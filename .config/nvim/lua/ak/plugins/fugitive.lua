return {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
        vim.keymap.set("n", "<leader>gs", ":G<cr>")
        vim.keymap.set("n", "<leader>gd", ":Gdiff<cr>")
        vim.keymap.set("n", "<leader>gh", ":diffget //2<cr>")
        vim.keymap.set("n", "<leader>gl", ":diffget //3<cr>")
        vim.keymap.set("n", "<leader>cc", ":G commit <CR>")
        vim.keymap.set("n", "<leader>gp", ":G push -u origin <CR>")
        vim.keymap.set("n", "<leader>gP", ":G pull --rebase <CR>")
    end,
}
