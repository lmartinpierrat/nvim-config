-- Copyright (C) Martin-Pierrat Louis  - All Rights Reserved
-- Unauthorized copying of this file, via any medium is strictly prohibited
-- Proprietary and confidential
-- Written by Martin-Pierrat Louis (louismartinpierrat@gmail.com), 2022

require('mason').setup()
require('mason-lspconfig').setup()

local cmp = require('cmp')

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true })
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "path", option = { trailing_slash = true } },
        { name = "buffer" },
    })
})

local capaiblities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['clangd'].setup({ capabilities = capabilities })
require('lspconfig')['cmake'].setup({ capabilities = capabilities })
require('lspconfig')['bashls'].setup({ capabilities = capabilities })
require('lspconfig')['pyright'].setup({ capabilities = capabilities })
