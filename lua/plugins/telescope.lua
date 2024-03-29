local default_keymaps = {
  ['<C-u>'] = false,
  ['<C-d>'] = false,

  ['<C-j>'] = function(prompt_bufnr)
    require('telescope.actions').move_selection_next(prompt_bufnr)
  end,
  ['<C-k>'] = function(prompt_bufnr)
    require('telescope.actions').move_selection_previous(prompt_bufnr)
  end,
}
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    keys = {
      { ':', '<Cmd>Telescope cmdline<CR>', desc = 'Cmdline' }
    },
  },
  opts = {
    defaults = {
      layout_strategy = 'horizontal',
      layout_config = {
        prompt_position = 'top',
      },
      mappings = {
        n = default_keymaps,
        i = default_keymaps,
      },
    },
    extensions = {
      cmdline = {}
    }
  },



  config = function(_, opts)
    require('telescope').setup(opts)

    -- telescope keymaps
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>sR', require('telescope.builtin').registers, { desc = '[S]earch [R]egisters' })
    vim.keymap.set('n', '<leader>sk', require('telescope.builtin').registers, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>st', require('telescope.builtin').builtin, { desc = '[S]earch [T]elescope' })
    vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
      { desc = '[W]orkspace [S]ymbols' })
    vim.keymap.set('n', '<leader>sq', require('telescope.builtin').quickfix,
      { desc = '[S]earch [Q]uick Fix' })

    vim.keymap.set('n', '<leader>wD', require('telescope.builtin').lsp_document_symbols,
      { desc = '[W]orkspace [D]ocument symbols' })

    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').diagnostics,
      { desc = '[S]earch [W]orkspace diagnostics' })
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
  end
}
