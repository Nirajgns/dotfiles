return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Neotree",
  opts = {
    popup_border_style = "rounded",
    default_component_configs = {
      indent = {
        last_indent_marker = "╰>",
      },
    },
    window = {
      width = 35,
      popup = { -- settings that apply to float position only
        size = { height = "43", width = "90" },
        position = "50%", -- 50% means center it
      },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, reveal = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
  },
}
