return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      win = {
        style = "float",
        relative = "editor",
        border = "rounded",
        width = 0.85, -- Width (80%)
        height = 0.85, -- Height (80%)
      },
    },
    dashboard = { enabled = false },
    notifier = { top_down = false, wo = { winblend = 1000 } },
  },
}
