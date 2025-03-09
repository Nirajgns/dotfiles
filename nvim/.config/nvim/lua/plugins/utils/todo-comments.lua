return {
  "folke/todo-comments.nvim",
  optional = true,
  config = function()
    require("todo-comments").setup({
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = {
            "FIXME",
            "BUG",
            "FIXIT",
            "ISSUE",
            "fix",
            "bug",
            "fixit",
            "issue",
            "Issue",
            "Fix",
            "Fixme",
            "Fixme",
            "Bug",
            "fixme",
          }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info", alt = { "*", "todo" } },
        HACK = { icon = " ", color = "warning", alt = { "!", "hack" } },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "#", "warn" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "perf" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO", "note", "info" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
    })
  end,
  keys = {
    {
      "<leader>st",
      function()
        Snacks.picker.todo_comments({
          keywords = {
            "TODO",
            "FIX",
            "FIXME",
            "bug",
            "BUG",
            "issue",
            "ISSUE",
            "HACK",
            "hack",
            "WARN",
            "warn",
            "PERF",
            "perf",
            "NOTE",
            "note",
            "TEST",
            "test",
            "INFO",
            "info",
            "WARNING",
            "warning",
            "OPTIM",
            "optim",
            "OPTIMIZE",
            "optimize",
            "PASSED",
            "passed",
            "FAILED",
            "failed",
          },
        })
      end,
      desc = "Todo/Fix/Fixme",
    },
  },
}
