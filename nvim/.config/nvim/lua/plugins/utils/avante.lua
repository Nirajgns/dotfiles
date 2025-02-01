return {
  "yetone/avante.nvim",
  keys = { "<leader>aa", "<leader>ap", "<leader>ae", "<leader>ar", "<leader>at" },
  -- event = "VeryLazy",
  opts = {
    provider = "copilot",

    auto_suggestions_provider = "copilot",
    copilot = {
      model = "gpt-4o",
      max_tokens = 64000,
    },
    behaviour = {
      support_paste_from_clipboard = true,
      auto_suggestions = false,
    },
    mappings = {
      submit = {
        normal = "<CR>",
        insert = "<CR>",
      },
    },
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
  },
}
