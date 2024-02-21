return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  opts = {
    widget_guides = {
      enabled = true,
    },
    dev_tools = {
      autostart = true
    },
    lsp = {
      color = {
        enabled = true,
      }
    },
  },
}