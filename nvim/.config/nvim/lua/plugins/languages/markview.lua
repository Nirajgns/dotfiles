return {
  "OXY2DEV/markview.nvim",
  ft = { "md", "markdown", ".md" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    preview = {
      filetypes = { "markdown" },
      ignore_buftypes = { "nofile" },
      hybrid_modes = { "i" },
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
  },
}
