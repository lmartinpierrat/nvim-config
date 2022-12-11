-- Copyright (C) Martin-Pierrat Louis  - All Rights Reserved
-- Unauthorized copying of this file, via any medium is strictly prohibited
-- Proprietary and confidential
-- Written by Martin-Pierrat Louis (louismartinpierrat@gmail.com), 2022

require('Comment').setup({

    padding = true,
    sticky = true,
    ignore = nil,

    toggler = {
        line = '<leader>c',
        block = '<leader>b',
    },

    opleader = {
        line = '<leader>c',
        block = '<leader>b'
    },

    mappings = {
        basic = true,
        extra = false,
    }
})

require('indent_blankline').setup({
    char = '¦',
    char_blankline = ' ',

    show_first_indent_level = false,
    show_trailing_blankline_indent = false,
    show_end_of_line = false,

    use_treesitter = true,
    show_current_context = true,
    use_treesitter_scope = true
})

require('lualine').setup({

    options = {
        icons_enabled = false,
        theme = "gruvbox-material",
        component_separators = '',
        section_separators = '',
        always_divide_middle = true,
        globalstatus = true,
    },
    extensions = { "nvim-tree" }
})

require('toggleterm').setup({
    open_mapping = '<leader>t',
    direction = 'float',
    shade_terminals = true
})

require('trim').setup({
    disable = {"markdown"}
})
