return {
  "OXY2DEV/markview.nvim",
  lazy = true,
  ft = { "md", "markdown", ".md", "codecompanion" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("markview").setup({
      preview = {
        filetypes = { "markdown", "codecompanion" },
        hybrid_modes = { "n", "i" },
      },
      markdown = {
        headings = {
          heading_1 = {
            style = "label",
            icon = "⬤  ",
          },
          heading_2 = {
            style = "label",
            icon = " ⬤⬤  ",
          },
          heading_3 = {
            style = "label",
            icon = " ⬤⬤⬤ ",
            hl = "MarkviewHeading3",
          },
          heading_4 = {
            style = "label",
            icon = " ⬤⬤⬤⬤",
          },
          heading_5 = {
            style = "label",
            icon = " ⬤⬤⬤⬤⬤ ",
          },
          heading_6 = {
            style = "label",
            icon = "⬤⬤⬤⬤⬤⬤ ",
          },
        },
      },
    })
  end,
}
