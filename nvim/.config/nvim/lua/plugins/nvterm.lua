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
              row = (1 - 0.75) / 2, -- Center vertically
              col = (1 - 0.75) / 2, -- Center horizontally
              width = 0.75, -- 80% of the editor's width
              height = 0.75, -- 80% of the editor's height
              border = "rounded", -- Rounded border for the floating window
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
