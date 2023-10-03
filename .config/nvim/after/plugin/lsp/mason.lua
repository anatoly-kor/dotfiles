require("mason").setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "bashls",
        "dockerls",
    },
    automatic_installation = true,
})

require("mason-null-ls").setup({
    -- list of formatters & linters for mason to install
    ensure_installed = {
        "lua_ls",
        "bashls",
        "dockerls",

        "flake8",
        "isort",
        "pyright",
        "mypy",
        "stylua",
        "jq",

        "debugpy",
    },
    -- auto-install configured formatters & linters (with null-ls)
    automatic_installation = true,
})
