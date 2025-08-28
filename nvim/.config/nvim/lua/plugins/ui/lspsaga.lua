return {
  'nvimdev/lspsaga.nvim',
  lazy = true,
  event = 'LazyFile',
  config = function()
    require('lspsaga').setup({
      beacon = { enable = true, frequency = 20 },
      ui = {
        code_action = '🕯️',
        winbar_prefix = '   ',
        expand = ' ',
        collapse = ' ',
        lines = { '╰', '├', '│', '─', '╭' },
        button = { '', '' },
      },
      rename = {
        in_select = false,
        keys = {
          quit = '<esc>',
        },
      },
      lightbulb = { virtual_text = false },
      outline = {
        auto_preview = false,
        detail = true,
        keys = {
          toggle_or_jump = 'o',
          jump = '<cr>',
        },
      },
      finder = {
        keys = {
          toggle_or_open = '<cr>',
          vsplit = '|',
          split = '-',
          shuttle = '<A-w>',
        },
      },
      hover = {
        max_width = 0.5,
        max_height = 0.7,
      },

      vim.keymap.set(
        { 'n', 't' },
        '<A-i>',
        '<cmd>Lspsaga term_toggle<cr>',
        { silent = true, desc = 'toggle lspsaga floating terminal' }
      ),
      vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { desc = 'hover doc', silent = true }),
      vim.keymap.set('n', 'grr', '<cmd>Lspsaga finder<cr>', { desc = 'references (finder)', silent = true }),

      vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', { desc = 'go to definition', silent = true }),
      vim.keymap.set('n', 'grd', '<cmd>Lspsaga peek_definition<cr>', { desc = 'peek definition', silent = true }),

      vim.keymap.set(
        'n',
        'grY',
        '<cmd>Lspsaga goto_type_definition<cr>',
        { desc = 'go to type definition', silent = true }
      ),
      vim.keymap.set(
        'n',
        'gry',
        '<cmd>Lspsaga peek_type_definition<cr>',
        { desc = 'peek type definition', silent = true }
      ),
      vim.keymap.set(
        { 'n', 'v', 'x' },
        'gra',
        '<cmd>Lspsaga code_action<cr>',
        { desc = 'code actions', silent = true }
      ),

      vim.keymap.set('n', 'grn', '<cmd>Lspsaga rename mode=n<cr>', { desc = 'Rename with lsp', silent = true }),
      vim.keymap.set('n', 'gro', '<cmd>Lspsaga outline<cr>', { desc = 'Outline', silent = true }),
    })
  end,
}
