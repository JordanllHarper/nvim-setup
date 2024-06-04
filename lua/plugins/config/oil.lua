local nmap = require('utils').nmap
local opts = {
  -- Disable so we can move
  ["<C-h>"] = false,
  ["<C-l>"] = false,
  ["<C-j>"] = false,
  ["<C-k>"] = false,
}
require('oil').setup(opts)
nmap("-", "<Cmd>Oil<CR>", "[-] Oil")
