return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', },
    { 'williamboman/mason-lspconfig.nvim', },
    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim',                 opts = {} },
    {
      'folke/neodev.nvim',
      opts = {}
    },
  },
  config = function()
    local on_attach_keymaps = require('keymaps.lsp-attach')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    require('mason').setup()
    require('mason-lspconfig').setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach_keymaps,
        }
      end,
    }
  end
}
