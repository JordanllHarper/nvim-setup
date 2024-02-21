local nvim_tree_api = require "nvim-tree.api".tree

vim.keymap.set('n', '<leader>df', nvim_tree_api.toggle, { desc = 'nvim-tree: [D]isplay [F]iles (toggle)' })
vim.keymap.set('n', '<leader>dt', nvim_tree_api.find_file, { desc = 'nvim-tree: [D]isplay in [T]ree (toggle)' })

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Set code actions
vim.keymap.set({ "v", "n" }, "<A-CR>", require("actions-preview").code_actions)

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

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
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<leader>z', '<Plug>PlenaryTestFile')

-- Flutter
vim.keymap.set('n', '<leader>frl', require('flutter-tools.commands').reload, { desc = '[F]lutter [R]e[L]oad' })
vim.keymap.set('n', '<leader>frs', require('flutter-tools.commands').reload, { desc = '[F]lutter [R]e[S]tart' })
vim.keymap.set('n', '<leader>fs', require('flutter-tools.commands').run, { desc = '[F]lutter [S]tart (Run)' })
vim.keymap.set('n', '<leader>fq', require('flutter-tools.commands').quit, { desc = '[F]lutter [Q]uit' })
vim.keymap.set('n', '<leader>fe', ":FlutterEmulators", { desc = '[F]lutter [E]mulators' })

-- Lazygit
vim.keymap.set('n', '<leader>lg', require('lazygit').lazygit, { desc = '[L]azy[G]it' })
