local cp = require("catppuccin.palettes").get_palette()

local TelescopeColor = {
  TelescopeBorder = { fg = cp.mantle, bg = cp.mantle },
  TelescopePromptBorder = { fg = cp.surface1, bg = cp.surface1 },
  TelescopeResultsBorder = { fg = cp.mantle, bg = cp.mantle },
  TelescopePreviewBorder = { fg = cp.mantle, bg = cp.mantle },

  TelescopePromptNormal = { fg = cp.text, bg = cp.surface1 },
  TelescopePromptPrefix = { fg = cp.pink, bg = cp.surface1 },
  TelescopeNormal = { bg = cp.mantle },
  TelescopeResultsNormal = { bg = cp.mantle },
  TelescopePreviewNormal = { bg = cp.mantle },

  TelescopePromptTitle = { fg = cp.mantle, bg = cp.red },
  TelescopeResultsTitle = { fg = cp.mantle, bg = cp.mantle },
  TelescopePreviewTitle = { fg = cp.mantle, bg = cp.green },

  TelescopeSelection = { fg = cp.text, bg = cp.surface1 },
  TelescopeMatching = { fg = cp.blue, bg = cp.surface1 },
}

for hl, col in pairs(TelescopeColor) do
  vim.api.nvim_set_hl(0, hl, col)
end

return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  cmd = "Telescope",
  opts = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {
        mappings = { n = { ["q"] = actions.close } },
        prompt_prefix = "  ",
        selection_caret = "🢂 ",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            preview_width = 0.5,
            prompt_position = "top",
          },
        },
        sorting_strategy = "ascending",
      },
    })
  end,

  vim.keymap.set(
    "n",
    "<leader>'",
    "<cmd>Telescope marks<cr>",
    { noremap = true, silent = true, desc = "marks with telescope" }
  ),
}
