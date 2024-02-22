vim.diagnostic.config(
	{
		signs = true
	}

)
vim.lsp.omnifunc(1, 0)
-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Enable scroll off
vim.o.scrolloff = 5

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
