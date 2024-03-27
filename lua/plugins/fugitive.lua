return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gc', '<Cmd>Git commit<CR>', { desc = '[G]it [C]ommit' })
    vim.keymap.set('n', '<leader>gp', '<Cmd>Git push<CR>', { desc = '[G]it [P]ush' })
  end
}
