return {
  "neovim/nvim-lspconfig",
  event = "LspAttach",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<c-k>", mode = "i", false }
    -- change a keymap
    keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "hover doc", silent = true }
    keys[#keys + 1] = { "gr", "<cmd>Lspsaga finder<cr>", desc = "references (finder)", silent = true }
    keys[#keys + 1] = { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "go to definition", silent = true }
    keys[#keys + 1] = { "gpd", "<cmd>Lspsaga peek_definition<cr>", desc = "peek definition", silent = true }
    keys[#keys + 1] = { "gpy", "<cmd>Lspsaga peek_type_definition<cr>", desc = "peek type definition", silent = true }
    keys[#keys + 1] = { "gy", "<cmd>Lspsaga goto_type_definition<cr>", desc = "go to type definition", silent = true }
    keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "code actions", silent = true }
    keys[#keys + 1] =
      { "<c-s-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" }
    keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<cr>", mode = "v", desc = "code actions", silent = true }
    -- disable a keymap
    -- keys[#keys + 1] = { "K", false }
    -- add a keymap
    -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
    --
    return {
      inlay_hints = {
        enabled = false,
        exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
      },
      codelens = {
        enabled = false,
      },
      diagnostics = {
        underline = true,
        update_in_insert = true,
        virtual_text = {
          spacing = 25,
          source = "if_many",
          prefix = "⬤",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
      },
      setup = {},
      -- servers = {
      --   vtsls = { settings = {
      --     enableMoveToFileCodeAction = true,
      --   } },
      -- },
    }
  end,
}
