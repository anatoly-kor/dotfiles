return {
    "vim-test/vim-test",
    event = "VeryLazy",
    dependencies = {
        "jgdavey/tslime.vim",
    },
    config = function()
        vim.keymap.set("n", "t<C-n>", ":TestNearest<cr>")
        vim.keymap.set("n", "t<C-f>", ":TestFile<cr>")
        vim.keymap.set("n", "t<C-l>", ":TestLast<cr>")
        vim.keymap.set("n", "t<C-v>", ":TestLast -vvv<cr>")
        -- vim.keymap.set("n", "t<C-g>", ":TestVisit<cr>")
        vim.keymap.set("n", "t<C-s>", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>")

        vim.g["test#python#runner"] = "pytest"
        vim.g["test#python#pytest#options"] = "--failed-first --showlocals --tb=long"
        -- FIXME: Если нет разделения окна, то запустить в всплывающем окне в центре экрана или просто внизу
        vim.g["test#strategy"] = "tslime"
        vim.g["tslime_always_current_session"] = 1
    end,
}
