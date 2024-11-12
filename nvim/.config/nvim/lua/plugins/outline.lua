return {
  "hedyhli/outline.nvim",
  event = "LazyFile",
  config = function()
    vim.keymap.set("n", "<leader>lo", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
    require("outline").setup({
      outline_window = {
        auto_jump = true,
        jump_highlight_duration = false,
        width = 30,
        -- Whether width is relative to the total width of nvim
        -- When relative_width = true, this means take 25% of the total
        -- screen width for outline window.
        relative_width = false,
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
        markers = { "", "" },
      },
    })
  end,
}
