return {
  "TaDaa/vimade",
  -- enabled = false,
  event = "LazyFile",
  config = function()
    local Fade = require("vimade.style.fade").Fade
    local direction = require("vimade.style.value.direction")
    local ease = require("vimade.style.value.ease")
    local animate = require("vimade.style.value.animate")

    require("vimade").setup({
      ncmode = "windows",
      style = {
        Fade({
          value = animate.Number({
            start = 1,
            to = 0.4,
            direction = direction.OUT,
            duration = 700,
            ease = ease.LINEAR,
            delay = 0,
          }),
        }),
      },
    })
    vim.keymap.set(
      "n",
      "<leader>uv",
      ":VimadeToggle<CR>",
      { desc = "Toggle Vimade Shading", noremap = true, silent = true }
    )
  end,
}
