return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  ft = { 'rust' },
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = require('keymaps.lsp-attach')
      },
    }
  end
}
