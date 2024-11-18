return {
  "catppuccin/nvim",
  enabled = true,
  config = function()
    require("catppuccin").setup({
      color_overrides = {
        mocha = { base = "#11111b", mantle = "#12121c", crust = "#19191f" },
      },
      flavour = "mocha",
      term_colors = true,
      no_bold = false,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "italic" },
        functions = { "italic" },
        --   keywords = {},
        -- strings = { "italic" },
        --   variables = {},
        --   numbers = {},
        --   booleans = {},
        --   properties = {},
        types = { "italic" },
        --   operators = {},
      },
    })

    local cp = require("catppuccin.palettes").get_palette()

    local TelescopeColor = {
      TelescopeBorder = { fg = cp.mantle, bg = cp.mantle },
      TelescopePromptBorder = { fg = cp.surface1, bg = cp.surface1 },
      TelescopeResultsBorder = { fg = cp.mantle, bg = cp.mantle },
      TelescopePreviewBorder = { fg = cp.mantle, bg = cp.mantle },

      TelescopePromptNormal = { fg = cp.text, bg = cp.surface1 },
      TelescopePromptPrefix = { fg = cp.pink, bg = cp.surface1 },
      TelescopeNormal = { bg = cp.mantle },
      TelescopeResultsNormal = { bg = cp.mantle },
      TelescopePreviewNormal = { bg = cp.mantle },

      TelescopePromptTitle = { fg = cp.mantle, bg = cp.red },
      TelescopeResultsTitle = { fg = cp.mantle, bg = cp.mantle },
      TelescopePreviewTitle = { fg = cp.mantle, bg = cp.green },

      TelescopeSelection = { fg = cp.text, bg = cp.surface1 },
      TelescopeMatching = { fg = cp.blue, bg = cp.surface1 },
    }

    for hl, col in pairs(TelescopeColor) do
      vim.api.nvim_set_hl(0, hl, col)
    end
  end,
}
