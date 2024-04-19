return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', },
    { 'williamboman/mason-lspconfig.nvim', },
    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim',                 opts = {} },
    { 'folke/neodev.nvim',                 opts = {} },
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    vim.diagnostic.config({
      virtual_text = {
        severity = vim.diagnostic.severity.E
      }
    })

    require('mason').setup()
    require('mason-lspconfig').setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = require('keymaps.lsp-attach'),
        }
      end,
    }
  end
}
