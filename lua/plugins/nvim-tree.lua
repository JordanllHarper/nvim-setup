return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup {
      sort_by = "case_sensitive",
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
      disable_netrw = false
    }
    local nvim_tree_api = require "nvim-tree.api".tree

    vim.keymap.set('n', '<leader>df', nvim_tree_api.toggle, { desc = 'nvim-tree: [D]isplay [F]iles (toggle)' })
    vim.keymap.set('n', '<leader>dt', nvim_tree_api.find_file, { desc = 'nvim-tree: [D]isplay in [T]ree (toggle)' })
  end
}
