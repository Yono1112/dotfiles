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

-- Override delete operations to use black hole register (prevent clipboard copy)
vim.keymap.set('n', 'd', '"_d', { desc = 'Delete without copying to clipboard' })
vim.keymap.set('x', 'd', '"_d', { desc = 'Delete without copying to clipboard' })
vim.keymap.set('n', 'dd', '"_dd', { desc = 'Delete line without copying to clipboard' })
vim.keymap.set('n', 'D', '"_D', { desc = 'Delete to end of line without copying to clipboard' })
vim.keymap.set('n', 'x', '"_x', { desc = 'Delete character without copying to clipboard' })
vim.keymap.set('n', 'X', '"_X', { desc = 'Delete character before cursor without copying to clipboard' })
vim.keymap.set('n', 'c', '"_c', { desc = 'Change without copying to clipboard' })
vim.keymap.set('x', 'c', '"_c', { desc = 'Change without copying to clipboard' })
vim.keymap.set('n', 'C', '"_C', { desc = 'Change to end of line without copying to clipboard' })
vim.keymap.set('n', 's', '"_s', { desc = 'Substitute character without copying to clipboard' })
vim.keymap.set('n', 'S', '"_S', { desc = 'Substitute line without copying to clipboard' })

-- setup lazy.nvim
require("lazy").setup({
  spec = {
     { import = "plugins" },
  },

  checker = {
    enabled = true,
  },
})
