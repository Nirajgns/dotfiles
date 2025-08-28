return {
  'catppuccin/nvim',
  -- enabled = false,
  name = 'catppuccin',
  opts = function(_, opts)
    local module = require('catppuccin.groups.integrations.bufferline')
    if module then
      module.get = module.get_theme
    end
    return opts
  end,
  config = function()
    require('catppuccin').setup({
      integrations = {
        telescope = {
          enabled = true,
          style = 'nvchad',
        },
        snacks = true,
        blink_cmp = true,
      },
      color_overrides = {
        mocha = { base = '#11111b', mantle = '#12121c', crust = '#19191f' },
      },
      flavour = 'mocha',
      term_colors = true,
      no_bold = false,
      styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = { 'italic' },
        functions = { 'italic' },
        --   keywords = {},
        strings = { 'italic' },
        --   variables = {},
        --   numbers = {},
        --   booleans = {},
        --   properties = {},
        types = { 'italic' },
        --   operators = {},
      },
    })
  end,
}
