local colors = {
  black = {gui = '#000000', cterm = '235'},
  grey_comment = {gui = '#9a9a9a', cterm = '59'},
  grey_cursor = {gui = '#3f4b52', cterm = '236'},
  red = {gui = '#F72119', cterm = '166'},
  white = {gui = '#d5d5d5', cterm = '251'},
  yellow = {gui = '#fffd37', cterm = '100'},
}

local inactive = {
  guifg = colors.grey_comment.gui,
  guibg = colors.grey_cursor.gui,
  ctermfg = colors.grey_comment.cterm,
  ctermbg = colors.grey_cursor.cterm,
}

return {
  mode = {
    inactive = inactive,
    normal = {
      guifg = colors.black.gui,
      guibg = colors.red.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.red.cterm,
    },
    insert = {
      guifg = colors.black.gui,
      guibg = colors.red.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.red.cterm,
    },
    replace = {
      guifg = colors.black.gui,
      guibg = colors.yellow.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.yellow.cterm,
    },
    visual = {
      guifg = colors.black.gui,
      guibg = colors.yellow.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.yellow.cterm,
    },
    command = {
      guifg = colors.black.gui,
      guibg = colors.red.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.red.cterm,
    },
  },
  low = {
    active = {
      guifg = colors.white.gui,
      guibg = colors.grey_cursor.gui,
      ctermfg = colors.white.cterm,
      ctermbg = colors.grey_cursor.cterm,
    },
    inactive = inactive,
  },
  med = {
    active = {
      guifg = colors.red.gui,
      guibg = colors.black.gui,
      ctermfg = colors.red.cterm,
      ctermbg = colors.black.cterm,
    },
    inactive = inactive,
  },
  high = {
    active = {
      guifg = colors.red.gui,
      guibg = colors.black.gui,
      ctermfg = colors.red.cterm,
      ctermbg = colors.black.cterm,
    },
    inactive = inactive,
  },
  error = {
    active = {
      guifg = colors.black.gui,
      guibg = colors.red.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.red.cterm,
    },
    inactive = inactive,
  },
  warning = {
    active = {
      guifg = colors.black.gui,
      guibg = colors.yellow.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.yellow.cterm,
    },
    inactive = inactive,
  },
  bufferline = {
    separator = inactive,
    current = {
      guifg = colors.black.gui,
      guibg = colors.red.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.red.cterm,
    },
    current_modified = {
      guifg = colors.black.gui,
      guibg = colors.yellow.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.yellow.cterm,
    },
    background = {
      guifg = colors.red.gui,
      guibg = colors.black.gui,
      ctermfg = colors.red.cterm,
      ctermbg = colors.black.cterm,
    },
    background_modified = {
      guifg = colors.yellow.gui,
      guibg = colors.black.gui,
      ctermfg = colors.yellow.cterm,
      ctermbg = colors.black.cterm,
    },
  },
}
