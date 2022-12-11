-- Copyright (C) Martin-Pierrat Louis  - All Rights Reserved
-- Unauthorized copying of this file, via any medium is strictly prohibited
-- Proprietary and confidential
-- Written by Martin-Pierrat Louis (louismartinpierrat@gmail.com), 2022

-- the following snippet automatically detect if packer has been installed or not on the machine,
-- if packer is missing, it will download the latest version and load it.
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd([[packadd packer.nvim]])
end

-- this cmd will launch PackerCompile each time this file is changed.
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

return require('packer').startup(function(use)

    use 'lewis6991/impatient.nvim'

    use 'wbthomason/packer.nvim'

    use 'kyazdani42/nvim-tree.lua'

    -- use 'luisiacc/gruvbox-baby'
    -- use 'folke/tokyonight.nvim'
    -- use "EdenEast/nightfox.nvim"
    -- use 'ful1e5/onedark.nvim'
    use 'sainnhe/gruvbox-material'

    use 'nvim-lualine/lualine.nvim'

    use 'lukas-reineke/indent-blankline.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use 'numToStr/Comment.nvim'

    use 'akinsho/toggleterm.nvim'

    use 'nvim-lua/plenary.nvim'

    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }

    use 'cappyzawa/trim.nvim'

    use 'williamboman/mason.nvim'

    use 'williamboman/mason-lspconfig.nvim'

    use 'neovim/nvim-lspconfig'

    if packer_bootstrap then
        require('packer').sync()
    end

end)
