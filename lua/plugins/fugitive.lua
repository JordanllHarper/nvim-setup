return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gc', '<Cmd>Git commit<CR>', { desc = '[G]it [C]ommit' })
  end
}
