return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  cmd = "Telescope",
  dependencies = {
    "debugloop/telescope-undo.nvim",
    keys = {
      { -- lazy style key map
        "<leader>uu",
        "<cmd>Telescope undo<cr>",
        desc = "undo history",
      },
    },
  },
  opts = function()
    require("telescope").setup({
      extensions = {
        undo = {
          -- telescope-undo.nvim config, see below
          side_by_side = true,
        },
      },
      defaults = {
        prompt_prefix = "  ",
        selection_caret = "🢂 ",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            preview_width = 0.5,
            prompt_position = "top",
          },
        },
        sorting_strategy = "ascending",
      },
    })
  end,

  vim.keymap.set(
    "n",
    "<leader>'",
    "<cmd>Telescope marks<cr>",
    { noremap = true, silent = true, desc = "marks with telescope" }
  ),
}
