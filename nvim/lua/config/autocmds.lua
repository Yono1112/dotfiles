local api = vim.api

local ts_group = api.nvim_create_augroup("MyTreesitter", { clear = true })

local target_languages = {
  "lua",
  "typescript",
  "rust",
  "markdown",
  "terraform",
  "python",
}

api.nvim_create_autocmd("FileType", {
  group = ts_group,
  callback = function()
    if vim.tbl_contains(target_languages, vim.bo.filetype) then
      vim.treesitter.start()
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
