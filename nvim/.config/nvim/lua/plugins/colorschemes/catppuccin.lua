return {
  "catppuccin/nvim",
  -- enabled = false,
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        snacks = true,
        blink_cmp = true,
      },
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
        strings = { "italic" },
        --   variables = {},
        --   numbers = {},
        --   booleans = {},
        --   properties = {},
        types = { "italic" },
        --   operators = {},
      },
    })
  end,
}
