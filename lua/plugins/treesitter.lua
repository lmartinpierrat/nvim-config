-- This is free and unencumbered software released into the public domain.
-- Anyone is free to copy, modify, publish, use, compile, sell, or
-- distribute this software, either in source code form or as a compiled
-- binary, for any purpose, commercial or non-commercial, and by any means.

-- needs something to have the full list of parsers installed.

return {

    {
        "nvim-treesitter/nvim-treesitter",
        enabled = true,
        lazy = false,
        branch = 'main',
        build = ':TSUpdate',
        config = function()

            local treesitter = require('nvim-treesitter')
            local parsers = {
                "c",
                "rust",
                "lua",
                "markdown"
            }

            treesitter.setup({
                install_dir = vim.fn.stdpath('data') .. "/lazy/nvim-treesitter/"
            })

            vim.api.nvim_create_autocmd('FileType', {
                pattern = parsers,
                callback = function()
                    vim.treesitter.start()
                    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })

        end
    }

}
