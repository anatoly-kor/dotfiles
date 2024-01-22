require("flow").setup({
    output = {
        buffer = true,
        size = auto, -- possible values: "auto" (default) OR 1-100 (percentage of screen to cover)
        focused = false,
        modifiable = false,
        split_cmd = "20split",

        -- window_override = {
        --   border = 'double',
        --   title = 'Output',
        --   title_pos = 'center',
        --   style = 'minimal',
        --   ...
        -- }
    },

    -- add/override the default command used for a perticular filetype
    -- the "%s" you see in the below example is interpolated by the contents of
    -- the file you are trying to run
    -- Format { <filetype> = <command> }
    -- filetype_cmd_map = {
    --     python = "python3 <<-EOF\n%s\nEOF",
    -- },
})

-- -- optional custom variables
-- require('flow.vars').add_vars({
--     str = "test-val-2",
--     num = 3,
--     bool = true,
--     var_with_func = function()
--         -- the value of this var is computed by running this function at runtime
--         return "test-val"
--     end
-- })

-- vim.api.nvim_set_keymap('v', '<leader>r', ':FlowRunSelected<CR>', {})
-- vim.api.nvim_set_keymap('n', '<leader>rr', ':FlowRunFile<CR>', {})
vim.api.nvim_set_keymap("n", "<leader>rt", ":FlowLauncher<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>rl", ":FlowRunLastCmd<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>rp", ":FlowLastOutput<CR>", {})
