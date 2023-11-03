local on_attach = require('lsp.lsp-attach')
require 'lspconfig'.sourcekit.setup {
  name = 'sourcekit',
  cmd = { '/usr/bin/sourcekit-lsp' }
}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    on_attach(_, args.buf)
  end,
})
