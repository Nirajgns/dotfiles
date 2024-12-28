return {
  "Shatur/neovim-ayu",
  priority = 1000,
  config = function()
    local colors = require("ayu.colors")
    colors.generate(false)
    require("ayu").setup({
      mirage = false,
      overrides = function()
        return {
          -- Normal = { bg = '#231200' },
          LineNr = { fg = "#7F6633" }, -- 50% luminance of #FFCC66 used in colors.accent
          BlinkCmpGhostText = { fg = colors.accent },
          LspInlayHint = { fg = colors.comment, bg = colors.bg, italic = true },
          Pmenu = { bg = colors.bg },
          PmenuSel = { fg = "#7F6633" },
        }
      end,
    })
  end,
}
