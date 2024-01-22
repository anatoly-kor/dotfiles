-- require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

-- local dap = require("dap")
-- dap.configurations.python = {
--     {
--         -- The first three options are required by nvim-dap
--         type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
--         request = "launch",
--         name = "Launch file",

--         -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

--         program = "${file}", -- This configuration will launch the current file if used.
--         pythonPath = function()
--             -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
--             -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
--             -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
--             local cwd = vim.fn.getcwd()
--             if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
--                 return cwd .. "/venv/bin/python"
--             elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
--                 return cwd .. "/.venv/bin/python"
--             else
--                 return "/usr/bin/python"
--             end
--         end,
--     },
-- }

-- local dap, dapui = require("dap"), require("dapui")
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--     dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--     dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--     dapui.close()
-- end

-- vim.keymap.set("n", "<leader>b", ":DapToggleBreakpoint<CR>")
-- vim.keymap.set("n", "<leader>c", ":lua require('dap').continue()<CR>")
-- vim.keymap.set("n", "<leader>o", ":lua require('dap').step_over()<CR>")
-- vim.keymap.set("n", "<leader>i", ":lua require('dap').step_into()<CR>")
-- vim.keymap.set("n", "<leader>d", ':lua require("dapui").toggle()<CR>')
