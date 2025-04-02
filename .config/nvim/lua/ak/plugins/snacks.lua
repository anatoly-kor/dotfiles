return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        indent = { enabled = true },
        input = { enabled = false },
        picker = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        lazygit = { enabled = true },
        terminal = { enabled = false },
        toggle = { enabled = false },
    },
    keys = {
        {
            "<leader>g",
            function()
                Snacks.lazygit()
            end,
            desc = "Open lazy[g]it",
        },
    },
}
