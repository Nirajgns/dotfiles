return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("markview").setup({
      hybrid_modes = { "n" },
    })
  end,
}
