return {
  "hrsh7th/nvim-cmp",
  enabled = false,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local auto_select = true
    require("luasnip.loaders.from_vscode").lazy_load()

    local neocodeium = require("neocodeium")
    local commands = require("neocodeium.commands")

    cmp.event:on("menu_opened", function()
      commands.disable()
      neocodeium.clear()
    end)

    cmp.event:on("menu_closed", function()
      commands.enable()
    end)

    return {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      completion = {
        completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
        ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
        ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "nvim_lsp_signature_help" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        expandable_indicator = true,
        fields = {
          "kind",
          "abbr",
          "menu",
        },
        format = lspkind.cmp_format({
          mode = "symbol",
          maxwidth = 20,
          ellipsis_char = "...",
          before = function(_, item)
            item.menu = item.menu
            return item
          end,
        }),
      },
      experimental = {
        ghost_text = false,
      },
      auto_brackets = {
        "python",
        "lua",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "js",
        "ts",
        "jsx",
        "tsx",
      },
    }
  end,
  main = "lazyvim.util.cmp",
}
