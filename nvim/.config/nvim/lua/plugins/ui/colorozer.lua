return {
  'NvChad/nvim-colorizer.lua',
  event = 'LazyFile',
  opts = {
    filetypes = { '*' },
    user_default_options = {
      mode = 'background', -- Set the display mode.
      tailwind = true, -- Enable tailwind colors
    },
  },
}
