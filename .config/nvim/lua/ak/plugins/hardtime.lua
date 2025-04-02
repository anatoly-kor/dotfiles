return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    config = function()
        require("hardtime").setup({
            disabled_filetypes = { "oil", "lazy", "mason", "harpoon", "git", "fugitive", "dockerfile", "yaml", "trouble", "help" },
        })
    end,
}
