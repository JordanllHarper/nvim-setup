-- buffer commands
vim.keymap.set('n', '<leader>bd', '<Cmd>bd<CR>', { silent = true, desc = '[B]uffer [D]elete (current)' })
vim.keymap.set('n', '<leader>bD', '<Cmd>.,$-bdelete<CR>', { silent = true, desc = '[B]uffer [D]elete (all)' })
