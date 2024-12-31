return {
  "neovim/nvim-lspconfig",
  event = "LspAttach",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<c-k>", mode = "i", false }
    -- change a keymap
    keys[#keys + 1] = { "K", mode = "n", false }
    keys[#keys + 1] = { "gr", mode = "n", false }
    keys[#keys + 1] = { "gy", mode = "n", false }
    keys[#keys + 1] = { "gd", mode = "n", false }
    -- keys[#keys + 1] = { "gD", mode = "n", false }
    keys[#keys + 1] = { "<c-k>", mode = "i", false }
    keys[#keys + 1] = { "<leader>cr", mode = "n", false }
    keys[#keys + 1] = { "<leader>cc", mode = "n", false }
    keys[#keys + 1] = { "<leader>ca", mode = { "v", "n" }, false }

    keys[#keys + 1] =
      { "<c-s-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" }

    --change a keymap
    -- keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<cr>", mode = "v", desc = "code actions", silent = true }
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
