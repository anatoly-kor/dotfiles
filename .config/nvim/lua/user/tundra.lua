require('nvim-tundra').setup({
  transparent_background = true,
  editor = {
    search = {},
    substitute = {},
  },
  syntax = {
    booleans = {},
    comments = { bold = false, italic = true },
    conditionals = {},
    constants = { bold = true },
    functions = { bold = true },
    keywords = { italic = true },
    loops = {},
    numbers = {},
    operators = {},
    punctuation = {},
    strings = {},
    types = { italic = true },
  },
  diagnostics = {
    errors = {},
    warnings = {},
    information = {},
    hints = {},
  },
  plugins = {
    lsp = true,
    treesitter = true,
    cmp = true,
    context = true,
    dbui = false,
    gitsigns = true,
    telescope = true,
  },
  overwrite = {
    colors = {},
    highlights = {},
  },
})

vim.opt.background = 'dark'
-- vim.cmd('colorscheme tundra')
