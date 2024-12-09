-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.scrolloff = 5

-- Line Numbers
opt.relativenumber = false
-- opt.number = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 2

-- Line Wrapping
opt.wrap = true
opt.linebreak = true

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

vim.diagnostic.open_float()
vim.diagnostic.config({
  float = { border = "rounded" }, -- add border to diagnostic popups
})

-- Backspace
opt.backspace = "indent,eol,start"

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append("-")
opt.list = false --to remove "-" while typing "space"

-- Disable the mouse while in nvim
-- opt.mouse = ""
-- Folding
-- fold settings
opt.foldlevel = 20
vim.wo.foldmethod = "indent" --"expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldtext =
  [[substitute(getline(v:foldstart), '\\t', repeat(' ', &tabstop), 'g') .'       ...        --->' .'  ' . (v:foldend - v:foldstart + 1) . ' lines folded!']]
vim.wo.fillchars = "fold:\\"

-- vim.wo.foldnestmax = 3
-- vim.wo.foldminlines = 1
