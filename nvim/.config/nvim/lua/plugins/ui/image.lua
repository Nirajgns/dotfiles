return {
  {
    "vhyrro/luarocks.nvim",
    enabled = not vim.g.neovide,
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  {
    "3rd/image.nvim",
    enabled = not vim.g.neovide,
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {},
  },
}
