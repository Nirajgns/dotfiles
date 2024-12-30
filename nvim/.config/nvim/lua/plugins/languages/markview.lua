return {
  "OXY2DEV/markview.nvim",
  lazy = true,
  ft = { "md", "markdown", ".md" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("markview").setup({
      hybrid_modes = { "n" },
    })
  end,
}
