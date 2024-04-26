-- My NVIM init :)
-- Based on kickstart.nvim by https://github.com/tjdevries (go check him out!)
-- Notes for me to remember
-- <C> = Ctrl
-- <CR> = Enter/Return
-- <A> = Alt/Option
--
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

require('additional-config.vim-config')
-- install package manager
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  defaults = {
    lazy = true
  },
  checker = {
    enabled = true
  },
  profiling = {
    loading = true,
    require = true,
  },
  performance = {
    enabled = true,
  },
  { import = 'plugins' },
  { import = 'themes' },
  {}
})
vim.cmd [[colorscheme tokyonight]]
vim.keymap.set('n', "<leader>ln", "<Cmd>Lazy<CR>", { desc = "[L]azy [N]vim" })
vim.keymap.set('n', "<leader>lr", ":Lazy reload", { desc = "[L]azy reload" })
require('keymaps.keymaps')
require('additional-config.augroups')
require('additional-config.autoformat')
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
