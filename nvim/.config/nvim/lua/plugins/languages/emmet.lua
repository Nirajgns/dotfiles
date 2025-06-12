return {
  ft = { 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  'olrtg/nvim-emmet',
  config = function()
    vim.keymap.set(
      { 'n', 'v' },
      '<leader>cw',
      require('nvim-emmet').wrap_with_abbreviation,
      { desc = 'wrap with abbreviation' }
    )
  end,
}
