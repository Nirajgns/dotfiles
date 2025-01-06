return {
  "folke/snacks.nvim",
  opts = {
    words = { enabled = true },
    scroll = { enabled = false },
    zen = { enabled = false },
    animate = { enabled = false },
    indent = {
      enabled = false,
      char = "",
      only_scope = true,
      only_current = true,
      hl = "SnacksIndent",

      chunk = { enabled = true },
      scope = { enabled = false },
    },
    terminal = {
      win = {
        style = "float",
        -- relative = "editor",
        -- border = "rounded",
        -- width = 0.9,
        -- height = 0.9,
      },
    },
    dim = {
      scope = {
        min_size = 5,
        max_size = 20,
        siblings = true,
      },
      animate = {
        enabled = vim.fn.has("nvim-0.10") == 1,
        easing = "outQuad",
        duration = {
          step = 20, -- ms per step
          total = 300, -- maximum duration
        },
      },
      filter = function(buf)
        return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ""
      end,
    },
    dashboard = { enabled = false },
    notifier = { top_down = false, wo = { winblend = 1000 } },
  },
}
