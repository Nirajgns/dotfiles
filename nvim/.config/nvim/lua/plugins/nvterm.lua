return {
  {
    "NvChad/nvterm",
    event = "LazyFile",
    enabled = true,
    config = function()
      require("nvterm").setup({
        terminals = {
          shell = vim.o.shell,
          list = {},
          type_opts = {
            float = {
              relative = "editor",
              row = 0.08,
              col = 0.045,
              width = 0.9,
              height = 0.8,
              border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.35 },
            vertical = { location = "rightbelow", split_ratio = 0.35 },
          },
        },
      })
    end,
  },

  vim.keymap.set(
    { "n", "t" },
    "<A-v>",
    '<cmd>lua require("nvterm.terminal").toggle("vertical")<CR>',
    { noremap = true, silent = true, desc = "vertical terminal toggle" }
  ),

  vim.keymap.set(
    { "n", "t" },
    "<A-f>",
    '<cmd>lua require("nvterm.terminal").toggle("float")<CR>',
    { noremap = true, silent = true, desc = "floating terminal toggle" }
  ),
  vim.keymap.set(
    { "n", "t" },
    "<A-h>",
    '<cmd>lua require("nvterm.terminal").toggle("horizontal")<CR>',
    { noremap = true, silent = true, desc = "horizontal terminal toggle" }
  ),
}
