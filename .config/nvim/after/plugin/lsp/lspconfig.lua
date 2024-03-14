local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local keymap = vim.keymap -- for conciseness

vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
    float = {
        focusable = false,
        style = "full",
        source = "always",
        header = "",
        prefix = "",
    },
})

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
    -- keybind options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
    -- keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
    -- keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
    -- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
    -- keymap.set("n", "<leader>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    keymap.set("n", "<leader>t", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) -- show diagnostics for cursor
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
    keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap.set("n", "<leader>o", "<cmd>SymbolsOutline<CR>", opts) -- see outline on right hand side
end

-- used to enable autocompletion (assign to every lsp server config)
-- local capabilities = cmp_nvim_lsp.default_capabilities()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
        Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})

lspconfig["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- → pylsp.configurationSources                                default: ["pycodestyle"]
-- → pylsp.plugins.autopep8.enabled                            default: true
-- → pylsp.plugins.flake8.config
-- → pylsp.plugins.flake8.enabled                              default: false
-- → pylsp.plugins.flake8.exclude                              default: []
-- → pylsp.plugins.flake8.executable                           default: "flake8"
-- → pylsp.plugins.flake8.filename
-- → pylsp.plugins.flake8.hangClosing
-- → pylsp.plugins.flake8.ignore                               default: []
-- → pylsp.plugins.flake8.indentSize
-- → pylsp.plugins.flake8.maxComplexity
-- → pylsp.plugins.flake8.maxLineLength
-- → pylsp.plugins.flake8.perFileIgnores                       default: []
-- → pylsp.plugins.flake8.select
-- lspconfig["pylsp"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     settings = {
--         pylsp = {
--             configurationSources = { 'flake8' },
--             plugins = {
--                 flake8 = {
--                     config = '.flake8',
--                     enabed = true,
--                     maxLineLength = 119,
--                 },
--                 pycodestyle = {
--                     enabled = false,
--                     -- maxLineLength = 119,
--                 },
--             },
--         },
--     },
-- })

lspconfig["dockerls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["bashls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
