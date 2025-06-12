return {
  'lewis6991/gitsigns.nvim',
  enabled = false,
  event = 'LazyFile',
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
      delay = 100,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
  },
}
