-- This is free and unencumbered software released into the public domain.
-- Anyone is free to copy, modify, publish, use, compile, sell, or
-- distribute this software, either in source code form or as a compiled
-- binary, for any purpose, commercial or non-commercial, and by any means.

return {
    {
        'nvim-lualine/lualine.nvim',
        enabled = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            options = {
                icons_enabled = true,
                globalstatus = true,
                always_divide_middle = true,
            },
            extensions = {
                'nvim-tree'
            },
            sections = {
                lualine_x = {
                    {
                        require("noice").api.status.mode.get,
                        cond = require("noice").api.status.mode.has,
                    },
                    {
                        require("noice").api.status.search.get,
                        cond = require("noice").api.status.search.has,
                    },
                },
            },
        }
    }
}
