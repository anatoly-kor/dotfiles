local setup, null_ls = pcall(require, "null-ls")
if not setup then
    return
end

local async_formatting = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    vim.lsp.buf_request(bufnr, "textDocument/formatting", vim.lsp.util.make_formatting_params({}),
        function(err, res, ctx)
            if err then
                local err_msg = type(err) == "string" and err or err.message
                -- you can modify the log message / level (or ignore it completely)
                vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
                return
            end

            -- don't apply results if buffer is unloaded or has been modified
            if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
                return
            end

            if res then
                local client = vim.lsp.get_client_by_id(ctx.client_id)
                vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
                vim.api.nvim_buf_call(bufnr, function()
                    vim.cmd("silent noautocmd update")
                end)
            end
        end)
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- null_ls.setup.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        formatting.stylua, -- lua formatter
        formatting.isort.with({
            extra_args = {
                "--up",
                "-m=3",
                -- "--fgw=2",
                "--tc",
            },
        }),
        formatting.fixjson,
        formatting.docformatter,
        diagnostics.autoflake,
        -- FIXME: Как читать конфиг .flake8 если тот существует?
        -- diagnostics.flake8.with({
        --     prefer_local = true,
        --     extra_args = {
        --         "--max-line-length=119",
        --     },
        -- }),
        diagnostics.mypy,
        -- diagnostics.pylama.with({
        --     extra_args = {
        --         "--max-line-length=119",
        --     },
        -- }),
        diagnostics.flake8,
        diagnostics.pylama,
        code_actions.git,
        code_actions.refactoring,
    },
    debug = false,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePost", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    async_formatting(bufnr)
                end,
            })
        end
    end,
})
