local flutter_key_bindings = function()
	vim.keymap.set('n', '<leader>frl', require('flutter-tools.commands').reload, { desc = '[F]lutter [R]e[L]oad' })
	vim.keymap.set('n', '<leader>frs', require('flutter-tools.commands').restart, { desc = '[F]lutter [R]e[S]tart' })
	vim.keymap.set('n', '<leader>fs', require('flutter-tools.commands').run, { desc = '[F]lutter [S]tart (Run)' })
	vim.keymap.set('n', '<leader>fq', require('flutter-tools.commands').quit, { desc = '[F]lutter [Q]uit' })
	vim.keymap.set('n', '<leader>fe', "<Cmd>FlutterEmulators<CR>", { desc = '[F]lutter [E]mulators' })
	vim.keymap.set('n', '<leader>fo', require('flutter-tools.outline').toggle, { desc = '[F]lutter [O]utline' })
	vim.keymap.set('n', '<leader>fc', require('flutter-tools.log').clear, { desc = '[F]lutter [C]lear' })
end

return {
	-- 'akinsho/flutter-tools.nvim',
	--
	-- dev = true,
	dir = "~/dev/flutter-tools.nvim",
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'stevearc/dressing.nvim',
			opts = {
				input = {
					enabled = false
				}
			}
		},
	},
	opts = {
		fvm = true,
		lsp = {
			on_attach = function(_, bufnr)
				require('keymaps.lsp-attach')(_, bufnr)
				flutter_key_bindings()
			end,
			color = {
				enabled = true,
			},
		},
		widget_guides = {
			enabled = true,
		},
	},
	config = function(_, opts)
		require('flutter-tools').setup(opts)
		local f_emu_config = require('additional-config.flutter-emulator-cfg')
		require('flutter-tools').setup_project(f_emu_config)
		require('telescope').load_extension("flutter")
	end
}
