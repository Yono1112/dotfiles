return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "moon",
			transparent = true,
			-- nvim-treeの背景色を透明に
			on_highlights = function(hl, c)
				hl.NvimTreeNormal = {
					bg = "none",
					fg = c.fg_sidebar,
				}
				hl.NvimTreeNormalNC = {
					bg = "none",
					fg = c.fg_sidebar,
				}
			end,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
			vim.api.nvim_set_hl(0, "WinSeparator", {
				fg = "#3b4261",
			})
		end,
	},
}
