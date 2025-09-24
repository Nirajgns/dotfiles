return {
  'neovim/nvim-lspconfig',
  event = 'LspAttach',
  opts = function(_, opts)
    local keys = require('lazyvim.plugins.lsp.keymaps').get()

    -- disable default keys
    keys[#keys + 1] = { '<c-k>', mode = 'i', false }
    keys[#keys + 1] = { 'K', mode = 'n', false }
    keys[#keys + 1] = { 'gr', mode = 'n', false }
    keys[#keys + 1] = { 'gy', mode = 'n', false }
    keys[#keys + 1] = { 'gd', mode = 'n', false }
    keys[#keys + 1] = { '<leader>cr', mode = 'n', false }
    keys[#keys + 1] = { '<leader>cc', mode = 'n', false }
    keys[#keys + 1] = { '<leader>ca', mode = { 'v', 'n' }, false }

    -- add custom key
    keys[#keys + 1] = {
      '<c-s-k>',
      vim.lsp.buf.signature_help,
      mode = 'i',
      desc = 'Signature Help',
      has = 'signatureHelp',
    }

    -- apply keymaps back into opts
    opts.keys = keys

    -- now tweak opts without wiping defaults
    opts.inlay_hints = {
      enabled = false,
      exclude = { 'vue' },
    }
    opts.codelens = { enabled = false }
    opts.diagnostics = {
      underline = true,
      update_in_insert = true,
      virtual_text = {
        spacing = 25,
        source = 'if_many',
        prefix = '⬤',
      },
    }

    opts.servers = vim.tbl_extend('force', opts.servers or {}, {
      tailwindcss = {},
    })

    return opts
  end,
}
