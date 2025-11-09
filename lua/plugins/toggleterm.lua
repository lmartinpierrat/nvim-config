-- This is free and unencumbered software released into the public domain.
-- Anyone is free to copy, modify, publish, use, compile, sell, or
-- distribute this software, either in source code form or as a compiled
-- binary, for any purpose, commercial or non-commercial, and by any means.

return {

    {
        'akinsho/toggleterm.nvim',
        version = "*",
        lazy = false,
        config = true,
        opts = {
            open_mapping = '<leader>t',
            direction = 'float',
            shade_terminals = true,
            name_formatter = function(term)
                return string.format(' Terminal %d ', term.id)
            end,
            float_opts = {
                border = 'curved',
                title_pos = 'center'
            }
        },
    }

}
