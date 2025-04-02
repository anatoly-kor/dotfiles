local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    local keymap = vim.keymap
    keymap.set("n", "gD", function()
        vim.lsp.buf.declaration()
    end, opts)
    keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, opts)
    keymap.set("n", "<leader>t", function()
        vim.diagnostic.open_float()
    end, opts)
    keymap.set("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
    end, opts)
    keymap.set("n", "<leader>r", function()
        vim.lsp.buf.references()
    end, { desc = "Find [R]eferences" }, opts)
    keymap.set("n", "<leader>vrn", function()
        vim.lsp.buf.rename()
    end, { desc = "[V]isual [R]e[N]ame" }, opts)
    keymap.set("i", "<C-h>", function()
        vim.lsp.buf.signature_help()
    end, opts)
    keymap.set("n", "<leader>el", function()
        vim.diagnostic.setloclist()
    end, opts)
    keymap.set("n", "[d", function()
        vim.diagnostic.goto_prev()
    end, opts)
    keymap.set("n", "]d", function()
        vim.diagnostic.goto_next()
    end, opts)
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- "jayp0521/mason-null-ls.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "python-lsp/pylsp-mypy",
        -- "hrsh7th/cmp-buffer",
        -- "hrsh7th/cmp-path",
        -- "hrsh7th/cmp-cmdline",
        -- "hrsh7th/nvim-cmp",
        -- "L3MON4D3/LuaSnip",
        -- "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        -- "onsails/lspkind.nvim",
    },
    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "pylsp",
                "bashls",
                "ruff",
            },

            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                    })
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")

                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                },
                            },
                        },
                    })
                end,

                ["pylsp"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.pylsp.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            pylsp = {
                                plugins = {
                                    -- configurationSources = { "flake8" },
                                    configurationSources = { "ruff" },
                                    flake8 = { enabled = false },

                                    autopep8 = { enabled = false },
                                    mccabe = { enabled = false },
                                    preload = { enabled = false },
                                    pycodestyle = { enabled = false },
                                    pydocstyle = { enabled = false },
                                    pyflakes = { enabled = false },
                                    pylint = { enabled = false },
                                    yapf = { enabled = false },
                                    rope_auto_import = { enabled = false, memory = false },
                                    rope_completion = { enabled = false, eager = false },
                                    pylsp_mypy = {
                                        live_mode = true,
                                        report_progress = true,
                                        dmypy = true,
                                    },

                                    isort = { enabled = false },
                                    black = { enabled = false, cache_config = false },
                                    ruff = { enabled = true },

                                    jedi_hover = { enabled = false },
                                    jedi_signature_help = { enabled = false },
                                    jedi_references = { enabled = false },
                                    jedi_symbols = { enabled = false },
                                    jedi_definition = {
                                        enabled = false,
                                        follow_imports = false,
                                        follow_builtin_imports = false,
                                        follow_builtin_definitions = false,
                                    },
                                    jedi_completion = {
                                        enabled = false,
                                        include_params = false,
                                        include_class_objects = false,
                                        include_function_objects = false,
                                        fuzzy = false,
                                        eager = false,
                                        cache_for = {
                                            "pandas",
                                            "numpy",
                                            "tensorflow",
                                            "matplotlib",
                                            "pydantic",
                                            "fastapi",
                                            "flask",
                                            "sqlalchemy",
                                        },
                                    },
                                },
                            },
                        },
                    })
                end,

                ["ruff"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.ruff.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                    })
                end,

                ["pyright"] = function()
                    local lspconfig = require("lspconfig")

                    lspconfig.pyright.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            pyright = {
                                disableOrganizeImports = true,
                            },
                            python = {
                                analysis = {
                                    ignore = { "*" }, --COMMENT: Игнорим все ошибки от pyright, посмотрим насколько реально так жить
                                },
                            },
                        },
                    })
                end,
            },
        })

        local signs = { Error = " ", Warn = " ", Hint = "⭘ ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        vim.diagnostic.config({
            virtual_text = false,
            underline = false,
            update_in_insert = true,
            severity_sort = false,
            float = {
                focusable = false,
                style = "full",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
