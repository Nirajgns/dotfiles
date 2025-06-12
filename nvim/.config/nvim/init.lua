-- bootstrap lazy.nvim, LazyVim and your plugins
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
require('config.lazy') --don't move this line fom here.

vim.g.root_spec = { 'cwd' }
