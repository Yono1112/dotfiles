return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install({
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "typescript",
      "rust",
      "markdown",
      "markdown_inline",
      "terraform",
      "python",
      "yaml",
      "toml",
      "cpp",
      "bash",
      "javascript",
    })
    -- }):wait()
  end,
}
