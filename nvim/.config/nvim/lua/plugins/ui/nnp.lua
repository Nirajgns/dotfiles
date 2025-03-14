return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  cmd = "NoNeckPain",
  config = function()
    require("no-neck-pain").setup({
      debug = false,
      width = 130,
      minSideBufferWidth = 20,
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

  vim.keymap.set("n", "<leader>uN", function()
    _G.is_nnp_enabled = not _G.is_nnp_enabled

    if _G.is_nnp_enabled then
      vim.cmd("set laststatus=0")
      vim.cmd("Neotree float")
      vim.defer_fn(function()
        vim.cmd("Neotree close")
        vim.cmd("NoNeckPain")
      end, 200)
    else
      vim.cmd("set laststatus=3")
      vim.cmd("NoNeckPain")
      vim.cmd("Neotree left")
    end
  end, { silent = true, desc = "Toggle  NNP(Zen)" }),
}
