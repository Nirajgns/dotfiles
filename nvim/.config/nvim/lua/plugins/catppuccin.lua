return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      color_overrides = {
        mocha = { base = "#11111b", mantle = "#12121c", crust = "#19191f" },
      },
      no_bold = true,
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
  end,
}
