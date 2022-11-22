require('hardline').setup {
    bufferline = true,  -- enable bufferline
    bufferline_settings = {
        show_index = false,
    },
    theme = gruvbox,
    sections = {
        {class = 'mode', item = require('hardline.parts.mode').get_item},
        {class = 'med', item = require('hardline.parts.filename').get_item},
        '%<',
        {class = 'med', item = '%='},
        {class = 'error', item = require('hardline.parts.lsp').get_error},
        {class = 'warning', item = require('hardline.parts.lsp').get_warning},
        {class = 'warning', item = require('hardline.parts.whitespace').get_item},
        {class = 'high', item = require('hardline.parts.git').get_item, hide = 100},
    },
}
