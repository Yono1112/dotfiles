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

-- mapping settings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- setup lazy.nvim
require("lazy").setup({
  spec = {
     { import = "plugins" },
  },

  checker = {
    enabled = true,
  },
})
