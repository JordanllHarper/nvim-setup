local nvim_tree_api = require "nvim-tree.api".tree

vim.keymap.set('n', '<leader>df', nvim_tree_api.toggle, { desc = 'nvim-tree: [d]isplay [f]iles (toggle)' })
