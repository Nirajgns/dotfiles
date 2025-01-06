return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- "3rd/image.nvim",  --requires luarocks
  },
  cmd = "Neotree",

  opts = {
    open_files_do_not_replace_types = { "terminal", "trouble", "qf", "overseer", "nvterm" },
    popup_border_style = "rounded",
    default_component_configs = {
      indent = {
        padding = 0,
        with_markers = false,
        indent_marker = "│",
        expander_collapsed = "▶",
        expander_expanded = "◢",
        last_indent_marker = "╰",
      },
    },

    window = {
      width = 35,
      popup = { -- settings that apply to float position only
        size = { height = "43", width = "90" },
        position = "50%", -- 50% means center it
      },

      mappings = {
        ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        ["a"] = {
          "add",
          config = {
            show_path = "relative", -- "none", "relative", "absolute"
          },
        },
      },
    },
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
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
