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
        padding = 1,
        with_markers = false,
        indent_marker = "│",
        expander_collapsed = "▶",
        expander_expanded = "◢",
        last_indent_marker = "╰",
      },
    },
    filesystem = {
      commands = {
        --over ride delete visual to use trash instead of rm
        delete_visual = function(state, selected_nodes)
          local inputs = require("neo-tree.ui.inputs")
          local msg = "Trash " .. #selected_nodes .. " itmes ?"

          inputs.confirm(msg, function(confirmed)
            if not confirmed then
              return
            end
            for _, node in ipairs(selected_nodes) do
              vim.fn.system({ "trash", vim.fn.fnameescape(node.path) })
            end

            require("neo-tree.sources.manager").refresh(state.name)
          end)
        end,

        -- Override delete to use trash instead of rm
        delete = function(state)
          local inputs = require("neo-tree.ui.inputs")
          local node = state.tree:get_node()
          local path = node.path
          local pretty_path = vim.fn.fnamemodify(path, ":.") -- Convert to relative path from cwd
          local msg = "Trash " .. pretty_path .. " ?"
          inputs.confirm(msg, function(confirmed)
            if not confirmed then
              return
            end
            vim.fn.system({
              "trash",
              vim.fn.fnameescape(path),
            })
            require("neo-tree.sources.manager").refresh(state.name)
          end)
        end,
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
