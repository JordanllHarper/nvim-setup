return {
  'stevearc/overseer.nvim',
  opts = {
    templates = { 'builtin', "user.dart_build", "user.dart_test" },
  },
  config = function(_, opts)
    require('overseer').setup(opts)
    vim.keymap.set('n', '<leader>ot', require('overseer').toggle, { desc = "[O]verseer [T]oggle open/close" })
    vim.keymap.set('n', '<leader>or', require('overseer').run_template, { desc = "[O]verseer [R]un" })
  end
}
