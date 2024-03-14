local get_hex = require("cokeline.hlgroups").get_hl_attr

require("cokeline").setup({
    show_if_buffers_are_at_least = 2,
    buffers = {
        filter_valid = false,
        focus_on_delete = "prev",
        new_buffers_position = "last", -- last, next, directory, number
        delete_on_right_click = false,
    },
    mappings = {
        cycle_prev_next = true,
        disable_mouse = true,
    },
    history = {
        enabled = false,
    },

    default_hl = {
        fg = function(buffer)
            return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
        end,
        bg = get_hex("ColorColumn", "bg"),
    },
    fill_hl = "TabLineFill",
    components = {
        {
            text = " ",
            truncation = { priority = 1 },
        },
        {
            text = function(buffer)
                return buffer.devicon.icon
            end,
            fg = function(buffer)
                return buffer.devicon.color
            end,
        },
        {
            text = function(buffer)
                return buffer.unique_prefix
            end,
            fg = get_hex("Comment", "fg"),
            italic = true,
        },
        {
            text = function(buffer)
                if buffer.is_modified then
                    return buffer.filename .. " ● "
                else
                    return buffer.filename .. " "
                end
            end,
            bold = function(buffer)
                return buffer.is_focused
            end,
        },
    },
})

-- vim.keymap.set("n", "<C-l>", "<Plug>(cokeline-focus-next)")
-- vim.keymap.set("n", "<C-h>", "<Plug>(cokeline-focus-prev)")
