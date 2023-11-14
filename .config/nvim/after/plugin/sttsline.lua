require("sttusline").setup({
    -- statusline_color = "#000000",
    statusline_color = "nordic",

    -- | 1 | 2 | 3
    -- recommended: 3
    laststatus = 3,
    disabled = {
        filetypes = {
            -- "NvimTree",
            -- "lazy",
        },
        buftypes = {
            -- "terminal",
        },
    },
    components = {
        "mode",
        "filename",
        "%=",
        "git-branch",
        "git-diff",
        "diagnostics",
        -- "lsps-formatters",
        "pos-cursor",
    },
})
