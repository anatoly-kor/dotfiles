local custom_header = {
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[    ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄ ]],
    [[    ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄ ]],
    [[   ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄ ]],
    [[   ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄ ]],
    [[  ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰ ]],
    [[  ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤ ]],
    [[ ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗ ]],
    [[ ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟  ]],
    [[ ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃  ]],
    [[ ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃  ]],
    [[  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃   ]],
    [[   ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁    ]],
    [[     ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁      ]],
    [[        ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁     ⢀⣠⣴ ]],
    [[ ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿ ]],
    [[]],
    [[]],
}
local custom_footer = { "SENPAI BE GENTLY" }

require("startup").setup({
    section_1 = {
        type = "text", -- can be mappings or oldfiles
        oldfiles_directory = false, -- if the oldfiles of the current directory should be displayed
        align = "center", -- "center", "left" or "right"
        fold_section = false, -- whether to fold or not
        title = "title", -- title for the folded section
        -- if < 0 fraction of screen width
        -- if > 0 numbers of column
        margin = 5, -- the margin for left or right alignment
        -- type of content depends on `type`
        -- "text" -> a table with string or a function that requires a function that returns a table of strings
        -- "mapping" -> a table with tables in the format:
        -- {
        --   {<displayed_command_name>, <command>, <mapping>}
        --   {<displayed_command_name>, <command>, <mapping>}
        -- }

        content = custom_header,
        highlight = "String", -- highlight group in which the section text should be highlighted
        default_color = "#FF0000", -- a hex color that gets used if you don't specify `highlight`
        oldfiles_amount = 0, -- the amount of oldfiles to be displayed
    },
    section_2 = {
        -- "text" -> text that will be displayed
        -- "mapping" -> create mappings for commands that can be used
        -- use mappings.execute_command on the commands to execute
        -- "oldfiles" -> display oldfiles (can be opened with mappings.open_file/open_file_split)
        type = "text", -- can be mappings or oldfiles
        oldfiles_directory = false, -- if the oldfiles of the current directory should be displayed
        align = "center", -- "center", "left" or "right"
        fold_section = false, -- whether to fold or not
        title = "title", -- title for the folded section
        -- if < 0 fraction of screen width
        -- if > 0 numbers of column
        margin = 5, -- the margin for left or right alignment
        -- type of content depends on `type`
        -- "text" -> a table with string or a function that requires a function that returns a table of strings
        -- "mapping" -> a table with tables in the format:
        -- {
        --   {<displayed_command_name>, <command>, <mapping>}
        --   {<displayed_command_name>, <command>, <mapping>}
        -- }

        content = custom_footer,
        highlight = "String", -- highlight group in which the section text should be highlighted
        default_color = "#FF0000", -- a hex color that gets used if you don't specify `highlight`
        oldfiles_amount = 5, -- the amount of oldfiles to be displayed
    },
    colors = {
        background = "#1f2227",
        folded_section = "#56b6c2", -- the color of folded sections
        -- this can also be changed with the `StartupFoldedSection` highlight group
    },
    parts = { "section_1", "section_2" }, -- all sections in order
})
