return {
  "akinsho/bufferline.nvim",
  event = "LazyFile",
  opts = {
    options = {
      buffer_close_icon = " ",
      indicator = {
        style = "icon",
      },
      -- separator_style = "slope", --"slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
      offsets = {
        {
          filetype = "neo-tree",
          text = "Project Explorer",
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
    --leave highlights table empty so that error buffers arent red
    highlights = {},
  },
}
