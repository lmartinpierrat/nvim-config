-- This is free and unencumbered software released into the public domain.
-- Anyone is free to copy, modify, publish, use, compile, sell, or
-- distribute this software, either in source code form or as a compiled
-- binary, for any purpose, commercial or non-commercial, and by any means.

vim.g.mapleader = ','
vim.g.maplocalleader = ";"

vim.o.showmatch = true

vim.o.termguicolors = true

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

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
