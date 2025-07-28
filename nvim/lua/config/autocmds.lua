local api = vim.api

local ts_group = api.nvim_create_augroup("MyTreesitter", { clear = true })

api.nvim_create_autocmd("FileType", {
  group = ts_group,
  pattern = "*", -- all files
  callback = function()
    -- enable highlight
    vim.treesitter.start()

    -- enable indent
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
