return {
  "stevearc/overseer.nvim",
  cmd = {
    "OverseerOpen",
    "OverseerClose",
    "OverseerToggle",
    "OverseerSaveBundle",
    "OverseerLoadBundle",
    "OverseerDeleteBundle",
    "OverseerRunCmd",
    "OverseerRun",
    "OverseerInfo",
    "OverseerBuild",
    "OverseerQuickAction",
    "OverseerTaskAction",
    "OverseerClearCache",
  },

  keys = {
    { "<leader>tt", "<cmd>OverseerToggle<cr>", desc = "Task list" },
    { "<leader>tr", "<cmd>OverseerRun<cr>", desc = "Run task" },
    { "<leader>tq", "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
    { "<leader>ti", "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
    { "<leader>tb", "<cmd>OverseerBuild<cr>", desc = "Task builder" },
    { "<leader>ta", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
    { "<leader>tc", ":OverseerRunCmd<cr>", desc = "Run Cmd", silent = true },
    { "<leader>ts", ":OverseerSaveBundle<cr>", desc = "Save Tasks Bundle", silent = true },
    { "<leader>td", ":OverseerDeleteBundle<cr>", desc = "Delete Tasks Bundle", silent = true },
    { "<leader>tl", ":OverseerLoadBundle<cr>", desc = "Load Tasks Bundle", silent = true },
  },

  opts = {
    dap = false,
    task_list = {
      default_detail = 2,
      max_width = 50,
      min_width = 50,
      width = 50,
      max_height = 15,
      min_height = 15,
      height = 15,
      separator = "---------------------------------------------------------------------------------------------------",
      bindings = {
        ["<C-h>"] = false,
        ["<C-j>"] = false,
        ["<C-k>"] = false,
        ["<C-l>"] = false,
        ["C-left"] = "DecreaseWidth",
        ["C-right"] = "IncreaseWidth",
        ["<C-p>"] = "PrevTask",
        ["<C-n>"] = "NextTask",
        ["<C-b>"] = "ScrollOutputUp",
        ["<C-f>"] = "ScrollOutputDown",
      },
    },
    form = {
      win_opts = {
        border = "rounded",
        winblend = 0,
      },
    },
    confirm = {
      win_opts = {
        border = "rounded",
        winblend = 0,
      },
    },
    task_win = {
      win_opts = {
        border = "rounded",
        winblend = 0,
      },
    },
  },
}
