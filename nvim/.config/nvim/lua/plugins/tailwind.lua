return {
  {
    "neovim/nvim-lspconfig",
    opts = { servers = { tailwindcss = {} } },
  },

  {
    "laytan/tailwind-sorter.nvim",
    ft = { "jsx", "tsx", "javascriptreact", "typescriptreact", "html" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && npm ci && npm run build",
    config = true,
    opts = {
      on_save_enabled = false, -- If `true`, automatically enables on save sorting.
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
