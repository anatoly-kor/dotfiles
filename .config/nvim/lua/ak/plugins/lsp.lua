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
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("luasnip/loaders/from_vscode").lazy_load()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "bashls",
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
            },
        })

        local signs = { Error = " ", Warn = " ", Hint = "⭘ ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local luasnip = require("luasnip")

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), -- INFO: Select
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-y>"] = cmp.mapping.complete(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.abort(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                -- { name = "luasnip" },
                -- { name = "cmp_nvim_lsp" },
                -- { name = "nvim-cmp" },
                -- { name = "nvim_lua" },
                { name = "path" },
                { name = "pyright" },
            }, { name = "buffer" }),
            sorting = {
                comparators = {
                    cmp.config.compare.recently_used,
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            },
            formatting = {
                format = require("lspkind").cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    menu = {
                        buffer = "[buf]",
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[api]",
                        path = "[path]",
                        luasnip = "[snip]",
                    },
                }),
            },
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })

        vim.diagnostic.config({
            virtual_text = false,
            underline = true,
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
