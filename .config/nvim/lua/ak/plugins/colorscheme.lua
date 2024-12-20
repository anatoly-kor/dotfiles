return {

    -- Colorschemes
    -- "rose-pine/neovim",
    -- "AlexvZyl/nordic.nvim",
    -- { "Yazeed1s/oh-lucy.nvim", priority = 1000 },

    -- "navarasu/onedark.nvim",
    -- priority = 1000,
    -- config = function()
    --     require("onedark").setup({
    --         style = "cool",
    --         code_style = {
    --             comments = "bold",
    --             keywords = "none",
    --             functions = "none",
    --             strings = "none",
    --             variables = "none",
    --         },
    --     })
    --     require("onedark").load()
    -- end,

    -- "scottmckendry/cyberdream.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --     require("cyberdream").setup({
    --         transparent = true,
    --         italic_comments = true,
    --         hide_fillchars = false,
    --         borderless_telescope = true,
    --         terminal_colors = false,
    --     })

    -- "folke/tokyonight.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- vim.cmd("colorscheme tokyonight-moon")

    "wnkz/monoglow.nvim",
    lazy = false,
    priority = 1000,

    config = function()
        require("monoglow").setup({
            on_colors = function(colors)
                colors.glow = "#D70040"
            end,
            on_highlights = function(highlights, colors)
                highlights.Keyword = { fg = colors.glow, bold = false }
                highlights.Statement = { fg = colors.glow, bold = false }
                highlights.StorageClass = { fg = colors.glow, bold = false }
                highlights["@keyword"] = { fg = colors.glow, bold = false }
                highlights["@keyword.function"] = { fg = colors.glow, bold = false }
                highlights["@keyword.return"] = { fg = colors.glow, bold = false }
                highlights["@keyword.operator"] = { fg = colors.glow, bold = false }
                highlights.Function = { fg = colors.glow, bold = false }
                highlights["@variable.builtin"] = { fg = colors.glow, bold = true }
                highlights["@operator"] = { fg = "NONE" }
            end,
        })

        vim.cmd("colorscheme monoglow")

        vim.api.nvim_set_hl(0, "LineNr", { fg = "#FFC0CB", bold = false })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D70040", bold = true })
        -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#FC5A8D", bold = false })

        vim.api.nvim_set_hl(0, "Visual", { bg = "#D70040", bold = false })
    end,
}
