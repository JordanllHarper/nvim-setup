-- My NVIM init :)
-- Based on kickstart.nvim by https://github.com/tjdevries (go check him out!)
-- Notes for me to remember
-- <C> = Ctrl
-- <CR> = Enter/Return
-- <A> = Alt/Option
require('keymaps.keymaps')
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
  opts = {
    install = { colorscheme = { "tokyonight", } },
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

    }
  },
  { import = 'plugins' },
  { import = 'themes' },
}, {})
vim.keymap.set('n', "<leader>ln", "<Cmd>:Lazy<CR>", { desc = "[L]azy [N]vim" })
require('additional-config.augroups')
require('additional-config.autoformat')
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
