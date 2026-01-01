return {
  'neovim/nvim-lspconfig',
  event = 'LspAttach',
  opts = {
    inlay_hints = {
      enabled = false,
      exclude = { 'vue' },
    },
    codelens = { enabled = false },
    diagnostics = {
      underline = true,
      update_in_insert = true,
      virtual_text = {
        spacing = 25,
        source = 'if_many',
        prefix = '⬤',
      },
    },
    servers = {
      ['*'] = {
        keys = {
          -- disable default keys by setting false
          { '<c-k>', mode = 'i', false },
          { 'K', mode = 'n', false },
          { 'gr', mode = 'n', false },
          { 'gy', mode = 'n', false },
          { 'gd', mode = 'n', false },
          { '<leader>cr', mode = 'n', false },
          { '<leader>cc', mode = 'n', false },
          { '<leader>ca', mode = { 'v', 'n' }, false },

          -- add your custom key
          {
            '<C-s-k>',
            function()
              vim.lsp.buf.signature_help()
            end,
            mode = 'i',
            desc = 'Signature Help',
            has = 'signatureHelp',
          },
        },
      },
      tailwindcss = {},
    },
  },
}
