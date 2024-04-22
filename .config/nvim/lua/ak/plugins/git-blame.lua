-- FIXME: Plugin only for GitBlameOpenFileURL. Find out how to replace
return {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    config = function()
        vim.g["gitblame_enabled"] = 1
        vim.g["gitblame_display_virtual_text"] = 0
        vim.g["gitblame_message_template"] = "<summary> • <date> • <author>"
        -- vim.g["gitblame_message_when_not_committed"] = "Oh please, commit this !"
        vim.g["gitblame_date_format"] = "%x"

        vim.keymap.set("n", "<leader>go", ":GitBlameOpenFileURL<CR>")
    end,
}
