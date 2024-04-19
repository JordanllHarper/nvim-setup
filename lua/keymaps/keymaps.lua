-- buffer commands
vim.keymap.set('n', '<leader>bd', '<Cmd>bd<CR>', { silent = true, desc = '[B]uffer [D]elete (current)' })

-- Quickfix
vim.keymap.set('n', '<leader>qa', ':vim', { silent = true, desc = '[Q]uickfix [A]dd' })
vim.keymap.set('n', '<leader>qo', '<Cmd>copen<CR>', { silent = true, desc = '[Q]uickfix [O]pen' })

-- Terminal
vim.keymap.set('n', '<leader>t', '<Cmd>term<CR>', { silent = true, desc = '[T]erminal' })
vim.keymap.set('t', '<C-q>', '<C-\\><C-n>', { silent = true, desc = '[Q]uit terminal mode' })

-- Lsp
vim.keymap.set('n', '<leader>Li', '<Cmd>LspInfo<CR>', { silent = true, desc = '[L]sp [I]nfo' })
vim.keymap.set('n', '<leader>Lr', '<Cmd>LspRestart<CR>', { silent = true, desc = '[L]sp [R]estart' })

-- Window resizing
vim.keymap.set('n', '<C-m>', '<Cmd>vertical resize +2<CR>', { silent = true, desc = 'Increase window height' })
vim.keymap.set('n', '<C-n>', '<Cmd>vertical resize -2 <CR>', { silent = true, desc = 'Decrease window height' })
vim.keymap.set('n', '<C-b>', '<Cmd>horizontal resize +2<CR>', { silent = true, desc = 'Increase window width' })
vim.keymap.set('n', '<C-s>', '<Cmd>horizontal resize -2<CR>', { silent = true, desc = 'Decrease window width' })
