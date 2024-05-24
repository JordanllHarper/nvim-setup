local opts = {
  lsp_cfg = {
    capabilities = require 'lsp.capabilities',
  },
  lsp_on_attach = require('lsp.on-attach')
}
require("go").setup(opts)

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimports()
  end,
  group = format_sync_grp,
})
