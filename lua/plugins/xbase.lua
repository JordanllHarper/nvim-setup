return {
  build = 'make install',
  'xbase-lab/xbase',
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    -- "stevearc/dressing.nvim", -- optional (in case you don't use telescope)
  },
  opts = {}
}
