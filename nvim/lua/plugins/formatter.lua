return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				tsx = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
			},
		})
	end,
}
