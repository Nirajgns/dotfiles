return {
  "williamboman/mason.nvim",
  event = "LazyFile",
  opts = {
    ensure_installed = {
      "tailwindcss-language-server",
      "lua-language-server",
      "stylua",
      -- "dart-debug-adapter",
      "html-lsp",
      "css-lsp",
      "prettierd",
      "pyright",
      -- "vtsls",
      "black",
      "isort",
      "flake8",
      "eslint-lsp",
    },
  },
}
