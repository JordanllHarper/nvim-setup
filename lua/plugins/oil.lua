return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(_, opts)
    require('oil').setup(opts)
    vim.keymap.set('n', '<leader>O', "<Cmd>Oil<CR>", { desc = '[O]il [O]pen' })
  end
}
