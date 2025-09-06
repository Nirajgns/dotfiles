return {
  'MagicDuck/grug-far.nvim',
  keys = {
    {
      '<leader>sf',
      '<cmd>lua require("grug-far").open({ prefills = { paths = vim.fn.expand("%"),search = vim.fn.expand("<cword>") } })<CR>',
      desc = 'Search and replace on current file',
      mode = { 'n', 'v' },
      silent = true,
    },
    {
      '<leader>sp',
      ':lua require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })<CR>',
      desc = 'Search and replace on entire project',
      mode = { 'n', 'v' },
      silent = true,
    },
  },
  config = function()
    require('grug-far').setup({
      -- options, see Configuration section below
      -- there are no required options atm
      -- engine = 'ripgrep' is default, but 'astgrep' can be specified
    })
  end,
}
