return {
  'supermaven-inc/supermaven-nvim',
  event = 'InsertEnter',
  config = function()
    require('supermaven-nvim').setup({
      keymaps = {
        accept_suggestion = '<Tab>',
        clear_suggestion = '<A-y>',
        accept_word = 'A-w>',
      },
    })
  end,
}
