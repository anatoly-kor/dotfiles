return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        -- build = "make install_jsregexp",

        dependencies = {
            "rafamadriz/friendly-snippets",
        },

        config = function()
            local ls = require("luasnip")

            ls.filetype_extend("python", { "pydoc" })

            vim.keymap.set({ "i", "s" }, "<C-l>", function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-h>", function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true })
        end,
    },
}
