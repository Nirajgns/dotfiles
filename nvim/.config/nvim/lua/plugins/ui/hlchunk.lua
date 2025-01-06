return {
  "shellRaining/hlchunk.nvim",
  event = "LazyFile",
  config = function()
    require("hlchunk").setup({

      chunk = { enable = true, chars = { right_arrow = ">" } },
      blank = { enable = false },
      line_num = { enable = false },
      indent = { enable = false },
    })
  end,
}
