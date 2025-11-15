-- This is free and unencumbered software released into the public domain.
-- Anyone is free to copy, modify, publish, use, compile, sell, or
-- distribute this software, either in source code form or as a compiled
-- binary, for any purpose, commercial or non-commercial, and by any means.

return {

    -- indent-blankline doesn't shows up on previews

    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = true,
        main = "ibl",
        opts = {
            enabled = true,
            indent = {
                char = '¦',
                smart_indent_cap = true
            },
            scope = {
                enabled = true,
                show_start = false,
            }
        },
    }

}
