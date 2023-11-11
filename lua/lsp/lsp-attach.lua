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
	nmap('<leader>h', vim.lsp.buf.hover, 'hover')
	nmap('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')

	nmap('gd', telescope_builtin.lsp_definitions, '[G]oto [D]efinition')
	nmap('gr', telescope_builtin.lsp_references, '[G]oto [R]eferences')
	nmap('gI', telescope_builtin.lsp_implementations, '[G]oto [I]mplementation')
	nmap('<leader>D', telescope_builtin.lsp_type_definitions, 'Type [D]efinition')
	nmap('<leader>ds', telescope_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', telescope_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
	nmap('<leader>ws', telescope_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[w]orkspace [a]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[w]orkspace [r]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[w]orkspace [l]ist Folders')
	-- tabs keybindings

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
	-- Sort automatically by...
	map('n', '<Space>bn', '<Cmd>BufferOrderByBufferNumber<CR>', create_opts('Order [b]uffer by [n]umber'))
	map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', create_opts('Order [b]uffer by [d]ir'))
	map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', create_opts('Order [b]uffer by [l]anguage'))
	map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', create_opts('Order [b]uffer by [w]indow num'))

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end
