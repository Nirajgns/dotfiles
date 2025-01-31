return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = { "CopilotExplain", "CopilotExplainLong", "CopilotChatFix", "CopilotChatToggle" },
    keys = {
      { "<leader>a", desc = "Copilot AI" },
      { mode = { "v", "n" }, "<leader>ae", ":CopilotChatExplain<cr>", desc = "Explain", silent = true },
      { mode = { "v", "n" }, "<leader>aE", ":CopilotChatExplainLong<cr>", desc = "Explain long", silent = true },
      { mode = { "n" }, "<leader>aa", ":CopilotChatToggle<cr>", desc = "Copilot chat toggle", silent = true },
      { mode = { "v" }, "<leader>aa", ":CopilotChatExplain<cr>", desc = "Copilot chat toggle", silent = true },
      { mode = { "v", "n" }, "<leader>ao", ":CopilotChatOptimize<cr>", desc = "Copilot optimize", silent = true },
      { mode = { "v", "n" }, "<leader>at", ":CopilotChatTests<cr>", desc = "Copilot generate tests", silent = true },
    },
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    config = function()
      require("CopilotChat").setup({
        chat_autocomplete = true,

        separator = "~~~~~~~", -- Separator to use in chat
        window = {
          layout = "float",
          relative = "cursor",
          width = 0.6,
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
      })
    end,
  },
}
