return {

    -- Colorschemes
    -- "rose-pine/neovim",
    -- "AlexvZyl/nordic.nvim",
    -- { "Yazeed1s/oh-lucy.nvim", priority = 1000 },

    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
        require("onedark").setup({
            style = "cool",
            code_style = {
                comments = "bold",
                keywords = "none",
                functions = "none",
                strings = "none",
                variables = "none",
            },
        })
        require("onedark").load()
    end,
}
