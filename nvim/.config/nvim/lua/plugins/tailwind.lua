return {
  {
    "neovim/nvim-lspconfig",
    opts = { servers = { tailwindcss = {} } },
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "LazyFile",
    opts = { user_default_options = { tailwind = true } },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", event = "LazyFile", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },

  {
    "laytan/tailwind-sorter.nvim",
    ft = { "jsx", "tsx", "javascriptreact", "typescriptreact", "html" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && npm ci && npm run build",
    config = true,
    opts = {
      on_save_enabled = true, -- If `true`, automatically enables on save sorting.
      on_save_pattern = { "*.html", "*.js", "*.jsx", "*.tsx", "*.twig", "*.hbs", "*.php", "*.heex", "*.astro" }, -- The file patterns to watch and sort.
      node_path = "node",
      trim_spaces = false,
    },

    keys = {
      {
        "<leader>tw",
        "<cmd>TailwindSortOnSaveToggle<cr>",
        desc = "Toggle Tailwind Sorter",
      },
    },
  },
}
