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

    vim.keymap.set('n', '<leader>nt', nvim_tree_api.toggle, { desc = '[N]vim-tree: [T]oggle' })
    vim.keymap.set('n', '<leader>nff', nvim_tree_api.find_file, { desc = '[N]vim-tree: [F]ind [F]ile' })
    vim.keymap.set('n', '<leader>nfc', nvim_tree_api.focus, { desc = '[N]vim-tree: [F]o[C]us' })
  end
}
