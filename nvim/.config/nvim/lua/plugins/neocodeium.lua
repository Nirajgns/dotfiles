return {
  "monkoose/neocodeium",
  event = "InsertEnter",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()
    vim.keymap.set("i", "<A-cr>", neocodeium.accept)
    vim.keymap.set("i", "<A-f>", neocodeium.accept)
    vim.keymap.set("i", "<A-w>", neocodeium.accept_word)
    vim.keymap.set("i", "<A-l>", neocodeium.accept_line)
    vim.keymap.set("i", "<A-n>", neocodeium.cycle_or_complete)
    vim.keymap.set("i", "<A-c>", neocodeium.clear)
    vim.keymap.set("n", "<leader>ch", "<cmd>NeoCodeium chat<cr>")
  end,
}
