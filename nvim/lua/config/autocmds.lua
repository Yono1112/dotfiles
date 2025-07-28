local api = vim.api

local ts_group = api.nvim_create_augroup("MyTreesitter", { clear = true })

api.nvim_create_autocmd("FileType", {
  group = ts_group,
  pattern = "*", -- all files
  callback = function()
    local excluded_filetypes = {
      "NvimTree",
      "TelescopePrompt",
      "TelescopeResults",
      "lazy",
      "mason",
      "Trouble",
      "help",
    }

    -- 現在のファイルタイプが除外リストに含まれていれば、処理を中断
    if vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then
      return
    end

    -- enable highlight
    vim.treesitter.start()

    -- enable indent
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
