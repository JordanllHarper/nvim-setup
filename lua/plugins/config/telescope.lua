local default_keymaps = {
  ['<C-b>'] = function(prompt_bufnr)
    require('telescope.actions').delete_buffer(prompt_bufnr)
  end,
}
local opts = {
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
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  }
}
local fb_actions = require('telescope').extensions.file_browser.actions
opts.extensions.file_browser = {
  mappings = {
    ["n"] = {
      ['<C-a>'] = fb_actions.create_from_prompt,
      ['<C-d>'] = fb_actions.remove,
    },
  }
}

require('telescope').setup(opts)
require('telescope').load_extension 'fzf'
require('telescope').load_extension 'file_browser'

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

vim.keymap.set('n', '<leader>sF', function() require('telescope.builtin').find_files { hidden = true, } end,
  { desc = '[S]earch All [F]iles (including hidden)' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files,
  { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sH', require('telescope.builtin').search_history, { desc = '[S]earch [H]istory' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', require('telescope.builtin').git_bcommits, { desc = '[S]earch [G]it commits' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').git_status, { desc = '[S]earch [S]tatus' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>sR', require('telescope.builtin').registers, { desc = '[S]earch [R]egisters' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>st', require('telescope.builtin').builtin, { desc = '[S]earch [T]elescope' })
vim.keymap.set('n', '<leader>sq', require('telescope.builtin').quickfix,
  { desc = '[S]earch [Q]uick Fix' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,
  { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sb', require('telescope').extensions.file_browser.file_browser,
  { desc = '[S]earch [B]rowser' })

vim.keymap.set('n', '<leader>C', function()
    require('telescope').extensions.file_browser.file_browser { path = "~/.config/nvim" }
  end,
  { desc = '[S]earch  [C]onfiguration' })
