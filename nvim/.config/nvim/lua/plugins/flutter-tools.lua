return {
  "akinsho/flutter-tools.nvim",
  enabled = false,
  lazy = true,
  ft = "dart",
  setup = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("flutter-tools").setup({
      widget_guides = { enabled = false },
      lsp = {
        color = {
          enabled = true,
          background = false,
          background_color = nil,
          foreground = false,
          virtual_text = true,
          virtual_text_str = "■■■■ ",
        },
        settings = {
          analysisExcludedFolders = {
            vim.fn.expand("$HOME/android"),
            vim.fn.expand("$HOME/developmemt"),
            vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
            vim.fn.expand("$HOME/.pub-cache"),
            vim.fn.expand("/opt/homebrew/"),
            vim.fn.expand("$HOME/tools/flutter/"),
          },
        },
      },
      debugger = {
        enabled = true,
        run_via_dap = false,
        exception_breakpoints = { "uncaughtException" },
        register_configurations = function()
          require("dap").configurations.dart = {
            {
              name = "Flutter",
              request = "launch",
              type = "dart",
              flutterMode = "debug",
            },
          }
        end,
      },
    })
  end,
}
