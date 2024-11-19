return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  cmd = "NoNeckPain",
  -- event = "LazyFile",
  config = function()
    require("no-neck-pain").setup({
      debug = false,
      width = 130,
      minSideBufferWidth = 10,
      disableOnLastBuffer = false,
      killAllBuffersOnDisable = false,
      autocmds = {
        enableOnVimEnter = false,
        enableOnTabEnter = false,
        reloadOnColorSchemeChange = false,
        skipEnteringNoNeckPainBuffer = false,
      },
      -- Supported integrations that might clash with `no-neck-pain.nvim`'s behavior.
    })
  end,

  vim.keymap.set("n", "<leader>qz", function()
    -- Declare a global variable to track the state
    if not _G.is_nnp_enabled then
      _G.is_nnp_enabled = false
    end

    if not _G.is_nnp_enabled then
      -- Enable Neotree float
      vim.cmd("Neotree float")

      -- Close Neotree after 50ms
      vim.defer_fn(function()
        vim.cmd("Neotree close")
      end, 50)

      -- Enable NoNeckPain after 200ms
      vim.defer_fn(function()
        vim.cmd("NoNeckPain")
      end, 200)

      -- Toggle the state
      _G.is_nnp_enabled = true
    elseif _G.is_nnp_enabled then
      -- Disable NoNeckPain after 200ms
      vim.defer_fn(function()
        vim.cmd("NoNeckPain")
      end, 200)

      -- Move Neotree to the left after 200ms
      vim.defer_fn(function()
        vim.cmd("Neotree left")
      end, 200)

      -- Toggle the state
      _G.is_nnp_enabled = false
    end
  end, { silent = true, desc = "Toggle Zenmode with NNP" }),
}
