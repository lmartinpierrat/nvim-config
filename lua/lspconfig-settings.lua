-- Copyright (C) Martin-Pierrat Louis  - All Rights Reserved
-- Unauthorized copying of this file, via any medium is strictly prohibited
-- Proprietary and confidential
-- Written by Martin-Pierrat Louis (louismartinpierrat@gmail.com), 2022

require('mason').setup()
require('mason-lspconfig').setup()

require('lspconfig')['clangd'].setup({})
require('lspconfig')['cmake'].setup({})
require('lspconfig')['bashls'].setup({})
require('lspconfig')['pyright'].setup({})

require('lspconfig')['sumneko_lua'].setup({
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            diagnostics = {
                globals = {'vim'}
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            },
            telemetry = {
                enable = false
            }
        }
    }
})
