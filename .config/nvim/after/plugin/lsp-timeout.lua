vim.g.lspTimeoutConfig = {
    stopTimeout = 1000 * 60 * 5, -- ms, timeout before stopping all LSPs
    startTimeout = 1000 * 10, -- ms, timeout before restart
    silent = false,
    filetypes = {
        ignore = {
            ".py",
        },
    },
}
