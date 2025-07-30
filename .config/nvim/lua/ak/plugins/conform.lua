return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "ruff_fix" },
            },
            formatters = {
                ruff_fix = {
                    command = "ruff",
                    args = { "check", "--select", "F401", "--fix", "--stdin-filename", "$FILENAME", "-" },
                    stdin = true,
                },
                isort = {
                    command = "isort",
                    args = {
                        "--line-length",
                        "120",
                        "--up",
                        "-m=3",
                        "--tc",
                        "--quiet",
                        "-",
                    },
                },
            },
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })
    end,
}
