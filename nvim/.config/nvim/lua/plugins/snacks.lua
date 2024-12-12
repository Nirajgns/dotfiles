return {
  "folke/snacks.nvim",
  keys = {

    {
      "<leader>uD",
      (function()
        local isDim = false -- Local to this function's scope but persists across calls
        return function()
          if not isDim then
            Snacks.dim()
            isDim = true
          else
            Snacks.dim.disable()
            isDim = false
          end
        end
      end)(),
      desc = "Toggle Dim",
    },

    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>SS",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },

    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
  },
  opts = {
    terminal = {
      win = {
        style = "float",
        relative = "editor",
        border = "rounded",
        width = 0.9,
        height = 0.9,
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
