local function create_opts(desc)
	return { noremap = true, silent = true, desc = desc }
end
return function(_, bufnr)
	local telescope_builtin = require('telescope.builtin')
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'lsp: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end
	local leaderNmap = function(keys, func, desc)
		if desc then
			desc = 'lsp: ' .. desc
		end

		vim.keymap.set('n', '<leader>' .. keys, func, { buffer = bufnr, desc = desc })
	end
	leaderNmap('h', vim.lsp.buf.hover, 'hover')
	leaderNmap('rn', vim.lsp.buf.rename, '[R]e[N]ame')

	nmap('gd', telescope_builtin.lsp_definitions, '[G]oto [D]efinition')
	nmap('gr', telescope_builtin.lsp_references, '[G]oto [R]eferences')
	nmap('gI', telescope_builtin.lsp_implementations, '[G]oto [I]mplementation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	leaderNmap('D', telescope_builtin.lsp_type_definitions, 'Type [D]efinition')
	leaderNmap('ds', telescope_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
	leaderNmap('ws', telescope_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	-- Copilot bindings
	vim.keymap.set('i', '<C-J>', 'copilot#Accept(\"<CR>\")', {
		expr = true,
		replace_keycodes = false
	})
	vim.g.copilot_no_tab_map = true


	local map = vim.api.nvim_set_keymap

	-- Move to previous/next
	map('n', '<leader>tp', '<Cmd>BufferPrevious<CR>', { desc = "[t]ab [p]revious" })
	map('n', '<leader>tn', '<Cmd>BufferNext<CR>', { desc = "[t]ab [n]ext" })
	-- Pin/unpin buffer
	map('n', '<A-p>', '<Cmd>BufferPin<CR>', create_opts('buffer pin'))
	-- Close buffer
	map('n', '<leader>tx', '<Cmd>BufferClose<CR>', create_opts("[t]ab cross"))
	-- Wipeout buffer
	-- Magic buffer-picking mode
	map('n', '<leader>tt', '<Cmd>BufferPick<CR>', create_opts('Pick buffer'))


	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end
