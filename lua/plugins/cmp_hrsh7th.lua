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
      require 'plugins.config.cmp_hrsh7th'
    end,
  }
}
