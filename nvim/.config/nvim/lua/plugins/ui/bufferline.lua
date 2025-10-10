return {
  'akinsho/bufferline.nvim',
  event = 'LazyFile',
  config = {
    options = {
      max_name_length = 100,
      show_buffer_close_icons = true,
      show_close_icon = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' },
      },
      buffer = {
        setNames = true,
      },
      vim.api.nvim_set_hl(0, 'BufferClose', { fg = '#F38BA8' }), -- Red color
      buffer_close_icon = '%#BufferClose#  ✘%#Normal#',
      -- indicator = { style = "underline" },
      -- separator_style = "slant", --"slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Project Explorer',
          highlight = 'Directory',
          text_align = 'center',
        },
        {
          filetype = 'dapui_scopes', -- or "dapui_stacks", "dapui_scopes", "dapui_breakpoints", etc.
          text = 'Debugger UI',
          highlight = 'Directory',
          text_align = 'center',
          separator = true, -- use a separator between bufferline and dap-ui
        },
        {
          filetype = 'dapui_scopes', -- or "dapui_stacks", "dapui_scopes", "dapui_breakpoints", etc.
          text = 'Debugger UI',
          highlight = 'Directory',
          text_align = 'center',
          separator = true, -- use a separator between bufferline and dap-ui
        },
        {
          filetype = 'snacks_layout_box',
          text = 'Project Files',
          highlight = 'Directory',
          text_align = 'center',
          separator = true, -- use a separator between bufferline and dap-ui
        },

        {
          filetype = 'no-neck-pain',
          text = '',
          highlight = 'Directory',
          text_align = 'center',
          separator = true, -- use a separator between bufferline and dap-ui
        },
      },
    },
    --leave highlights table empty so that error buffers arent red
    highlights = {},
  },
}
