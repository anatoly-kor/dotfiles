-- TODO: configure me
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    -- config = function()
    --     -- Either disable the other plugin or set `config.lsp.signature.enabled = false` in your **Noice** config.
    --     local noice = require("noice")

    --     noice.setup({
    --         routes = {
    --             {
    --                 filter = { event = "msg_show", find = "Шаблон не найден" },
    --                 opts = { skip = true },
    --             },
    --             {
    --                 filter = { event = "msg_show", kind = "", find = "записано" },
    --                 opts = { skip = true },
    --             },
    --             {
    --                 view = "split",
    --                 filter = { event = "msg_show", min_height = 15 },
    --             },
    --             {
    --                 view = "mini",
    --                 filter = { event = "msg_show", find = "Already up to date" },
    --             },
    --             {
    --                 view = "mini",
    --                 filter = {
    --                     event = "telescope.actions.git_checkout",
    --                     -- find = "[telescope.actions.git_checkout]: Checked out:",
    --                 },
    --             },
    --             -- show @recording messages
    --             {
    --                 view = "notify",
    --                 filter = { event = "msg_showmode" },
    --             },
    --         },
    --         presets = {
    --             lsp_doc_border = true,
    --             long_message_to_split = true, -- long messages will be sent to a split
    --         },
    --         views = {
    --             notify = {
    --                 merge = true,
    --             },
    --         },
    --         lsp = { signature = { enabled = false } },
    --     })
    -- end,
}
