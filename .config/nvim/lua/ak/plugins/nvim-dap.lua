return {
    "mfussenegger/nvim-dap-python",
    dependencies = {
        "mfussenegger/nvim-dap",
        "jay-babu/mason-nvim-dap.nvim",
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
    },
    event = "VeryLazy",
    config = function()
        require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
        local dap, dapui = require("dap"), require("dapui")
        require("mason-nvim-dap").setup({
            ensure_installed = {
                "python",
                "debugpy",
            },
            automatic_installation = true,
            handlers = {},
        })

        dapui.setup({
            controls = {
                element = "repl",
                enabled = false,
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
                border = "single",
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
            force_buffers = true,
            icons = {
                collapsed = "",
                current_frame = "",
                expanded = "",
            },
            layouts = {
                {
                    elements = {
                        { id = "scopes", size = 0.4 },
                        { id = "breakpoints", size = 0.1 },
                        { id = "stacks", size = 0.1 },
                        { id = "watches", size = 0.4 },
                    },
                    position = "right",
                    size = 70,
                },
                {
                    elements = {
                        {
                            id = "repl",
                            size = 0.5,
                        },
                        {
                            id = "console",
                            size = 0.5,
                        },
                    },
                    position = "bottom",
                    size = 10,
                },
            },
            mappings = {
                edit = "e",
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                repl = "r",
                toggle = "t",
            },
            render = {
                indent = 1,
                max_value_lines = 100,
            },
        })
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        require("nvim-dap-virtual-text").setup({
            enabled = true, -- enable this plugin (the default)
            enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
            highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
            highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
            show_stop_reason = true, -- show stop reason when stopped for exceptions
            commented = false, -- prefix virtual text with comment string
            only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
            all_references = false, -- show virtual text on all all references of the variable (not only definitions)
            clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
            --- A callback that determines how a variable is displayed or whether it should be omitted
            display_callback = function(variable, buf, stackframe, node, options)
                if options.virt_text_pos == "inline" then
                    return " = " .. variable.value
                else
                    return variable.name .. " = " .. variable.value
                end
            end,
            -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
            virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

            -- experimental features:
            all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
            virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
            virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
            -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
        })

        vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { desc = "Add Debug [B]reakpoint" })
        vim.keymap.set("n", "<leader>dc", ":lua require('dap').continue()<CR>", { desc = "[D]ebug [C]ontinue" })
        vim.keymap.set("n", "<leader>o", ":lua require('dap').step_over()<CR>", { desc = "Debug Step [O]ver" })
        vim.keymap.set("n", "<leader>i", ":lua require('dap').step_into()<CR>", { desc = "Debug Step [I]nto" })
        vim.keymap.set("n", "<leader>dr", ":lua require('dap').restart()<CR>", { desc = "Debug [R]restart" })
        vim.keymap.set("n", "<leader>dt", ":lua require('dap').terminate()<CR>", { desc = "Debug Terminate Session" })
        vim.keymap.set("n", "<leader>e", ":lua require('dapui').eval()<CR>", { desc = "Show [E]xpression under cursor." })
        vim.keymap.set(
            "n",
            "<leader>w",
            ":lua require('dapui').elements.watches.add()<CR>",
            { desc = "Add element under cursor to [W]atch list." }
        )
    end,
}
