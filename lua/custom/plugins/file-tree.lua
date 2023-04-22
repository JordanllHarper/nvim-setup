return {
  --File tree
  --File ops in file tree
  'kyazdani42/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  config = function()
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
  end
}
