return {
  "saghen/blink.cmp",
  -- enabled = false,
  event = "InsertEnter",
  version = "v0.*",
  opts_extend = {
    "sources.completion.enabled_providers",
    "sources.compat",
  },
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = function()
    return {
      completion = {
        accept = {
          auto_brackets = { enabled = true },
        },
        menu = {
          border = "rounded",
          winblend = 10,
          winhighlight = "Normal:CatppuccinSurface0,FloatBorder:CatppuccinSurface2,Search:None",
        },
        documentation = {
          auto_show = true,
          window = {
            border = "rounded",
            winblend = 10,
            winhighlight = "Normal:CatppuccinSurface0,FloatBorder:CatppuccinSurface2,Search:None",
          },
          auto_show_delay_ms = 100,
        },
      },
      signature = {
        enabled = true,
        window = {
          border = "rounded",
          winblend = 10,
          winhighlight = "Normal:CatppuccinSurface0,FloatBorder:CatppuccinSurface2,Search:None",
        },
      },
      keymap = {
        preset = "enter",
      },
      apperance = {
        use_nvim_cmp_as_default = true,
      },
    }
  end,
}
