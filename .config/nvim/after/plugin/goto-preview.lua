require("goto-preview").setup({})

vim.keymap.set("n", "gd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")
vim.keymap.set("n", "gr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>")
