return {
  'github/copilot.vim',
  config = function()
    -- Copilot bindings
    vim.keymap.set('i', '<A-j>', 'copilot#Accept(\"<CR>\")', {
      expr = true,
      replace_keycodes = false
    })
  end
}
