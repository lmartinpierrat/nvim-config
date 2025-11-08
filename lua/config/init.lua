-- This is free and unencumbered software released into the public domain.
-- Anyone is free to copy, modify, publish, use, compile, sell, or
-- distribute this software, either in source code form or as a compiled
-- binary, for any purpose, commercial or non-commercial, and by any means.

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    ui = {
        border = 'rounded'
    },
    change_detection = {
        enabled = false,
        notify = false
    },
    install = { colorscheme = { "kanagawa-dragon" } },
    checker = { enabled = true },
})

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
