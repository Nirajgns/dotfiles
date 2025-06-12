---@diagnostic disable: missing-fields
return {
  "folke/flash.nvim",
  event = function()
    return { "BufReadPost", "BufWritePost", "BufNewFile" }
  end,
  keys = {
    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },
  },
  config = function()
    require("flash").setup({
      labels = "asdfghjklqwertyuiopzxcvbnm",
      search = {
        -- search/jump in all windows
        multi_window = false,
        -- search direction
        forward = true,
        -- when `false`, find only matches in the given direction
        wrap = true,
        -- mode = function(str)
        --   return "\\<" .. str
        -- end,
        -- behave like `incsearch`
        -- incremental = true,
        filetype_exclude = {
          "notify",
          "noice",
          "cmp_menu",
          "flash_prompt",
          function(win)
            -- exclude non-focusable windows
            return not vim.api.nvim_win_get_config(win).focusable
          end,
        },
      },
    })

    vim.keymap.set({ "n", "x" }, "s", function()
      require("flash").jump({})
    end, { desc = "flash easy-motion" })

    vim.keymap.set({ "n", "x" }, "T", function()
      require("flash").treesitter()
    end, { desc = "flash treesitter" })
  end,
}
