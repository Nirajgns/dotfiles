return {
  "OXY2DEV/markview.nvim",
  ft = { "md", "markdown", ".md" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    preview = {
      filetypes = { "markdown", "html" },
      ignore_buftypes = { "nofile" },
      hybrid_modes = { "v" },
    },
    markdown = {
      headings = {
        shift_width = 2,
        org_indent = true,
        org_indent_wrap = true,
        heading_1 = {
          style = "label",
          icon = "⬤ ",
        },
        heading_2 = {
          style = "label",
          icon = " ⬤ ⬤ ",
        },
        heading_3 = {
          style = "label",
          icon = " ⬤ ⬤ ⬤ ",
        },
        heading_4 = {
          style = "label",
          icon = " ⬤ ⬤ ⬤ ⬤ ",
        },
        heading_5 = {
          style = "label",
          icon = " ⬤ ⬤ ⬤ ⬤ ⬤ ",
        },
        heading_6 = {
          style = "label",
          icon = "⬤ ⬤ ⬤ ⬤ ⬤ ⬤ ",
        },
      },
    },
  },
}
