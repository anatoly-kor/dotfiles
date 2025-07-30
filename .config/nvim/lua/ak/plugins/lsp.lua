return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "python-lsp/pylsp-mypy",
        "j-hui/fidget.nvim",
    },
    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        require("fidget").setup()
        require("mason").setup()

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
            end, { desc = "Find [R]eferences" })
            keymap.set("n", "<leader>vrn", function()
                vim.lsp.buf.rename()
            end, { desc = "[V]isual [R]e[N]ame" })
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

        local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

        local servers_to_install = {
            "lua_ls",
            "pylsp",
            "bashls",
            "ruff",
            "pyright"
        }

        require("mason-lspconfig").setup({
            ensure_installed = servers_to_install,
            automatic_installation = false,
        })

        local server_configs = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim", "it", "describe", "before_each", "after_each" },
                        },
                    },
                },
            },
            pylsp = {
                settings = {
                    pylsp = {
                        plugins = {
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
                                enabled = true, -- Ensure mypy plugin is enabled
                                live_mode = true,
                                report_progress = true,
                                dmypy = true,
                            },
                            isort = { enabled = true },
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
            },
            pyright = {
                settings = {
                    pyright = {
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            ignore = { "*" },
                        },
                    },
                },
            },
            bashls = {},
            ruff = {},
        }

        for _, server_name in ipairs(servers_to_install) do
            vim.lsp.enable(server_name)
            local server_specific_opts = server_configs[server_name] or {}
            local final_opts = vim.tbl_deep_extend("force", {
                on_attach = on_attach,
                capabilities = capabilities,
            }, server_specific_opts)
            vim.lsp.config(server_name, final_opts)
        end

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

        vim.diagnostic.enable(true)
    end
}
