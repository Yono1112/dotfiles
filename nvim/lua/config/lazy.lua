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

opt.termguicolors = true

-- gitsign用のsigncolumnを常に表示する
opt.signcolumn = "yes"

-- mapping settings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- key mappings
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {
  desc = 'Toggle nvim-tree file explorer'
})

-- Custom clipboard mappings for yank operations
-- These mappings ensure yank operations copy to system clipboard
-- while delete operations use the default register
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y', { desc = 'Yank line to clipboard' })
vim.keymap.set({'n', 'v'}, 'y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set({'n', 'v'}, 'Y', '"+Y', { desc = 'Yank line to clipboard' })

-- Paste from clipboard
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>P', '"+P', { desc = 'Paste from clipboard before' })

-- setup lazy.nvim
require("lazy").setup({
  spec = {
     { import = "plugins" },
  },

  checker = {
    enabled = true,
  },
})
