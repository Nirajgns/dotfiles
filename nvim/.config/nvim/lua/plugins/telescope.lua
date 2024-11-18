return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  cmd = "Telescope",
  opts = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {
        mappings = { n = { ["q"] = actions.close } },
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
