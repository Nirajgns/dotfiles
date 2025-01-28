return {
  "OXY2DEV/markview.nvim",
  lazy = true,
  ft = { "md", "markdown", ".md" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("markview").setup({
      preview = {
        hybrid_modes = { "n" },
      },
      markdown = {
        headings = {
          heading_1 = {
            style = "label",
          },
          heading_2 = {
            style = "label",
          },
          heading_3 = {
            style = "label",
          },
          heading_4 = {
            style = "label",
          },
          heading_5 = {
            style = "label",
          },
          heading_6 = {
            style = "label",
          },
          heading_7 = {
            style = "label",
          },
        },
      },
    })
  end,
}
