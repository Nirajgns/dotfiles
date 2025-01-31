return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = { "CopilotChat", "CopilotChatExplain", "CopilotChatExplainLong", "CopilotChatFix", "CopilotChatToggle" },
    keys = {
      { mode = { "v", "n" }, "<leader>ac", ":CopilotChat<cr>", desc = "Copilot Review", silent = true },
      { mode = { "v", "n" }, "<leader>ar", ":CopilotChatReview<cr>", desc = "Copilot Review", silent = true },
      { mode = { "v", "n" }, "<leader>ae", ":CopilotChatExplain<cr>", desc = "Explain", silent = true },
      { mode = { "v", "n" }, "<leader>aE", ":CopilotChatExplainLong<cr>", desc = "Explain long", silent = true },
      { mode = { "n" }, "<leader>aa", ":CopilotChatToggle<cr>", desc = "Copilot chat toggle", silent = true },
      { mode = { "v" }, "<leader>aa", ":CopilotChat<cr>", desc = "Copilot chat toggle", silent = true },
      { mode = { "v", "n" }, "<leader>ao", ":CopilotChatOptimize<cr>", desc = "Copilot optimize", silent = true },
      { mode = { "v", "n" }, "<leader>at", ":CopilotChatTests<cr>", desc = "Copilot generate tests", silent = true },
      {
        "<leader>ap",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.snacks").pick(actions.prompt_actions(), {
            layout = "select",
          })
        end,
        desc = "CopilotChat - Prompt actions",
      },
    },
    dependencies = {
      { "zbirenbaum/copilot.lua" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    config = function()
      require("CopilotChat").setup({
        question_header = "##    USER",
        answer_header = "##     COPILOT",
        error_header = "##     ERROR",
        chat_autocomplete = true,
        separator = "", -- Separator to use in chat
        window = {
          -- layout = "float",
          -- relative = "cursor",
          -- width = 0.6,
          layout = "vertical",
          relative = "editor",
          width = 0.33,
          height = 0.4,
          row = 1,
        },
        prompts = {
          Explain = {
            prompt = "> /COPILOT_EXPLAIN\n\nWrite a very short explanation for the selected code.",
          },

          ExplainLong = {
            prompt = "> /COPILOT_EXPLAIN\n\nWrite a detailed explanation for the selected code.",
          },
        },
        mappings = {
          close = {
            normal = "q",
          },
          complete = {
            insert = "A-f",
          },
          submit_prompt = {
            normal = "<CR>",
            insert = "<CR>",
          },
          reset = {
            normal = "<C-c>",
            insert = "<C-c>",
          },
        },
      })
    end,
  },
}
