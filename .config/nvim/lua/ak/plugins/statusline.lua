return {
    "tjdevries/express_line.nvim",
    config = function()
        vim.opt.laststatus = 3
        local builtin = require("el.builtin")
        local extensions = require("el.extensions")
        local sections = require("el.sections")
        local subscribe = require("el.subscribe")
        local lsp_statusline = require("el.plugins.lsp_status")
        local helper = require("el.helper")
        local diagnostic = require("el.diagnostic")

        local mode = extensions.gen_mode({ format_string = " %s " })

        local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
            local branch = extensions.git_branch(window, buffer)
            if branch then
                return " " .. extensions.git_icon() .. " " .. branch
            end
        end)

        local file_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, buffer)
            local icon = extensions.file_icon(_, buffer)
            if icon then
                return icon .. " "
            end

            return ""
        end)

        local diagnostic_display = diagnostic.make_buffer()

        local git_changes = subscribe.buf_autocmd("el_git_changes", "BufWritePost", function(window, buffer)
            return extensions.git_changes(window, buffer)
        end)

        local generator = function()
            local el_segments = {}

            table.insert(el_segments, mode)

            table.insert(el_segments, git_branch)

            table.insert(el_segments, sections.split)

            table.insert(el_segments, file_icon)

            table.insert(el_segments, sections.maximum_width(builtin.file_relative, 0.60))

            table.insert(el_segments, sections.collapse_builtin({ { " " }, { builtin.modified_flag } }))

            table.insert(el_segments, sections.split)

            table.insert(el_segments, diagnostic_display)

            table.insert(el_segments, " ")

            table.insert(el_segments, git_changes)

            table.insert(
                el_segments,
                sections.collapse_builtin({
                    "[",
                    builtin.line_with_width(3),
                    ":",
                    builtin.column_with_width(2),
                    "]",
                })
            )

            return el_segments
        end

        require("el").setup({ generator = generator })
    end,
}
