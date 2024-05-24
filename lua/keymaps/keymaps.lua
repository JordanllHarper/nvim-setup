local function set(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end
-- Quickfix
vim.keymap.set('n', '<leader>qo', '<Cmd>copen<CR>', { silent = true, desc = '[Q]uickfix [O]pen' })

-- Terminal
vim.keymap.set('n', '<leader>t', '<Cmd>term<CR>', { silent = true, desc = '[T]erminal' })
vim.keymap.set('t', '<C-q>', '<C-\\><C-n>', { silent = true, desc = '[Q]uit terminal mode' })

-- Lsp
vim.keymap.set('n', '<leader>Li', '<Cmd>LspInfo<CR>', { silent = true, desc = '[L]sp [I]nfo' })
vim.keymap.set('n', '<leader>Lr', '<Cmd>LspRestart<CR>', { silent = true, desc = '[L]sp [R]estart' })

vim.keymap.set("n", "<leader>S", function()
	vim.cmd('luafile %')
	vim.notify("Resourcing current luafile ", vim.log.levels.INFO)
end, { desc = "[S]ource" })
-- -- Window resizing

local window_binding = '<C-w>'
set('n', '<M-.>', window_binding .. '5< ')
set('n', '<M-,>', window_binding .. '5>')
set('n', '<M-t>', window_binding .. '+')
set('n', '<M-s>', window_binding .. '-')
