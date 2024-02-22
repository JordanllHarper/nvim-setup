return {

  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    -- Lazygit
    vim.keymap.set('n', '<leader>lg', require('lazygit').lazygit, { desc = '[L]azy[G]it' })
  end
}
