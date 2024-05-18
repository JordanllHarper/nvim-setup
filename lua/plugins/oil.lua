return {
  'stevearc/oil.nvim',
  opts = {
    -- Disable so we can move
    ["<C-h>"] = false,
    ["<C-l>"] = false,
    ["<C-j>"] = false,
    ["<C-k>"] = false,
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(_, opts)
    require('oil').setup(opts)
    vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "[-] Oil" })
  end
}
