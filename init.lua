-- My NVIM init :)
-- Based on kickstart.nvim by https://github.com/tjdevries (go check him out!)
-- Notes for me to remember
-- <C> = Ctrl
-- <CR> = Enter/Return
-- <A> = Alt/Option
require('keymaps.before.keymaps')
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
  { import = 'plugins' },
  { import = 'themes' },
}, {})
require('keymaps.after.keymaps')
require('additional-config.augroups')
require('additional-config.autoformat')
require('additional-config.treesitter-setup')
require('additional-config.vim-config')
require('lsp.cmp-setup')
require('lsp.sourcekit-setup')
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
