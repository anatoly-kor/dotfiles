return {
    "ThePrimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon [A]dd file" })
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon Toggle M[E]nu" })

        vim.keymap.set("n", "<leader>h", function()
            ui.nav_file(1)
        end, { desc = "Harpoon go to [H] file" })
        vim.keymap.set("n", "<leader>j", function()
            ui.nav_file(2)
        end, { desc = "Harpoon go to [J] file" })
        vim.keymap.set("n", "<leader>k", function()
            ui.nav_file(3)
        end, { desc = "Harpoon go to [K] file" })
        vim.keymap.set("n", "<leader>l", function()
            ui.nav_file(4)
        end, { desc = "Harpoon go to [L] file" })

        vim.keymap.set("n", "<leader>m", ":Telescope harpoon marks<CR>", { desc = "Telescope Search [M]arks" })
    end,
}
