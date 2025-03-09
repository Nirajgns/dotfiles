return {
  "olimorris/codecompanion.nvim",
  -- enabled = false,
  keys = {
    {
      "<leader>aa",
      "<CMD>CodeCompanionChat Toggle<CR>",
      desc = "CodeCompanion",
      silent = true,
      mode = { "n", "x" },
    },
    {
      "<leader>ac",
      "<CMD>CodeCompanion <CR>",
      desc = "CodeCompanion",
      silent = true,
      mode = { "n", "x" },
    },
    {
      "<leader>ae",
      "<CMD>CodeCompanion /explain<CR>",
      desc = "CodeCompanion Explain",
      silent = true,
      mode = { "n", "x" },
    },
    {
      "<leader>aE",
      "<CMD>CodeCompanion explain in short<CR>",
      desc = "CodeCompanion Explain in detail",
      silent = true,
      mode = { "n", "x" },
    },
    {
      "<leader>af",
      "<CMD>CodeCompanion please take a look at the code and fix it accordingly<CR>",
      desc = "CodeCompanion fix",
      silent = true,
      mode = { "n", "x" },
    },
    {
      "<leader>ap",
      "<CMD>CodeCompanionActions<CR>",
      desc = "CodeCompanion Actions picker",
      silent = true,
      mode = { "n", "x" },
    },
  },
  config = function()
    require("codecompanion").setup({
      display = {
        action_palette = {
          width = 95,
          height = 10,
          prompt = "Prompt ", -- Prompt used for interactive LLM calls
          provider = "default", -- default|telescope|mini_pick
          opts = {
            show_default_actions = true, -- Show the default actions in the action palette?
            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
          },
        },
        chat = {
          chat = {
            intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
            show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
            separator = "~", -- The separator between the different messages in the chat buffer
            show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
            show_settings = true, -- Show LLM settings at the top of the chat buffer?
            show_token_count = true, -- Show the token count for each response?
            start_in_insert_mode = true, -- Open the chat buffer in insert mode?
          },
          window = {
            layout = "vertical", -- float|vertical|horizontal|buffer
            position = "right", -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
            border = "single",
            height = 0.8,
            width = 0.3,
            relative = "editor",
            opts = {
              number = false,
              relativenumber = false,
              breakindent = true,
              cursorline = true,
              foldcolumn = "0",
              linebreak = true,
              list = false,
              numberwidth = 1,
              signcolumn = "no",
              spell = false,
              wrap = true,
            },
          },
        },
      },
      strategies = {
        inline = {
          adapter = "copilot",
          keymaps = {
            accept_change = {
              modes = {
                n = "ga",
                i = "<C-y>",
              },
              index = 1,
              callback = "keymaps.accept_change",
              description = "Accept the AI suggested change",
            },
            reject_change = {
              modes = {
                n = "gr",
                i = "<C-e>",
              },
              index = 2,
              callback = "keymaps.reject_change",
              description = "Reject the AI suggested change",
            },
          },
          prompts = {
            -- The prompt to send to the LLM when a user initiates the inline strategy and it needs to convert to a chat
            inline_to_chat = function(context)
              return fmt(
                [[I want you to act as an expert and senior developer in the %s language. I will ask you questions, perhaps giving you code examples, and I want you to advise me with explanations and code where necessary.]],
                context.filetype
              )
            end,
          },
        },
        chat = {
          keymaps = {
            completion = {
              modes = {
                i = "<C-x>",
              },
              index = 1,
              callback = "keymaps.completion",
              description = "Completion Menu",
            },
            send = {
              modes = { n = "<CR>", i = "<c-CR>" },
            },
            stop = {
              modes = {
                n = "<C-c>",
              },
              index = 5,
              callback = "keymaps.stop",
              description = "Stop Request",
            },
            codeblock = {
              modes = {
                n = "gi",
              },
              index = 7,
              callback = "keymaps.codeblock",
              description = "Insert Codeblock",
            },
            close = {
              modes = {
                n = "q",
                i = "<C-c>",
              },
              index = 4,
              callback = "keymaps.close",
              description = "Close Chat",
            },
          },
        },
      },
    })

    -- Keymaps
    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])

    vim.cmd([[cab ccc CodeCompanionChat]])
  end,
}
