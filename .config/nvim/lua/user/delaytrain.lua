require('delaytrain').setup {
    delay_ms = 1000,  -- How long repeated usage of a key should be prevented
    grace_period = 2, -- How many repeated keypresses are allowed
    keys = {          -- Which keys (in which modes) should be delayed
        ['nv'] = {'h', 'j', 'k', 'l'},
        ['nvi'] = {'<Left>', '<Down>', '<Up>', '<Right>'},
        ['nvil'] = {'W', 'E', 'B', 'w', 'e', 'b'},
    },
}
vim.api.nvim_create_autocmd({'BufEnter'}, {
    pattern = {'NvimTree*'},
    command = 'DelayTrainDisable',
})

vim.api.nvim_create_autocmd({'BufLeave'}, {
    pattern = {'NvimTree*'},
    command = 'DelayTrainEnable',
}) 
