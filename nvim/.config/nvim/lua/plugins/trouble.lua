return {
  "folke/trouble.nvim",

  event = "LazyFile",
  opts = {
    modes = {
      symbols = { focus = true },
      lsp = {
        win = { position = "right" },
      },
    },
  }, -- for default options, refer to the configuration section for custom setup.
}
