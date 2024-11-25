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
      highlight = {
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = "normal",
      windows = {
        autocomplete = {
          border = "rounded",
          winblend = 20,
          selection = "preselect",
          winhighlight = "Normal:CatppuccinSurface0,FloatBorder:CatppuccinSurface2,Search:None",
        },
        documentation = {
          auto_show = true,
          border = "rounded",
          winblend = 20,
          min_width = 1,
          min_height = 1,
          winhighlight = "Normal:CatppuccinSurface0,FloatBorder:CatppuccinSurface2,Search:None",
        },
        signature_help = {
          auto_show = true,
          border = "rounded",
          winhighlight = "Normal:CatppuccinSurface0,FloatBorder:CatppuccinSurface2,Search:None",
          winblend = 20,
        },
        ghost_text = {
          enabled = false,
        },
      },
      accept = { auto_brackets = { enabled = true } },
      trigger = { signature_help = { enabled = true } },
      sources = {
        completion = {
          enabled_providers = { "lsp", "path", "snippets", "buffer" },
        },
      },
      keymap = {
        preset = "enter",
      },
    }
  end,
}
