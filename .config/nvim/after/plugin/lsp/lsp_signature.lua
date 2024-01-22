-- require("lsp_signature").setup({
--     bind = true, -- This is mandatory, otherwise border config won't get registered.
--     handler_opts = {
--         border = "rounded",
--     },
--     floating_window = true,
--     fix_pos = true,
--     hint_enable = true,
-- })

-- vim.keymap.set("n", "K", function()
--     require("lsp_signature").toggle_float_win()
-- end, { silent = true, noremap = true, desc = "toggle signature" })

-- vim.keymap.set({ "n" }, "<C-k>", function()
--     vim.lsp.buf.signature_help()
-- end, { silent = true, noremap = true, desc = "toggle signature" })
