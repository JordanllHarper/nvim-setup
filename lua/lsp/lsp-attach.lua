return function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'lsp: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end


	nmap('<leader>dt', vim.lsp.buf.hover, '[d]isplay [t]ype')
	nmap('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')

	nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
	nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[w]orkspace [a]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[w]orkspace [r]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[w]orkspace [l]ist Folders')
	-- tabs keybindings

	local map = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }

	-- Move to previous/next
	map('n', '<leader>tp', '<Cmd>BufferPrevious<CR>', { desc = "[t]ab [p]revious" })
	map('n', '<leader>tn', '<Cmd>BufferNext<CR>', { desc = "[t]ab [n]ext" })
	-- Pin/unpin buffer
	map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
	-- Close buffer
	map('n', '<leader>tx', '<Cmd>BufferClose<CR>', { desc = "[t]ab cross" })
	-- Wipeout buffer
	--                 :BufferWipeout
	-- Close commands
	--                 :BufferCloseAllButCurrent
	--                 :BufferCloseAllButPinned
	--                 :BufferCloseAllButCurrentOrPinned
	--                 :BufferCloseBuffersLeft
	--                 :BufferCloseBuffersRight
	-- Magic buffer-picking mode
	map('n', '<leader>tt', '<Cmd>BufferPick<CR>', opts)
	-- Sort automatically by...
	map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
	map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
	map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
	map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end
