return {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = "FloatermToggle",
    keys = {
        { "<leader>n", mode = { "n", "t" }, "<cmd>FloatermToggle<cr>", desc = "[F]loaterm [T]oggle" }
    },
}
