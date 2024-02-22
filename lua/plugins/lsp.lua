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

          ["rust_analyzer"] = function()
            vim.g.rustaceanvim = {
              server = {
                on_attach = require('keymaps.lsp-attach')
              },
              dap = {
                autoload_configurations = true
              }
            }
          end,
          function(server_name)
            require('lspconfig')[server_name].setup {
              capabilities = capabilities,
              on_attach = require('keymaps.lsp-attach'),
            }
          end,

        }
      end
    },
    {
      'mrcjkb/rustaceanvim',
      version = '^4', -- Recommended
      ft = { 'rust' },
    }
