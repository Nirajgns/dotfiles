vim.cmd("set iskeyword-=-")

vim.cmd("set iskeyword-=A-Z")
---=================show diagnostics in insert mode===================--

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  -- delay update diagnostics
  update_in_insert = true,
})
--===================floating diagnostics on cursor===================--
-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
local augroup = vim.api.nvim_create_augroup("LspDiagnosticsFloat", { clear = true })

--NOTE: Set the autocommand to open the diagnostic float on CursorHold event
vim.api.nvim_create_autocmd("CursorHold", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

--NOTE:set set_highlight_groups for folded lines
local function set_highlight_groups()
  vim.cmd("highlight Folded guibg=none guifg=brown gui=italic")
end

set_highlight_groups()

--------------------------------neovide------------------
vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_floating_corner_radius = 10.0

vim.g.neovide_hide_mouse_when_typing = true
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "IosevkaTerm NF Light"

vim.g.neovide_fullscreen = true
vim.g.neovide_text_gamma = 1
vim.g.neovide_text_contrast = 1

vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_scale_factor = 1
vim.g.neovide_cursor_trail_size = 0.4

vim.g.neovide_cursor_animation_length = 0.3
vim.g.neovide_scroll_animation_length = 0.08

--NOTE: these functions prevent neovide from scrolling animations on buffer switch
vim.api.nvim_create_autocmd("BufLeave", {
  callback = function()
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_cursor_animation_length = 0.08
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.fn.timer_start(70, function()
      vim.g.neovide_scroll_animation_length = 0.3
      vim.g.neovide_cursor_animation_length = 0.08
    end)
  end,
})

--=============FONT SIZE SETTINGS IN NEOVIDE==============--
vim.g.gui_font_default_size = 13.2

RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
  print("Font size set to: " .. vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  RefreshGuiFont()
end

ResetGuiFont = function()
  vim.g.gui_font_size = vim.g.gui_font_default_size
  RefreshGuiFont()
end

ResetGuiFont()

--NOTE: Keymaps for adjusting neovide fontsize
vim.keymap.set({ "n", "i" }, "<C-+>", function()
  ResizeGuiFont(0.5)
end, { desc = "increase font size" })
vim.keymap.set({ "n", "i" }, "<C-->", function()
  ResizeGuiFont(-0.5)
end, { desc = "decrease font size" })
vim.keymap.set({ "n", "i" }, "<C-=>", function()
  ResetGuiFont()
end, { desc = "reset font size" })

--NOTE: Autocommand to disable numbers in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
