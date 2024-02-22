return {
  'nvim-lualine/lualine.nvim',
  opts = {
    sections = {
      lualine_x = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" },
        },
      },

    },
    options = {
      icons_enabled = true,
      theme = 'tokyonight',

      component_separators = { left = '', right = '' },

      section_separators = { left = '', right = '' },
    },
  },

  dependencies = { 'nvim-tree/nvim-web-devicons' }
}
