return {
  'stevearc/overseer.nvim',
  opts = {
    templates = { 'builtin', "user.dart_build", "user.dart_test" },
    task_list = {
      bindings = {
        -- disable so we can use C-j/k to navigate
        ["<C-k>"] = false,
        ["<C-j>"] = false,
        ["<C-l>"] = false,
        ["<C-h>"] = false,
      }
    }
  },
  config = function(_, opts)
    require('overseer').setup(opts)
    vim.keymap.set('n', '<leader>ot', require('overseer').toggle, { desc = "[O]verseer [T]oggle open/close" })
    vim.keymap.set('n', '<leader>or', require('overseer').run_template, { desc = "[O]verseer [R]un" })
  end
}
