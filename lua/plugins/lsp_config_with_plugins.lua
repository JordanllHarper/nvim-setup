local keybindings = function()
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
  vim.keymap.set('n', '<leader>z', '<Plug>PlenaryTestFile')
end
return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', },
    { 'williamboman/mason-lspconfig.nvim', },
    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim',                 config = true },
    {
      'folke/neodev.nvim',
      config = true
    },
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    require('mason').setup()
    require('mason-lspconfig').setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = keybindings,
        }
      end,
    }
  end
}
