-- Tests --
vim.keymap.set("n", "t<C-n>", ":TestNearest<cr>")
vim.keymap.set("n", "t<C-f>", ":TestFile<cr>")
-- keymap("n", "t<C-s>", ":TestSuite --failed-first<cr>", opts)
vim.keymap.set("n", "t<C-l>", ":TestLast<cr>")
vim.keymap.set("n", "t<C-g>", ":TestVisit<cr>")
vim.keymap.set("n", "t<C-s>", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>")

vim.g['test#python#runner'] = 'pytest'
vim.g['test#strategy'] = 'tslime'
vim.g['tslime_always_current_window'] = 1
vim.g['tslime_always_current_session'] = 1
