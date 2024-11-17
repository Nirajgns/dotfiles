return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  version = "v0.*",
  -- version = not vim.g.lazyvim_blink_main and "*",
  -- build = vim.g.lazyvim_blink_main and "cargo build --release",
  opts_extend = {
    "sources.completion.enabled_providers",
    "sources.compat",
  },
  dependencies = {
    "rafamadriz/friendly-snippets",
    -- add blink.compat to dependencies
    -- { "saghen/blink.compat", opts = {} },
  },

  opts = function()
    -- local cmp = require("blink.cmp")
    -- local neocodeium = require("neocodeium")
    -- local commands = require("neocodeium.commands")
    --
    -- cmp.event:on("menu_opened", function()
    --   commands.disable()
    --   neocodeium.clear()
    -- end)
    --
    -- cmp.event:on("menu_closed", function()
    --   commands.enable()
    -- end)
    return {
      highlight = {
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = "normal",
      windows = {
        autocomplete = {
          -- draw = "reversed",
          border = "rounded",
          winblend = 0,
          selection = "preselect",
        },
        documentation = {
          auto_show = true,
          border = "rounded",
          winblend = 0,
          min_width = 1,
          min_height = 1,
        },
        signature_help = {
          auto_show = true,
          border = "rounded",
          winblend = 0,
        },
        ghost_text = {
          enabled = false,
        },
      },

      -- experimental auto-brackets support
      accept = { auto_brackets = { enabled = true } },

      trigger = { signature_help = { enabled = true } },
      sources = {
        -- adding any nvim-cmp sources here will enable them
        -- with blink.compat
        -- compat = {},
        completion = {
          -- remember to enable your providers here
          enabled_providers = { "lsp", "path", "snippets", "buffer" },
        },
      },

      keymap = {
        preset = "enter",
        -- ["<Tab>"] = {
        --   LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
        --   "fallback",
        -- },
      },
    }
  end,

  ------@param opts blink.cmp.Config | { sources: { compat: string[] } }
  ---config = function(_, opts)
  ---  -- setup compat sources
  ---  local enabled = opts.sources.completion.enabled_providers
  ---  for _, source in ipairs(opts.sources.compat or {}) do
  ---    opts.sources.providers[source] = vim.tbl_deep_extend(
  ---      "force",
  ---      { name = source, module = "blink.compat.source" },
  ---      opts.sources.providers[source] or {}
  ---    )
  ---    if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
  ---      table.insert(enabled, source)
  ---    end
  ---  end
  ---  require("blink.cmp").setup(opts)
  ---end,
}
