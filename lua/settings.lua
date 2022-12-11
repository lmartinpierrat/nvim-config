-- Copyright (C) Martin-Pierrat Louis  - All Rights Reserved
-- Unauthorized copying of this file, via any medium is strictly prohibited
-- Proprietary and confidential
-- Written by Martin-Pierrat Louis (louismartinpierrat@gmail.com), 2022

vim.g.mapleader = ','

vim.o.showmatch = true

-- highlight the line under the cursor
vim.wo.cursorline = true
vim.wo.colorcolumn = "140"
vim.wo.number = true
vim.wo.signcolumn = "yes"

-- add padding around horizontal and vertical scrolling
vim.wo.sidescrolloff = 5
vim.wo.scrolloff = 5

-- do not wrap long lines
vim.o.wrap = false

-- replace tabs by spaces
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.showmode = false

-- enable moving to the next|previous line with direction keys
vim.o.whichwrap = "<,>,[,]"

vim.opt.list = true
vim.opt.listchars = {
    -- eol = '⤶',
    tab = '› ',
    lead = '·',
    trail = '·',
    extends = '▸',
    precedes = '◂',
    nbsp = '.'
}
