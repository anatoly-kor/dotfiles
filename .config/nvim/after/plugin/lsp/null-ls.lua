local setup, null_ls = pcall(require, "null-ls")
if not setup then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
-- local spell = null_ls.builtins.completion

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local defaults = {
    border = nil,
    cmd = { "nvim" },
    debounce = 250,
    debug = false,
    default_timeout = 5000,
    diagnostic_config = {},
    diagnostics_format = "#{m}",
    fallback_severity = vim.diagnostic.severity.ERROR,
    log_level = "warn",
    notify_format = "[null-ls] %s",
    on_attach = nil,
    on_init = nil,
    on_exit = nil,
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
    should_attach = nil,
    -- sources = nil,
    temp_dir = nil,
    update_in_insert = false,
}

-- configure null_ls
null_ls.setup({
    defaults = defaults,
    sources = {
        formatting.stylua, -- lua formatter
        formatting.isort.with({
            extra_args = {
                "--use-parentheses=True",
            },
        }),
        formatting.fixjson,
        diagnostics.flake8.with({
            extra_args = {
                "--max-line-length",
                109,
            },
        }),
        diagnostics.mypy,
        code_actions.git,
        code_actions.refactoring,
    },
    -- configure format on save
    on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        filter = function(client)
                            --  only use null-ls for formatting instead of lsp server
                            return client.name == "null-ls"
                        end,
                        bufnr = bufnr,
                    })
                end,
            })
        end
    end,
})
