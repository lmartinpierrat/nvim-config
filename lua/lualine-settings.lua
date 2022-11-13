-- Copyright (C) Martin-Pierrat Louis  - All Rights Reserved
-- Unauthorized copying of this file, via any medium is strictly prohibited
-- Proprietary and confidential
-- Written by Martin-Pierrat Louis (louismartinpierrat@gmail.com), 2022

require('lualine').setup({

  options = {
    icons_enabled = false,
    theme = "gruvbox-material",
    component_separators = '',
    section_separators = '',
    always_divide_middle = true,
    globalstatus = true,
  },
  extensions = { "nvim-tree" }
})
