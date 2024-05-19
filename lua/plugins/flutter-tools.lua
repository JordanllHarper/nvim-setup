local flutter_key_bindings = function()
	vim.keymap.set('n', '<leader>frl', require('flutter-tools.commands').reload, { desc = '[F]lutter [R]e[L]oad' })
	vim.keymap.set('n', '<leader>frs', require('flutter-tools.commands').restart, { desc = '[F]lutter [R]e[S]tart' })
	vim.keymap.set('n', '<leader>fs', require('flutter-tools.commands').run, { desc = '[F]lutter [S]tart (Run)' })
	vim.keymap.set('n', '<leader>fq', require('flutter-tools.commands').quit, { desc = '[F]lutter [Q]uit' })
	vim.keymap.set('n', '<leader>fe', "<Cmd>FlutterEmulators<CR>", { desc = '[F]lutter [E]mulators' })
	vim.keymap.set('n', '<leader>fo', require('flutter-tools.outline').toggle, { desc = '[F]lutter [O]utline' })
	vim.keymap.set('n', '<leader>fc', require('flutter-tools.log').clear, { desc = '[F]lutter [C]lear' })
	vim.keymap.set('n', '<leader>fl', require('flutter-tools.lsp').restart, { desc = '[F]lutter [L]sp Restart' })
end

return {
	'akinsho/flutter-tools.nvim',
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
		'rcarriga/nvim-notify',
	},
	config = function()
		require 'plugins.config.flutter-tools'
	end
}
