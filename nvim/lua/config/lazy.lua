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

opt.hidden = true

-- gitsign用のsigncolumnを常に表示する
opt.signcolumn = "yes"

-- mapping settings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- key mappings
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {
	desc = "nvim-treeをトグルする",
})

-- クリップボード操作: y/pは通常レジスタ、<leader>y/pはシステムクリップボード
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "クリップボードにヤンク" })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', { desc = "行をクリップボードにヤンク" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "クリップボードからペースト" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "クリップボードから前にペースト" })
vim.keymap.set("n", "<leader>ya", "ma:%y+<CR>`a", {
	desc = "ファイル全体をクリップボードにコピー",
})

-- setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},

	checker = {
		enabled = false,
	},
})
