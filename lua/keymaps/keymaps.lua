local function map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end
-- Quickfix
map('n', '<leader>qo', '<Cmd>copen<CR>', '[Q]uickfix [O]pen')

-- Terminal
map('n', '<leader>t', '<Cmd>term<CR>', '[T]erminal')
map('t', '<C-q>', '<C-\\><C-n>', '[Q]uit terminal mode')

-- Lsp
map('n', '<leader>Li', '<Cmd>LspInfo<CR>', '[L]sp [I]nfo')
map('n', '<leader>Lr', '<Cmd>LspRestart<CR>', '[L]sp [R]estart')

vim.keymap.set("n", "<leader>S", function()
	vim.cmd('luafile %')
	vim.notify("Resourcing current luafile ", vim.log.levels.INFO)
end, { desc = "[S]ource" })
-- -- Window resizing

local window_binding = '<C-w>'
map('n', '<M-.>', window_binding .. '5< ', 'Shrink pane')
map('n', '<M-,>', window_binding .. '5>', 'Widen pane')
map('n', '<M-t>', window_binding .. '+', 'Taller pane')
map('n', '<M-s>', window_binding .. '-', 'Shorter pane')

-- Tabs

map('n', '<leader>u', "<Cmd>tabprevious<CR>", "Previous tab")
map('n', '<leader>p', "<Cmd>tabnext<CR>", "Next tab")
