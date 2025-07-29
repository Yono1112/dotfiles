return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- (Package list)[https://mason-registry.dev/registry/list]
        ensure_installed = {
          "ts_ls",
          "rust_analyzer",
          "terraformls",
          "marksman",
        },
      })
    end,
  },
}
