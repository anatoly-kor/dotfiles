vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Insert --
-- Press jk fast to enter
vim.keymap.set("i", "jk", "<ESC>")

-- Navigate buffers
vim.keymap.set("n", "<C-l>", ":bnext<CR>")
vim.keymap.set("n", "<C-h>", ":bprevious<CR>")

-- Buffers --
vim.keymap.set("n", "<leader>bd", ":bd<cr>")
vim.keymap.set("n", "<leader>ba", ":bufdo bd<cr>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Stay in indent mode for visual
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "gp", "`[v`]")

-- vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "J", ":lua require('treesj').toggle()<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", ":noh<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- COMMENT: change word under cursor in all file

-- GIT --
-- vim.keymap.set("n", "<leader>gs", ":G<cr>")
vim.keymap.set("n", "<leader>gs", ":Neogit kind=split<cr>")
vim.keymap.set("n", "<leader>gd", ":Gdiff<cr>")
vim.keymap.set("n", "<leader>gh", ":diffget //2<cr>")
vim.keymap.set("n", "<leader>gl", ":diffget //3<cr>")
vim.keymap.set("n", "<leader>orpl", ":Octo pr list<cr>")
-- vim.keymap.set("n", "<leader>cc", ":G commit <CR>")
-- vim.keymap.set("n", "<leader>cc", ":Neogit commit <CR>")
vim.keymap.set("n", "<leader>p", ":G push -u origin <CR>")

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
