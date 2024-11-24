return {
  "folke/snacks.nvim",
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
    dashboard = { enabled = false },
    notifier = { top_down = false, wo = { winblend = 1000 } },
  },
}
