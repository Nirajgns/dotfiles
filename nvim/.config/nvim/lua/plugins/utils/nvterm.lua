return {
  "NvChad/nvterm",
  keys = { "<A-v>", "<A-h>", "<A-t>" },
  -- enabled = false,
  config = function()
    require("nvterm").setup({
      terminals = {
        shell = vim.o.shell,
        list = {},
        type_opts = {
          float = {
            relative = "editor",
            row = (1 - 0.85) / 2, -- Center vertically
            col = (1 - 0.85) / 2, -- Center horizontally
            width = 0.85, -- 75% of the editor's width
            height = 0.80, -- 75% of the editor's height
            border = "rounded", -- Rounded border for the floating window
          },
          horizontal = { location = "rightbelow", split_ratio = 0.30 },
          vertical = { location = "rightbelow", split_ratio = 0.30 },
        },
      },
    })

    local function toggle_and_insert(direction)
      require("nvterm.terminal").toggle(direction)
      vim.defer_fn(function()
        if vim.bo.buftype == "terminal" then
          vim.cmd("startinsert!")
        end
      end, 20) -- slight delay (in ms) to let Neovim switch buffers
    end

    vim.keymap.set({ "n", "t" }, "<A-v>", function()
      toggle_and_insert("vertical")
    end, { noremap = true, silent = true, desc = "vertical terminal toggle" })

    vim.keymap.set({ "n", "t" }, "<A-t>", function()
      toggle_and_insert("float")
    end, { noremap = true, silent = true, desc = "floating terminal toggle" })

    vim.keymap.set({ "n", "t" }, "<A-h>", function()
      toggle_and_insert("horizontal")
    end, { noremap = true, silent = true, desc = "horizontal terminal toggle" })
  end,
}
