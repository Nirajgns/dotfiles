return {
  "folke/which-key.nvim",
  opts = {
    preset = "classic",
    sort = { "alphanum" },
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>a", group = "Copilot AI" },
        { "<leader>t", group = "Tasks (Overseer)" },
        { "<leader>l", group = "LAZY and LSP)" },
      },
    },
    layout = {
      spacing = 20, -- spacing between columns
    },
    win = {
      no_overlap = false,
      wo = {
        winblend = 10,
      },
    },
  },
}
