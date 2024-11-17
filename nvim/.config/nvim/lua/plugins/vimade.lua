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
            ease = ease.OUT_SINE,
            duration = 500,
            delay = 1,
          }),
        }),
      },
      link = { buf_opts = { buftype = { "prompt", "terminal" } } },
    })
  end,
}
