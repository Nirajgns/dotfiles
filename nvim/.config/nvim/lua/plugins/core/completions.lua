return {
  'hrsh7th/nvim-cmp',
  enabled = false,
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'onsails/lspkind.nvim',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'hrsh7th/cmp-nvim-lsp',
  },
  opts = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')
    require('luasnip.loaders.from_vscode').lazy_load()

    return {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      }),
      formatting = {
        fields = { 'kind', 'abbr', 'menu' }, -- Order determines placement
        format = lspkind.cmp_format({
          mode = 'symbol',
          maxwidth = 30,
          ellipsis_char = '...',
        }),
      },

      experimental = { ghost_text = false },
      auto_brackets = {
        'python',
        'lua',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'js',
        'ts',
        'jsx',
        'tsx',
      },
    }
  end,
}
