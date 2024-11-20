return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  cmd = "NoNeckPain",
  -- event = "LazyFile",
  config = function()
    require("no-neck-pain").setup({
      debug = false,
      width = 135,
      minSideBufferWidth = 10,
      disableOnLastBuffer = false,
      killAllBuffersOnDisable = false,
      autocmds = {
        enableOnVimEnter = false,
        enableOnTabEnter = false,
        reloadOnColorSchemeChange = false,
        skipEnteringNoNeckPainBuffer = false,
      },
    })
  end,

  vim.keymap.set("n", "<leader>uz", function()
    _G.is_nnp_enabled = not _G.is_nnp_enabled

    if _G.is_nnp_enabled then
      vim.cmd("set relativenumber!")
      vim.cmd("set nonu")
      vim.cmd("Neotree float")
      vim.defer_fn(function()
        vim.cmd("Neotree close")
        vim.cmd("NoNeckPain")
      end, 200)
    else
      vim.cmd("set relativenumber!")
      vim.cmd("set nu")
      vim.cmd("NoNeckPain")
      vim.cmd("Neotree left")
    end
  end, { silent = true, desc = "Toggle Zenmode with NNP" }),
}
