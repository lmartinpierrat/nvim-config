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
