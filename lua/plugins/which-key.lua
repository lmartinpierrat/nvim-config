-- This is free and unencumbered software released into the public domain.
-- Anyone is free to copy, modify, publish, use, compile, sell, or
-- distribute this software, either in source code form or as a compiled
-- binary, for any purpose, commercial or non-commercial, and by any means.

return {

    {
        "folke/which-key.nvim",
        lazy = false,
        opts = {
            preset = 'helix',
            -- ideally make this a function that's instant for <leader> and 1s otherwise.
            delay = 1000,
            plugins = {
                marks = false,
                registers = false,
                spelling = {
                    enabled = false
                },
                presets = {
                    operators = true,
                    motions = true,
                    text_object = true,
                    windows = true,
                    nav = true,
                    z = true,
                    g = true
                }
            },
            win = {
                title = false,
                border = 'rounded',
                padding = {1 , 2}
            },
            icons = {
                mappings = false
            },
            show_help = false,
            show_keys = false
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
        config = function(_, opts)
            require('which-key').setup(opts)
            vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = '#909090' })
            vim.api.nvim_set_hl(0, "WhichKeyNormal", { link = 'none' })
        end
    }

}
