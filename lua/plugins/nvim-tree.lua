-- This is free and unencumbered software released into the public domain.
-- Anyone is free to copy, modify, publish, use, compile, sell, or
-- distribute this software, either in source code form or as a compiled
-- binary, for any purpose, commercial or non-commercial, and by any means.

return {

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            {
                'b0o/nvim-tree-preview.lua',
                dependencies = {
                    'nvim-lua/plenary.nvim',
                },
                opts = {
                    min_width = 80,
                    min_height = 10,
                    max_width = 180,
                    max_height = 80,
                    show_title = true,
                }
            }
        },
        opts = {
            disable_netrw = true,
            hijack_cursor = true,
            hijack_unnamed_buffer_when_opening = true,
            -- check git and diagnostics support
            git = {
                enable = true,
                show_on_dirs = false
            },
            renderer = {
                root_folder_modifier = ":t%",
                group_empty = true,
                icons = {
                    show = {
                        file = false,
                        folder = false,
                        folder_arrow = true,
                        git = true,
                    },
                    glyphs = {
                        default = "",
                        symlink = "",
                        bookmark = "b",
                        folder = {
                            arrow_closed = '▹',
                            arrow_open = '▿',
                        },
                        git = {}
                    },
                    git_placement = 'signcolumn'
                }
            },
            filters = {
                dotfiles = true,
                exclude = { "%.clang%-format", "%.clang%-tidy", "%.gitignore" }
            },
            on_attach = function(bufnr)

                local api = require('nvim-tree.api')
                local preview = require('nvim-tree-preview')

                local function opts(desc)
                    return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                vim.keymap.set('n', '<Tab>', function()

                    if not preview.is_watching() then
                        preview.watch()
                        return nil
                    end

                    local ok, node = pcall(api.tree.get_node_under_cursor)
                    if ok and node then
                        preview.node(node, { toggle_focus = true })
                    end

                end, opts('open preview'))
                vim.keymap.set('n', '<Esc>', preview.unwatch, opts('close preview'))

                vim.keymap.set('n', '<cr>',   api.node.open.edit,             opts('open file'))
                vim.keymap.set('n', 's',      api.node.open.vertical,         opts('split vertical'))
                vim.keymap.set('n', 'i',      api.node.open.horizontal,       opts('split horizontal'))
                vim.keymap.set('n', 'I',      api.node.show_info_popup,       opts('info'))

                vim.keymap.set('n', 'e',      api.tree.expand_all,            opts('expand all nodes'))
                vim.keymap.set('n', 'E',      api.tree.collapse_all,          opts('collapse all nodes'))

                vim.keymap.set('n', 'm',      api.marks.toggle,               opts('bookmark'))
                vim.keymap.set('n', 'bd',     api.marks.bulk.delete,          opts('delete bookmarked'))
                vim.keymap.set('n', 'bmv',    api.marks.bulk.move,            opts('move bookmarked'))

                vim.keymap.set('n', 't',      api.fs.create,                  opts('create file'))
                vim.keymap.set('n', 'r',      api.fs.rename,                  opts('rename file'))
                vim.keymap.set('n', 'd',      api.fs.remove,                  opts('delete file'))
                vim.keymap.set('n', 'x',      api.fs.cut,                     opts('cut file'))
                vim.keymap.set('n', 'c',      api.fs.copy.node,               opts('copy file'))
                vim.keymap.set('n', 'p',      api.fs.paste,                   opts('paste file'))

                vim.keymap.set('n', '.',      api.tree.toggle_hidden_filter,  opts('toggle hidden files'))
                vim.keymap.set('n', '+',      api.tree.change_root_to_node,   opts('change root to node'))
                vim.keymap.set('n', '-',      api.tree.change_root_to_parent, opts('change root to parent'))

                vim.keymap.set('n', '?',      api.tree.toggle_help,           opts('toggle nvim-tree help'))

                vim.keymap.set('n', 'f',      api.live_filter.start,          opts('filter'))
                vim.keymap.set('n', 'F',      api.live_filter.clear,          opts('clear filter'))

                vim.keymap.set('n', 'R',      api.tree.reload,                opts('reload'))
                vim.keymap.set('n', 'q',      api.tree.close,                 opts('close'))

            end
        },
        keys = {
            {"<leader>e", "<cmd>NvimTreeFocus<cr>", desc = "file explorer"}
        }
    }

}
