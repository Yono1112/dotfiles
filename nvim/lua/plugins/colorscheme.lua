return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon",
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
      vim.api.nvim_set_hl(0, "WinSeparator", {
        fg = "#3b4261",
      })
    end,
  },
}
