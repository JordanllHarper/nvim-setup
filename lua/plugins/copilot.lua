return {
  'github/copilot.vim',
  config = function()
    -- Copilot bindings
    vim.keymap.set('i', '<C-a>', 'copilot#Accept(\"<CR>\")', {
      expr = true,
      replace_keycodes = false
    })
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_enabled = false

    vim.keymap.set('n', '<leader>ce', '<Cmd>Copilot enable<CR>', {
      desc = "[C]opilot [E]nable"
    })

    vim.keymap.set('n', '<leader>cd', '<Cmd>Copilot disable<CR>', {
      desc = "[C]opilot [D]isable"
    })
  end
}
