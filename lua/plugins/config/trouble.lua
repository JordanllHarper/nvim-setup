local opts = {
  action_keys = {
    hover = '<leader>h',
  }
}
require 'trouble'.setup(opts)

vim.keymap.set('n', '<leader>wd', require('trouble').toggle, { silent = true, desc = '[W]orkspace [D]iagnostics' })
