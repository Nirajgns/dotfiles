return {
  "monkoose/neocodeium",
  event = "InsertEnter",
  -- enabled = false,
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()
    vim.keymap.set("i", "<A-f>", neocodeium.accept)
    vim.keymap.set("i", "<A-w>", neocodeium.accept_word)
    vim.keymap.set("i", "<A-l>", neocodeium.accept_line)
    vim.keymap.set("i", "<A-n>", neocodeium.cycle_or_complete)
    vim.keymap.set("i", "<A-c>", neocodeium.clear)
    vim.keymap.set("i", "<A-p>", function()
      require("neocodeium").cycle_or_complete(-1)
    end)
    vim.keymap.set("n", "<leader>ch", "<cmd>NeoCodeium chat<cr>")
  end,
}
