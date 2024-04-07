return {
  'rcarriga/nvim-notify',
  opts = {
    fps = 60,
    timeout = 6000,
    render = "compact"
  },

  dependencies = {
    'nvim-telescope/telescope.nvim',
  },

  config = function(_, opts)
    require('notify').setup(opts)
    vim.keymap.set('n', '<leader>sn', require('telescope').extensions.notify.notify)
    vim.notify = require("notify")
  end
}
