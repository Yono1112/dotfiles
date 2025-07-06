-- diable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- vim.opt settings
vim.opt.rtp:prepend(lazypath)
local opt = vim.opt
local cmd = vim.cmd

opt.number = true
opt.cursorline = true

opt.swapfile = false

opt.clipboard = 'unnamedplus'

-- gitsign用のsigncolumnを常に表示する
opt.signcolumn = "yes"

-- mapping settings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- key mappings
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {
  desc = 'Toggle nvim-tree file explorer'
})

-- setup lazy.nvim
require("lazy").setup({
  spec = {
     { import = "plugins" },
  },

  checker = {
    enabled = true,
  },
})
