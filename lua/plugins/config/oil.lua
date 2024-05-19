local opts = {
  -- Disable so we can move
  ["<C-h>"] = false,
  ["<C-l>"] = false,
  ["<C-j>"] = false,
  ["<C-k>"] = false,
}
require('oil').setup(opts)
vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "[-] Oil" })
