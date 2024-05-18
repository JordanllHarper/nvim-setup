return {
  lazy = true,
  {
    'hrsh7th/cmp-cmdline',
  },
  {
    'hrsh7th/cmp-buffer',
  },
  {
    'hrsh7th/cmp-path',
  },
  {
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
      },
      { 'saadparwaiz1/cmp_luasnip' },

      -- Adds LSP completion capabilities
      { 'hrsh7th/cmp-nvim-lsp' },

      -- Adds a number of user-friendly snippets
      { 'rafamadriz/friendly-snippets' },

      { 'onsails/lspkind.nvim',        config = function() require('lspkind').init() end }
    },

    'hrsh7th/nvim-cmp',


    -- !! Configuration !!
    config = function()
      local cmp = require 'cmp'
      local ls = require 'luasnip'
      local lspkind = require 'lspkind'
      require('luasnip.loaders.from_vscode').lazy_load()
      ls.config.setup {
        setup = {
          enable_autosnippets = true,
        },
      }


      for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
        loadfile(ft_path)()
      end


      vim.keymap.set({ 'i', 's' }, "<C-k>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, "<C-j>", function()
        if ls.jumpable() then
          ls.jump(-1)
        end
      end, { silent = true })

      cmp.setup {
        formatting = {
          format = lspkind.cmp_format(),
        },
        snippet = {
          expand = function(args)
            ls.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-h>'] = cmp.mapping.complete {},
          ['<C-l>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          },
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'crates' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'nvim_lsp_document_symbol' },
        },
      }

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'nvim_lsp_document_symbol' }
        }, {
          { name = 'buffer' }
        })
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          {
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          })
      })
    end,
  }
}
