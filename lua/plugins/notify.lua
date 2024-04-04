return {
  'rcarriga/nvim-notify',
  opts = {
    fps = 60,
    timeout = 7000
  },

  dependencies = {
    'nvim-telescope/telescope.nvim',
  },

  config = function(_, opts)
    require('notify').setup(opts)
    require('telescope').extensions.notify.notify(opts)
    vim.notify = require("notify")
  end
}
