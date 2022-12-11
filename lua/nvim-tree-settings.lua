-- Copyright (C) Martin-Pierrat Louis  - All Rights Reserved
-- Unauthorized copying of this file, via any medium is strictly prohibited
-- Proprietary and confidential
-- Written by Martin-Pierrat Louis (louismartinpierrat@gmail.com), 2022

-- TODO: preview open in a floating window instead.
-- TODO: check for style of floating window used for show_info_popup and filter

require('nvim-tree').setup({
    disable_netrw = true,
    hijack_cursor = true,
    renderer = {
        root_folder_modifier = ":t%",
        icons = {
            show = {
                file = false,
                folder = false,
                folder_arrow = true,
                git = false,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "",
                folder = {
                    arrow_closed = '▹',
                    arrow_open = '▿',
                },
                git = {}
            }
        }
    },
    filters = {
        dotfiles = true,
        exclude = { "%.clang%-format", "%.clang%-tidy" }
    },
    git = {
        enable = false
    },
    remove_keymaps = true,
    on_attach = function(bufnr)

        local api = require('nvim-tree.api')

        vim.keymap.set('n', '<cr>',   api.node.open.edit,             {buffer = bufnr})
        vim.keymap.set('n', 's',      api.node.open.vertical,         {buffer = bufnr})
        vim.keymap.set('n', 'i',      api.node.open.horizontal,       {buffer = bufnr})
        vim.keymap.set('n', '<tab>',  api.node.open.preview,          {buffer = bufnr})
        vim.keymap.set('n', 'I',      api.node.show_info_popup,       {buffer = bufnr})

        vim.keymap.set('n', 't',      api.fs.create,                  {buffer = bufnr})
        vim.keymap.set('n', 'r',      api.fs.rename,                  {buffer = bufnr})
        vim.keymap.set('n', 'd',      api.fs.remove,                  {buffer = bufnr})

        vim.keymap.set('n', 'x',      api.fs.cut,                     {buffer = bufnr})
        vim.keymap.set('n', 'c',      api.fs.copy.node,               {buffer = bufnr})
        vim.keymap.set('n', 'p',      api.fs.paste,                   {buffer = bufnr})

        vim.keymap.set('n', '.',      api.tree.toggle_hidden_filter,  {buffer = bufnr})
        vim.keymap.set('n', 'm',      api.tree.change_root_to_node,   {buffer = bufnr})
        vim.keymap.set('n', 'M',      api.tree.change_root_to_parent, {buffer = bufnr})

        vim.keymap.set('n', '?',      api.tree.toggle_help,           {buffer = bufnr})

        vim.keymap.set('n', 'f',      api.live_filter.start,          {buffer = bufnr})
        vim.keymap.set('n', 'F',      api.live_filter.clear,          {buffer = bufnr})

        vim.keymap.set('n', 'R',      api.tree.reload,                {buffer = bufnr})
        vim.keymap.set('n', 'q',      api.tree.close,                 {buffer = bufnr})

    end
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<cr>")
