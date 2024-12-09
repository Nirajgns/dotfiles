return {
  "nvimdev/lspsaga.nvim",
  lazy = true,
  event = "LazyFile",
  config = function()
    local wk = require("which-key")
    require("lspsaga").setup({
      beacon = { enable = true, frequency = 20 },
      ui = {
        code_action = "🕯️",
        winbar_prefix = "   ",
        expand = " ",
        collapse = " ",
        lines = { "╰", "├", "│", "─", "╭" },
        button = { "", "" },
      },
      outline = {
        auto_preview = false,
        detail = true,
        keys = {
          toggle_or_jump = "o",
          jump = "<cr>",
        },
      },
      finder = {
        keys = {
          toggle_or_open = "<cr>",
          vsplit = "|",
          split = "-",
          shuttle = "o",
        },
      },
      hover = {
        max_width = 0.5,
        max_height = 0.7,
      },

      vim.keymap.set(
        { "n", "t" },
        "<A-i>",
        "<cmd>Lspsaga term_toggle<cr>",
        { silent = true, desc = "toggle lspsaga floating terminal" }
      ),
      wk.add({
        { "<leader>l", group = "Lint,Lazy,Lspsaga" },
        { "<leader>lR", "<cmd>Lspsaga rename<cr>", desc = "Rename with lsp" },
        { "<leader>lc", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
        { "<leader>ld", "<cmd>Lspsaga goto_definition<cr>", desc = "Lsp GoTo Definition" },
        { "<leader>li", "<cmd>LspInfo<cr>", desc = "Lsp info and status" },
        { "<leader>lO", "<cmd>Lspsaga outline<cr>", desc = " lspsaga outline" },
        { "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", desc = "Preview Definition" },
        { "<leader>lr", "<cmd>Lspsaga finder<cr>", desc = "Lsp Finder" },
        { "<leader>ls", "<cmd>Lspsaga signature_help<cr>", desc = "Signature Help" },
        { "<leader>le", "<cmd>Lspsaga show_buf_diagnostics<cr>", desc = "Show buffer Diagnostics" },
      }),
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
