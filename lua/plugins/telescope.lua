local default_keymaps = {
  ['<C-b>'] = function(prompt_bufnr)
    require('telescope.actions').delete_buffer(prompt_bufnr)
  end,
}
return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          prompt_position = 'top',
        },
        mappings = {
          n = default_keymaps,
          i = default_keymaps,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      }
    },
    config = function(_, opts)
      require 'plugins.config.telescope'
    end,

  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

}
