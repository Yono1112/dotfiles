return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").install({
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"typescript",
			"typescriptreact",
			"rust",
			"markdown",
			"markdown_inline",
			"terraform",
			"python",
			"yaml",
			"toml",
			"cpp",
			"bash",
			"javascript",
			"javascriptreact",
			"tsx",
		})
		-- }):wait()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"typescript",
				"typescriptreact",
				"tsx",
				"javascript",
				"html",
			},
			callback = function()
				vim.treesitter.start()
				vim.bo.commentstring = "// %s"
			end,
		})
	end,
}
