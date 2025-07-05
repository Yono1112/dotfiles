return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      sort_by = "name",
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    },
  },
}
