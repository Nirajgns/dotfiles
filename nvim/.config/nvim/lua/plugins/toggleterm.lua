return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "LazyFile",
    enabled = false,
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<A-h>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
        hide_numbers = true, -- hide the number column in toggleterm buffers
        autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
        shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
        start_in_insert = true,
        insert_mappings = false, -- whether or not the open mapping applies in insert mode
        terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
        persist_size = true,
        persist_mode = false, -- if set to true (default) the previous terminal mode will be remembered
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
          border = "rounded", --... other options supported by win open
        },
      })

      vim.keymap.set({ "n", "t" }, "<A-f>", "<cmd>4ToggleTerm direction=float<cr>", { noremap = true, silent = true })

      vim.keymap.set(
        { "n", "t" },
        "<A-v>",
        "<cmd>9ToggleTerm direction=vertical size=50<cr>",
        { noremap = true, silent = true }
      )
    end,
  },
}
