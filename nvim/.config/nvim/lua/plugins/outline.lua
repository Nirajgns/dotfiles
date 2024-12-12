return {
  "hedyhli/outline.nvim",
  cmd = "Outline",
  keys = "<leader>lo",
  enabled = true,
  config = function()
    vim.keymap.set("n", "<leader>lo", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
    require("outline").setup({
      outline_window = {
        auto_jump = true,
        jump_highlight_duration = false,
        width = 45,
        auto_close = false,
        relative_width = false,
        show_cursorline = true,
        hide_cursor = false,
      },
      symbol_folding = {
        -- Depth past which nodes will be folded by default. Set to false to unfold all on open.
        autofold_depth = false,
        -- When to auto unfold nodes
        auto_unfold = {
          hovered = true,
          -- Auto fold when the root level only has this many nodes.
          -- Set true for 1 node, false for 0.
          only = true,
        },
        markers = { " ", " " },
      },
    })
  end,
}
