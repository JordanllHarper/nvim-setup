return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', },
    { 'williamboman/mason-lspconfig.nvim', },
    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim',                 tag = 'legacy', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    {
      'folke/neodev.nvim',
      opts = {}
    },
  },
  config = function()
    local servers = require('lsp.mason_servers')
    local on_attach = require('lsp.lsp-attach')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    require('mason').setup()
    local mason_lspconfig = require 'mason-lspconfig'
    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }
    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }
  end
}
