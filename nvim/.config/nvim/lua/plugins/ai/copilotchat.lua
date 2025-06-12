vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'copilot-*',
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
  end,
})

return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    enabled = false,
    cmd = { 'CopilotChat', 'CopilotChatExplain', 'CopilotChatExplainLong', 'CopilotChatFix', 'CopilotChatToggle' },
    keys = {
      { mode = { 'v', 'n' }, '<leader>ac', ':CopilotChat ', desc = 'Copilot Chat' },
      { mode = { 'v', 'n' }, '<leader>ar', ':CopilotChatReview<cr>', desc = 'Copilot Review', silent = true },
      { mode = { 'v', 'n' }, '<leader>ae', ':CopilotChatExplain<cr>', desc = 'Explain', silent = true },
      { mode = { 'v', 'n' }, '<leader>aE', ':CopilotChatExplainLong<cr>', desc = 'Explain long', silent = true },
      { mode = { 'n' }, '<leader>aa', ':CopilotChatToggle<cr>', desc = 'Copilot chat toggle', silent = true },
      { mode = { 'v', 'n' }, '<leader>ao', ':CopilotChatOptimize<cr>', desc = 'Copilot optimize', silent = true },
      { mode = { 'v', 'n' }, '<leader>at', ':CopilotChatTests<cr>', desc = 'Copilot generate tests', silent = true },
      { mode = { 'v', 'n' }, '<leader>af', ':CopilotChatFix<cr>', desc = 'Copilot fix', silent = true },
      {
        mode = { 'n', 'v' },
        '<leader>ap',
        ':CopilotChatPrompts<cr>',
        silent = true,
        desc = 'CopilotChat - Prompt actions',
      },
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    config = function()
      require('CopilotChat').setup({
        question_header = '  ME: ',
        answer_header = '  COPILOT: ',
        error_header = '  ERROR: ',
        chat_autocomplete = true,
        separator = '', -- Separator to use in chat
        window = {
          -- layout = "float",
          -- relative = "cursor",
          -- width = 0.6,
          layout = 'vertical',
          relative = 'editor',
          width = 0.28,
          height = 0.4,
          row = 1,
        },
        prompts = {
          Explain = {
            prompt = '> /COPILOT_EXPLAIN\n\nWrite a very short explanation for the selected code.',
          },

          ExplainLong = {
            prompt = '> /COPILOT_EXPLAIN\n\nWrite a detailed explanation for the selected code.',
          },
        },
        mappings = {
          accept_diff = {
            normal = '<ga>',
            insert = '<c-y>',
          },
          reject_diff = {
            normal = '<gr>',
            insert = '<C-e>',
          },
          close = {
            normal = 'q',
          },
          complete = {
            insert = 'A-f',
          },
          submit_prompt = {
            normal = '<CR>',
            insert = '<CR>',
          },
          reset = {
            normal = '<C-c>',
            insert = '<C-c>',
          },
        },
      })
    end,
  },
}
