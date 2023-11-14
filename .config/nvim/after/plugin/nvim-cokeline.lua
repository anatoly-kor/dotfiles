--- In your opts table, set `buffers.new_buffers_position = harpoon_sorter()`
local function harpoon_sorter()
    local harpoon = require("harpoon.mark")
    local cache = {}

    local function marknum(buf, force)
        local b = cache[buf.number]
        if b == nil or force then
            b = harpoon.get_index_of(buf.path)
            cache[buf.number] = b
        end
        return b
    end

    harpoon.on("changed", function()
        for _, buf in ipairs(require("cokeline.buffers").get_visible()) do
            cache[buf.number] = marknum(buf, true)
        end
    end)

    -- Use this in `config.buffers.new_buffers_position`
    return function(a, b)
        local ma = marknum(a)
        local mb = marknum(b)
        if ma and not mb then
            return true
        elseif mb and not ma then
            return false
        elseif ma == nil and mb == nil then
            -- switch the a and b.index to place non-harpoon buffers on the left
            -- side of the tabline - this puts them on the right.
            ma = a._valid_index
            mb = b._valid_index
        end
        return ma < mb
    end
end

local get_hex = require("cokeline.hlgroups").get_hl_attr

local green = vim.g.terminal_color_2
local yellow = vim.g.terminal_color_3

require("cokeline").setup({
    show_if_buffers_are_at_least = 1,
    delete_on_right_click = false,
    buffers = {
        new_buffers_position = harpoon_sorter(),
    },
    mappings = {
        -- Controls what happens when the first (last) buffer is focused and you
        -- try to focus/switch the previous (next) buffer. If `true` the last
        -- (first) buffers gets focused/switched, if `false` nothing happens.
        cycle_prev_next = false,
        -- Disables mouse mappings
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

    components = {
        {
            text = "｜",
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
                -- return buffer.filename .. " "
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
        -- {
        --     text = function(buffer)
        --         return buffer.is_modified and "●" or ""

        --     end,
        -- },
    },
})
