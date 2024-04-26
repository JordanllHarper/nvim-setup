nmap = function(key, result, desc)
	vim.api.nvim_set_keymap('n', key, result, { noremap = true, silent = true, desc })
end
