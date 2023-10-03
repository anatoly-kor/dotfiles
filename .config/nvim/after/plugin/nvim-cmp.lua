local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
    completion = {
        completeopt = "menu,menuone,preview,noselect", -- ADDED last
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<Tab>"] = cmp.mapping.select_next_item(),   -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),      -- FIXME: is it works?
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),       -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(),              -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    -- sources for autocompletion
    sources = cmp.config.sources({
        { name = "buffer" },   -- text within current buffer
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" },  -- snippets
        { name = "cmp_nvim_lsp" },
        { name = "nvim-cmp" },
        { name = "nvim_lua" },
        { name = "path" }, -- file system paths
    }),
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "text", -- show only symbol annotations
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
})
