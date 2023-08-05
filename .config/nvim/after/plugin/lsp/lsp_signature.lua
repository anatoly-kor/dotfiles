require("lsp_signature").setup({
    bind = false, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded",
    },
    floating_window = true,
    fix_pos = true,
    hint_enable = false,
})
