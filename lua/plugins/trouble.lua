return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('trouble').setup {
      action_keys = {
        hover = '<leader>h'
      }
    }
    vim.keymap.set('n', '<leader>wd', require('trouble').toggle(), { silent = true, desc = '[W]orkspace [D]iagnostics' })
  end,
}
