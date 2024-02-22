-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


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
vim.keymap.set('n', '<leader>fo', require('flutter-tools.outline').toggle, { desc = '[F]lutter [O]utline' })

-- Lazygit
vim.keymap.set('n', '<leader>lg', require('lazygit').lazygit, { desc = '[L]azy[G]it' })
