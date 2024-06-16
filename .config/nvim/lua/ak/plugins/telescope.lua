return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
        "nvim-lua/plenary.nvim",
    },
    build = "make",
    config = function()
        local telescope_setup, telescope = pcall(require, "telescope")
        if not telescope_setup then
            return
        end

        local actions_setup, actions = pcall(require, "telescope.actions")
        if not actions_setup then
            return
        end

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope [F]ind files" })
        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telecope Git files" })
        -- vim.keymap.set("n", "<leader>c", builtin.git_commits, {})
        -- vim.keymap.set("n", "<leader>bc", builtin.git_bcommits, {})
        vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope [G]it [B]ranches" })
        vim.keymap.set("n", "<C-g>", builtin.live_grep, { desc = "Telescope Live [G]rep" })
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
        vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)

        local bufopts = { noremap = true, silent = true, buffer = 0 }

        vim.keymap.set("n", "gi", function()
            require("telescope.builtin").lsp_implementations()
        end, { desc = "[G]o find [I]mplementations" })

        vim.keymap.set("n", "gr", function()
            require("telescope.builtin").lsp_references()
        end, { desc = "[G]o find [R]eferences" })

        vim.keymap.set("n", "<leader>sn", function() -- FIXME: Is it usefull for me?
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[S]earch [N]eovim files" })

        telescope.setup({
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
            defaults = {
                layout_strategy = "vertical",
                layout_config = {
                    height = 0.9,
                    width = 0.9,
                },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
                        ["<C-s>"] = actions.send_to_qflist + actions.open_qflist,
                    },
                },
                lsp_implementations = {
                    layout_strategy = "vertical",
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        preview_cutoff = 1,
                        mirror = false,
                    },
                },
                lsp_references = {
                    layout_strategy = "vertical",
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        preview_cutoff = 1,
                        mirror = false,
                    },
                },
            },
        })

        telescope.load_extension("noice")
    end,
}
