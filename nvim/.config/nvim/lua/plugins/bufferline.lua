return {
  "akinsho/bufferline.nvim",
  event = "LazyFile",
  opts = {
    options = {
      buffer_close_icon = " ",
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "center",
        },
        {
          filetype = "dapui_scopes", -- or "dapui_stacks", "dapui_scopes", "dapui_breakpoints", etc.
          text = "Debugger UI",
          highlight = "Directory",
          text_align = "center",
          separator = true, -- use a separator between bufferline and dap-ui
        },
      },
    },
  },
}
