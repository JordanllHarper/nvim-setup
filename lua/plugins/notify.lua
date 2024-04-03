return {
  'rcarriga/nvim-notify',
  opts = {
    fps = 60,
    timeout = 7000
  },

  config = function(_, opts)
    require('notify').setup(opts)
    vim.notify = require("notify")
  end
}
