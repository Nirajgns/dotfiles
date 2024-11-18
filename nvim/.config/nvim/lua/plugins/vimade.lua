return {
  "TaDaa/vimade",
  enabled = true,
  event = "LazyFile",
  config = function()
    local Fade = require("vimade.style.fade").Fade
    local direction = require("vimade.style.value.direction")
    local ease = require("vimade.style.value.ease")
    local animate = require("vimade.style.value.animate")

    require("vimade").setup({
      style = {
        Fade({
          value = animate.Number({
            start = 1,
            to = 0.3,
            direction = direction.OUT,
            duration = 500,
            ease = ease.OUT_SINE,
            delay = 1,
          }),
        }),
      },
    })
    vim.keymap.set("n", "<leader>ut", ":VimadeToggle<CR>", { noremap = true, silent = true })
  end,
}
