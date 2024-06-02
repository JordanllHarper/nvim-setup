return function(_, bufnr)
	local nmap = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	local imap = function(keys, func, desc)
		vim.keymap.set('i', keys, func, { buffer = bufnr, desc = desc })
	end
	local leaderNmap = function(keys, func, desc)
		vim.keymap.set('n', '<leader>' .. keys, func, { buffer = bufnr, desc = desc })
	end


	leaderNmap('h', vim.lsp.buf.hover, '[H]over')
	leaderNmap('rn', vim.lsp.buf.rename, '[R]e[N]ame')
	imap('<C-i>', vim.lsp.buf.signature_help, 'Signature [H]elp')

	nmap('[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic message')
	nmap(']d', vim.diagnostic.goto_next, 'Go to next diagnostic message')

	leaderNmap('e', vim.diagnostic.open_float, 'Open [E]rror float')

	vim.keymap.set({ "v", "n" }, "<A-CR>", require("actions-preview").code_actions)

	vim.keymap.set('i', "<C-n>", "<C-x><C-o>")

	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })


	-- telescope lsp keymaps

	local telescope_builtin = require('telescope.builtin')
	nmap('gd', telescope_builtin.lsp_definitions, '[G]oto [D]efinition')
	nmap('gr', telescope_builtin.lsp_references, '[G]oto [R]eferences')
	nmap('gI', telescope_builtin.lsp_implementations, '[G]oto [I]mplementation')

	leaderNmap('T', telescope_builtin.lsp_type_definitions, '[T]ype Definition')
	leaderNmap('ds', telescope_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
	leaderNmap('ws', telescope_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	leaderNmap('sd', function() require('telescope.builtin').diagnostics { bufnr = 0 } end,
		'[S]earch [D]iagnostics (current buffer)')

	leaderNmap('sD', require('telescope.builtin').diagnostics, '[S]earch [D]iagnostics')

	leaderNmap('ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
		'[W]orkspace [S]ymbols')
end
