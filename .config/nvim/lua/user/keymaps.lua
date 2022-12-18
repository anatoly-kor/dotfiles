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


vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", ":noh<CR>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")  -- FIXME DONT WORK

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])  -- COMMENT: change word under cursor in all file

-- GIT --
vim.keymap.set("n", "<leader>gs", ":G<cr>")
vim.keymap.set("n", "<leader>gh", ":diffget //2<cr>")
vim.keymap.set("n", "<leader>gl", ":diffget //3<cr>")
vim.keymap.set("n", "<leader>orpl", ":Octo pr list<cr>")
vim.keymap.set("n", "<leader>b", ":Gitsigns toggle_current_line_blame<CR>")
