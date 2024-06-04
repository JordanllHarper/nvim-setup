local leaderNmap = require 'utils'.leaderNmap
local opts = {
  action_keys = {
    hover = '<leader>h',
  }
}
require 'trouble'.setup(opts)

leaderNmap('wd', require('trouble').toggle, '[W]orkspace [D]iagnostics')
