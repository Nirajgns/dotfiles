return {
  "stevearc/dressing.nvim",
  event = "LazyFile",
  config = function()
    require("dressing").setup({
      input = {
        mappings = {
          n = {
            ["q"] = "Close",
          },
        },
      },
      select = {
        builtin = {
          mappings = {
            ["q"] = "Close",
          },
        },
      },
    })
  end,
}
