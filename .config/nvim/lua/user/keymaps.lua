local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>n", ":noh<CR>", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<C-j>", "<Esc>:m .+1<CR>==gi", opts) -- FIXME
keymap("n", "<C-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", "gp", "`[v`]", opts)


-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


-- Harpoon --
keymap('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>', opts)
keymap('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)

keymap('n', '<leader>h', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
keymap('n', '<leader>j', ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
keymap('n', '<leader>k', ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
keymap('n', '<leader>l', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)


-- Telescope --
keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<C-g>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>c", "<cmd>Telescope git_commits<cr>", opts)
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)


-- Buffers --
keymap("n", "<leader>bd", ":bd<cr>", opts)
keymap("n", "<leader>ba", ":bufdo bd<cr>", opts)

-- GIT --
keymap("n", "<leader>gs", ":G<cr>", opts)
keymap("n", "<leader>gh", ":diffget //2<cr>", opts)
keymap("n", "<leader>gl", ":diffget //3<cr>", opts)
keymap("n", "<leader>orpl", ":Octo pr list<cr>", opts)
keymap("n", "<leader>b", ":Gitsigns toggle_current_line_blame<CR>", opts)


-- Debug --
-- FIXME: Настроить нормально позже
keymap("n", "<leader>dd", ":call vimspector#Launch()<CR>", opts)
keymap("n", "<leader>dx", ":VimspectorReset<CR>", opts)
keymap("n", "<leader>de", ":VimspectorEval<CR>", opts)
keymap("n", "<leader>dw", ":VimspectorWatch<CR>", opts)
keymap("n", "<leader>do", ":VimspectorShowOutput<CR>", opts)

keymap("n", "<leader>dl", "<Plug>VimspectorStepInto", opts)
keymap("n", "<leader>dj", "<Plug>VimspectorStepOver", opts)
keymap("n", "<leader>dk", "<Plug>VimspectorStepOut", opts)
keymap("n", "<leader>d_", "<Plug>VimspectorRestart", opts)
keymap("n", "<leader>dc", ":call vimspector#Continue()<CR>", opts)

keymap("n", "<leader>drc", "<Plug>VimspectorRunToCursor", opts)
keymap("n", "<leader>dbp", "<Plug>VimspectorToggleBreakpoint", opts)
keymap("n", "<leader>dcbp", "<Plug>VimspectorToggleConditionalBreakpoint", opts)

-- Tests --
keymap("n", "t<C-n>", ":TestNearest<cr>", opts)
keymap("n", "t<C-f>", ":TestFile<cr>", opts)
-- keymap("n", "t<C-s>", ":TestSuite --failed-first<cr>", opts)
keymap("n", "t<C-l>", ":TestLast<cr>", opts)
keymap("n", "t<C-g>", ":TestVisit<cr>", opts)
keymap("n", "t<C-s>", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts)

-- Twilight -- 
keymap("n", "<leader>tl", ":Twilight<CR>", opts)
