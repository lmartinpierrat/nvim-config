-- This is free and unencumbered software released into the public domain.
-- Anyone is free to copy, modify, publish, use, compile, sell, or
-- distribute this software, either in source code form or as a compiled
-- binary, for any purpose, commercial or non-commercial, and by any means.

-- TODO: This is not fully fledged. Would need a bit more care.

return {

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            presets = { 
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
            },
            format = {
                level = {
                    icons = {
                        error = "✖",
                        warn = "▼",
                        info = "●",
                    },
                },
            },
            cmdline = {
                enabled = true,
                format = {
                    cmdline = { icon = ">" },
                    search_down = { icon = "🔍" },
                    search_up = { icon = "🔍" },
                    filter = { icon = "$" },
                    lua = { icon = "☾" },
                    help = { icon = "?" },
                },
            },
            messages = {
                enabled = true 
            },
            popupmenu = {
                enabled = true,
                kind_icons = false,
            },
            notify = {
                enabled = true
            },
            lsp = {
                progress = { enabled = false },
                hover = { enabled = false },
                signature = { enabled = false },
                message = { enabled = false },
            },
            routes = {
                {
                    filter = { event = "msg_show", kind = "search_count" },
                    opts = { skip = true },
                },
                {
                    filter = { event = "msg_show", kind = "", find = "written", },
                    opts = { skip = true },
                },
            },
        },
    }

}
