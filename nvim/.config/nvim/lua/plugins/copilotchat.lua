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
      -- { "github/copilot.vim" },
      {
        "zbirenbaum/copilot.lua",
        config = function()
          require("copilot").setup({
            panel = {
              enabled = false,
              auto_refresh = false,
              keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<M-CR>",
              },
              layout = {
                position = "bottom", -- | top | left | right | horizontal | vertical
                ratio = 0.4,
              },
            },
            suggestion = {
              enabled = true,
              auto_trigger = true,
              hide_during_completion = false,
              debounce = 100,
              keymap = {
                accept = "<A-f>",
                accept_word = "<A-w>",
                accept_line = "<A-l>",
                next = "<A-n>",
                prev = "<A-p>",
                dismiss = "<A-c>",
              },
            },
            filetypes = {
              yaml = false,
              markdown = false,
              help = false,
              gitcommit = false,
              gitrebase = false,
              hgcommit = false,
              svn = false,
              cvs = false,
              ["."] = false,
            },
            copilot_node_command = "node", -- Node.js version must be > 18.x
            server_opts_overrides = {},
          })
        end,
      },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    config = function()
      require("CopilotChat").setup({
        chat_autocomplete = true,

        separator = "~~~~~~~", -- Separator to use in chat
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
          complete = {
            insert = "A-f",
          },
        },
      })
    end,
  },
}
