vim.keymap.set('n', '<leader>di', function() require("trouble").toggle() end, { desc = '[d]isplay [i]ssues' })
return {
  'folke/trouble.nvim',
  config = function()
    require("trouble").setup {
      opts = {
        auto_open = true,
        auto_close = true,
        use_diagnostic_signs = true
      }
    }
  end
}
