return {
  'mikavilpas/yazi.nvim',
  cmd = { 'Yazi' },
  dependencies = {
    -- check the installation instructions at
    -- https://github.com/folke/snacks.nvim
    'folke/snacks.nvim',
  },
  keys = {
    {
      '<leader>y',
      '<cmd>Yazi cwd<cr>',
      desc = 'Open Yazi in CWD',
    },
    {
      '<leader>Y',
      '<cmd>Yazi toggle<cr>',
      desc = 'Resume the last yazi session',
    },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = '<f1>',
    },
  },
  init = function()
    vim.g.loaded_netrwPlugin = 1
  end,
}
