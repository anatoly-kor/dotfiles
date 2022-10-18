require("twilight").setup{
    dimming = {
        aplha = 0.50,
        color = { "Normal", "#ffffff" },
        inactive = false,
    },
    context = 10,
    treesitter = true,
    expand = {
        "function",
        "function_definition",
        "method",
        "table",
        "if_statement",
    }
}
