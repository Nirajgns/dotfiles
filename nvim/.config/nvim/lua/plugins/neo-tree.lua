return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    popup_border_style = "rounded",
    default_component_configs = {
      indent = {
        last_indent_marker = "╰>",
      },
    },
    window = {
      width = 30,
      popup = { -- settings that apply to float position only
        size = { height = "33", width = "90" },
        position = "50%", -- 50% means center it
      },
    },
  },
}
