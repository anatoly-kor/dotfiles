return {
    "arjunmahishi/flow.nvim",
    event = "VeryLazy",
    config = function()
        require("flow").setup({
            output = {
                buffer = true,
                size = "auto",
                focused = false,
                modifiable = false,
                split_cmd = "20split",
            },
        })

        vim.api.nvim_set_keymap("n", "<leader>rt", ":FlowLauncher<CR>", {})
        vim.api.nvim_set_keymap("n", "<leader>rl", ":FlowRunLastCmd<CR>", {})
        vim.api.nvim_set_keymap("n", "<leader>rp", ":FlowLastOutput<CR>", {})
    end,
}
