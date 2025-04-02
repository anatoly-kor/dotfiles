return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                -- ваша конфигурация
                style = "night", -- Стили: `storm`, `moon`, `night` (темнее) и `day` (светлый)
                transparent = true, -- Включение прозрачности фона
                terminal_colors = true, -- Настройка цветов для `:terminal`
                styles = {
                    -- Стили для разных групп синтаксиса
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = { bold = false },
                    variables = {},
                    -- Стили фона. Могут быть "dark", "transparent" или "normal"
                    sidebars = "transparent", -- стиль для боковых панелей
                    floats = "transparent", -- стиль для плавающих окон
                },
                sidebars = { "qf", "help", "terminal", "packer", "NvimTree", "Trouble", "lazy" }, -- Какие окна считаются боковыми
                dim_inactive = false, -- Затемнение неактивных окон
                lualine_bold = true, -- Жирные заголовки секций в lualine

                -- Переопределение цветов
                on_colors = function(colors)
                    colors.hint = colors.orange -- Изменение цвета подсказок на оранжевый
                    colors.error = "#ff0000" -- Ярко-красный цвет для ошибок
                    
                    -- Дополнительные настройки цветов
                    colors.border = "#1A1B26"
                    colors.bg_visual = colors.blue7
                    
                    -- Усиление контраста для темного режима
                    colors.bg_dark = "#16161e"
                    colors.bg = "#1a1b26"
                    colors.bg_highlight = "#292e42"
                    colors.fg_dark = "#c0caf5"
                    colors.comment = "#565f89"
                    
                    -- Улучшение цветов для лучшей читаемости
                    colors.blue = "#7aa2f7"
                    colors.cyan = "#7dcfff"
                    colors.green = "#9ece6a"
                    colors.magenta = "#bb9af7"
                end,

                -- Переопределение групп подсветки
                on_highlights = function(highlights, colors)
                    -- Изменение подсветки номеров строк
                    highlights.LineNr = { fg = "#565f89", bold = false }
                    highlights.CursorLineNr = { fg = colors.blue, bold = true }
                    
                    -- Подсветка выделения
                    highlights.Visual = { bg = colors.bg_visual, bold = false }
                    
                    -- Улучшение подсветки вертикальной линии
                    highlights.ColorColumn = { bg = "#1E2030" }
                    
                    -- Подсветка поиска
                    highlights.Search = { bg = "#3D59A1", fg = "#ffffff" }
                    
                    -- Границы окон
                    highlights.WinSeparator = { fg = colors.border }
                    
                    -- Telescope настройки
                    local prompt = "#2d3149"
                    highlights.TelescopeNormal = {
                        bg = colors.bg_dark,
                        fg = colors.fg_dark,
                    }
                    highlights.TelescopeBorder = {
                        bg = colors.bg_dark,
                        fg = colors.bg_dark,
                    }
                    highlights.TelescopePromptNormal = {
                        bg = prompt,
                    }
                    highlights.TelescopePromptBorder = {
                        bg = prompt,
                        fg = prompt,
                    }
                    highlights.TelescopePromptTitle = {
                        bg = prompt,
                        fg = colors.blue,
                        bold = true,
                    }
                    highlights.TelescopePreviewTitle = {
                        bg = colors.bg_dark,
                        fg = colors.blue,
                        bold = true,
                    }
                    highlights.TelescopeResultsTitle = {
                        bg = colors.bg_dark,
                        fg = colors.blue,
                        bold = true,
                    }
                    
                    -- Настройки для LSP и Diagnostics
                    highlights.DiagnosticVirtualTextError = { fg = colors.error, bg = "#332222" }
                    highlights.DiagnosticVirtualTextWarn = { fg = colors.warning, bg = "#33322e" }
                    highlights.DiagnosticVirtualTextInfo = { fg = colors.info, bg = "#243347" }
                    highlights.DiagnosticVirtualTextHint = { fg = colors.hint, bg = "#2a3045" }
                    
                    -- Настройки для Git Signs
                    highlights.GitSignsAdd = { fg = colors.green }
                    highlights.GitSignsChange = { fg = colors.blue }
                    highlights.GitSignsDelete = { fg = colors.red }
                    
                    -- Настройки для Treesitter
                    highlights["@keyword.return"] = { fg = colors.red, italic = true }
                    highlights["@string"] = { fg = colors.green }
                    highlights["@function"] = { fg = colors.blue, bold = false }
                    highlights["@variable.builtin"] = { fg = colors.magenta, italic = true }
                    highlights["@property"] = { fg = colors.cyan }
                    
                    -- Настройки для Trouble плагина
                    highlights.TroubleNormal = { bg = colors.bg_dark }
                    
                    -- Настройки для NeoTree
                    highlights.NeoTreeNormal = { bg = colors.bg_dark }
                    highlights.NeoTreeNormalNC = { bg = colors.bg_dark }
                end,
                
                -- Указание какие плагины поддерживаются
                plugins = {
                    all = true, -- Включить поддержку всех плагинов
                    telescope = true,
                    treesitter = true,
                    nvim_cmp = true,
                    gitsigns = true,
                    nvim_tree = true,
                    trouble = true,
                    neo_tree = true,
                    which_key = true,
                    indent_blankline = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                    },
                },
            })
            -- Активация цветовой схемы
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        "wnkz/monoglow.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("monoglow").setup({
                on_colors = function(colors)
                    colors.glow = "#D70040"
                end,
                on_highlights = function(highlights, colors)
                    highlights.Keyword = { fg = colors.glow, bold = false }
                    highlights.Statement = { fg = colors.glow, bold = false }
                    highlights.StorageClass = { fg = colors.glow, bold = false }
                    highlights["@keyword"] = { fg = colors.glow, bold = false }
                    highlights["@keyword.function"] = { fg = colors.glow, bold = false }
                    highlights["@keyword.return"] = { fg = colors.glow, bold = false }
                    highlights["@keyword.operator"] = { fg = colors.glow, bold = false }
                    highlights.Function = { fg = colors.glow, bold = false }
                    highlights["@variable.builtin"] = { fg = colors.glow, bold = true }
                    highlights["@operator"] = { fg = "NONE" }
                end,
            })
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#FFC0CB", bold = false })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D70040", bold = true })

            vim.api.nvim_set_hl(0, "Visual", { bg = "#D70040", bold = false })
        end,
    },
    {
        "rose-pine/neovim",
        lazy = false,
        priority = 1000,
    },
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "Yazeed1s/oh-lucy.nvim",
        lazy = false,
        priority = 1000,
        config = function() end,
    },
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("onedark").setup({
                style = "cool",
                code_style = {
                    comments = "bold",
                    keywords = "none",
                    functions = "none",
                    strings = "none",
                    variables = "none",
                },
            })
            -- require("onedark").load()
        end,
    },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                transparent = true,
                italic_comments = true,
                hide_fillchars = false,
                borderless_pickers = true,
                terminal_colors = false,
            })
        end,
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.opt.background = "dark"
            -- vim.cmd.colorscheme("oxocarbon")
        end,
    },
}
