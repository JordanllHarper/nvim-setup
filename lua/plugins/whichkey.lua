return {
  'folke/which-key.nvim',
  config = function()
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]isplay', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = '[H]over', _ = 'which_key_ignore' },
      ['<leader>nf'] = { name = '[F]...', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = '[L]azy', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>n'] = { name = '[N]vim Tree', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
    }
  end
}
