return {
  "pmizio/typescript-tools.nvim",
  enabled = false,
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  ft = { "typescript", "typescriptreact", "javascriptreact", "javascript" },
  opts = {},
}

--FIX: this to install typescript-language-server globally

--npm install -g typescript-language-server typescript
