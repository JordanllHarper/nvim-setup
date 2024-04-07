return function(_, bufnr)
	local telescope_builtin = require('telescope.builtin')
	local nmap = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end
	local leaderNmap = function(keys, func, desc)
		vim.keymap.set('n', '<leader>' .. keys, func, { buffer = bufnr, desc = desc })
	end
	leaderNmap('h', vim.lsp.buf.hover)
	leaderNmap('rn', vim.lsp.buf.rename, '[R]e[N]ame')
	leaderNmap('H', vim.lsp.buf.signature_help, 'Signature [H]elp')

	nmap('gd', telescope_builtin.lsp_definitions, '[G]oto [D]efinition')
	nmap('gr', telescope_builtin.lsp_references, '[G]oto [R]eferences')
	nmap('gI', telescope_builtin.lsp_implementations, '[G]oto [I]mplementation')

	leaderNmap('T', telescope_builtin.lsp_type_definitions, 'Type [D]efinition')
	leaderNmap('ds', telescope_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
	leaderNmap('ws', telescope_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })

	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
	vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open [E]rror float' })

	vim.keymap.set({ "v", "n" }, "<A-CR>", require("actions-preview").code_actions)
end
