return {
  "akinsho/toggleterm.nvim",
  version = "*",
  enabled = false,
  keys = {
    "<A-h>",
    "<A-f>",
    "<A-v>",
    "<A-1>",
    "<A-2>",
    "<A-3>",
    "<A-4>",
    "<A-5>",
    "<A-6>",
    "<A-7>",
    "<A-8>",
    "<A-9>",
  },
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<A-h>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
      hide_numbers = true, -- hide the number column in toggleterm buffers
      autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
      shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
      direction = "horizontal",
      close_on_exit = true, -- close the terminal window when the process exits
      clear_env = false, -- use only environmental variables from `env`, passed to jobstart()
      -- Change the default shell. Can be a string or a function returning a string
      shell = vim.o.shell,
      auto_scroll = true, -- automatically scroll to the bottom on terminal output
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
        width = 170,
        height = 35,
        zindex = 1000,
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
        border = "curved", --... other options supported by win open
      },
      -- on_open = function(_)
      --   local name = vim.fn.bufname("neo-tree")
      --   local winnr = vim.fn.bufwinnr(name)
      --   if winnr ~= -1 then
      --     vim.defer_fn(function()
      --       -- local cmd = string.format("Neotree toggle")
      --       vim.cmd("Neotree close")
      --       vim.cmd("Neotree show")
      --       vim.cmd("wincmd p")
      --     end, 0)
      --   end
      -- end,
    })

    ----Horizontal terminals
    vim.keymap.set(
      { "n", "t" },
      "<A-1>",
      "<cmd>1ToggleTerm direction=horizontal<cr>",
      { noremap = true, silent = true, desc = "horizontal terminal 1" }
    )
    vim.keymap.set(
      { "n", "t" },
      "<A-2>",
      "<cmd>2ToggleTerm direction=horizontal<cr>",
      { noremap = true, silent = true, desc = "horizontal terminal 2" }
    )
    vim.keymap.set(
      { "n", "t" },
      "<A-h>",
      "<cmd>3ToggleTerm direction=horizontal<cr>",
      { noremap = true, silent = true, desc = "horizontal terminal 3" }
    )
    vim.keymap.set(
      { "n", "t" },
      "<A-3>",
      "<cmd>3ToggleTerm direction=horizontal<cr>",
      { noremap = true, silent = true, desc = "horizontal terminal 3" }
    )

    ---floating terminals
    vim.keymap.set(
      { "n", "t" },
      "<A-4>",
      "<cmd>4ToggleTerm direction=float<cr>",
      { noremap = true, silent = true, desc = "float terminal 4" }
    )
    vim.keymap.set(
      { "n", "t" },
      "<A-5>",
      "<cmd>5ToggleTerm direction=float<cr>",
      { noremap = true, silent = true, desc = "float terminal 5" }
    )
    vim.keymap.set(
      { "n", "t" },
      "<A-6>",
      "<cmd>6ToggleTerm direction=float<cr>",
      { noremap = true, silent = true, desc = "float terminal 6" }
    )
    vim.keymap.set(
      { "n", "t" },
      "<A-t>",
      "<cmd>6ToggleTerm direction=float<cr>",
      { noremap = true, silent = true, desc = "float terminal 6" }
    )

    ----Vertical terminals
    vim.keymap.set(
      { "n", "t" },
      "<A-7>",
      "<cmd>7ToggleTerm direction=vertical size=50<cr>",
      { noremap = true, silent = true, desc = "vertical terminal 7" }
    )
    vim.keymap.set(
      { "n", "t" },
      "<A-8>",
      "<cmd>8ToggleTerm direction=vertical size=50<cr>",
      { noremap = true, silent = true, desc = "vertical terminal 8" }
    )
    vim.keymap.set(
      { "n", "t" },
      "<A-9>",
      "<cmd>9ToggleTerm direction=vertical size=50<cr>",
      { noremap = true, silent = true, desc = "vertical terminal 9" }
    )
    vim.keymap.set(
      { "n", "t" },
      "<A-v>",
      "<cmd>9ToggleTerm direction=vertical size=50<cr>",
      { noremap = true, silent = true, desc = "vertical terminal 9" }
    )
  end,
}
