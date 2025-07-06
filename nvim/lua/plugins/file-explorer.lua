return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      renderer = {
        indent_width = 1,
        group_empty = true,
        full_name = true,
	indent_markers = {
          enable = true,
	  inline_arrows = false,
          -- icons = {
          --   corner = "└",
          --   edge = "│",
          --   item = "│",
          --   none = " ",
          -- },
	},
      },
      view = {
	width = {
	  min = 30,
	  max = 50,
	},
      },
      sort_by = "name",
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

	-- custom key mapping
        vim.keymap.del("n", "e", { buffer = bufnr })
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory / Parent'))

        vim.keymap.set('n', 'H', api.tree.change_root_to_parent, opts('Change Root Up'))
        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open File / Expand Folder'))
        vim.keymap.set('n', 'R', api.tree.change_root_to_node, opts('Change Root to Node'))
        vim.keymap.set('n', '<Space>', function()
          local node = api.tree.get_node_under_cursor()
          if not node then return end

          if node.type == "directory" then
            api.node.open.edit()
          else
            api.node.open.preview()
          end
        end, opts('Toggle Preview / Expand Folder'))
      end,
    },
  },
}
