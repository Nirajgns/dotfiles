return {
  "saghen/blink.cmp",
  -- enabled = false,

  --to disable for prompts and other input fields
  enabled = function()
    return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype)
      and vim.bo.buftype ~= "prompt"
      and vim.b.completion ~= false
  end,

  event = "InsertEnter",
  version = "v0.*",
  opts_extend = {
    "sources.default",
    "sources.compat",
  },
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      lazy = true,
      dependencies = {
        {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
          end,
        },
      },
      opts = {
        history = true,
        delete_check_events = "TextChanged",
      },
    },
  },
  opts = function()
    return {
      cmdline = { enabled = true },
      snippets = {
        preset = "luasnip",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
        list = {
          selection = {
            auto_insert = false,
          },
        },
        accept = {
          auto_brackets = { enabled = true },
          dot_repeat = false,
        },
        menu = {
          --disable auto_show in cmdline mode
          -- auto_show = function(ctx)
          --   return ctx.mode ~= "cmdline"
          -- end,
          border = "rounded",
          winblend = 10,
          winhighlight = "Normal:CatppuccinSurface0,FloatBorder:CatppuccinSurface2,Search:None",
          draw = { treesitter = { "lsp" } },
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
        ["<C-space>"] = { "show", "hide" },
        ["<C-e>"] = { "show_documentation", "hide_documentation" },
      },
    }
  end,
}
