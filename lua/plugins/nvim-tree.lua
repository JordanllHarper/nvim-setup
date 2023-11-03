return {
  'nvim-tree/nvim-tree.lua',
  opts = {
    sort_by = "case_sensitive",
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
    },
    disable_netrw = false
  }
}
