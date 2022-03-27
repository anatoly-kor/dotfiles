return require('packer').startup({function()
    use {
        'wbthomason/packer.nvim',
        opt = false
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        tag = 'release'
    }

    use {
        'ojroques/nvim-hardline'
    }
    use {'rebelot/kanagawa.nvim'}
end,
config = {
    auto_clean = true,
    display = {
        open_fn = require('packer.util').float,
    }
}})
