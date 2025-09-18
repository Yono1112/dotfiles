return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		direction = "horizontal",
		start_in_insert = true,
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		vim.keymap.set("n", "<leader>j", "<Cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })

		function _G.set_terminal_keymaps()
			local t_opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], t_opts)
			vim.keymap.set("t", "<C-w-h>", [[<Cmd>wincmd h<CR>]], t_opts)
			vim.keymap.set("t", "<C-w-j>", [[<Cmd>wincmd j<CR>]], t_opts)
			vim.keymap.set("t", "<C-w-k>", [[<Cmd>wincmd k<CR>]], t_opts)
			vim.keymap.set("t", "<C-w-l>", [[<Cmd>wincmd l<CR>]], t_opts)
		end

		vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
		local Terminal = require("toggleterm.terminal").Terminal
		local horizontal_term = Terminal:new({ direction = "horizontal", count = 2 })
		local vertical_term_1 = Terminal:new({ direction = "vertical", count = 3 })
		local vertical_term_2 = Terminal:new({ direction = "vertical", count = 4 })

		-- 水平ターミナルをトグルするキーマップ
		vim.keymap.set("n", "<leader>th", function()
			horizontal_term:toggle()
		end, { desc = "Toggle Horizontal Terminal" })

		-- 1つ目の垂直ターミナルをトグルするキーマップ
		vim.keymap.set("n", "<leader>tv1", function()
			vertical_term_1:toggle()
		end, { desc = "Toggle Vertical Terminal 1" })

		-- 2つ目の垂直ターミナルをトグルするキーマップ
		vim.keymap.set("n", "<leader>tv2", function()
			vertical_term_2:toggle()
		end, { desc = "Toggle Vertical Terminal 2" })

		local term1 = Terminal:new({
			count = 1,
			direction = "vertical",
			size = vim.o.columns * 0.4,
		})

		-- term2: 右側ターミナル
		local term2 = Terminal:new({
			count = 2,
			direction = "vertical",
			size = vim.o.columns * 0.4,
		})

		-- 一括でターミナルレイアウトを開く関数
		local function open_vertical_split_terminals()
			-- 編集ウィンドウを分割せず残して、下に vertical terminal1 を開く
			term1:open()

			-- terminal1 のウィンドウへ移動して terminal モードを抜ける
			vim.cmd("stopinsert")
			vim.cmd("wincmd l") -- terminal1ウィンドウに移動

			-- 右に分割して terminal2 を開く
			vim.cmd("wincmd v")
			vim.cmd("2ToggleTerm direction=vertical size=50")
		end

		-- キーマップ登録
		vim.keymap.set("n", "<leader>tv", open_vertical_split_terminals, { desc = "Open vertical terminal pair" })
	end,
}
