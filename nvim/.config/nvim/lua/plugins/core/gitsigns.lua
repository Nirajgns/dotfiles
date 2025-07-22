return {
  'lewis6991/gitsigns.nvim',
  -- enabled = false,
  event = 'LazyFile',
  opts = {
    signs = {
      add = { text = '│' },
      change = { text = '│' },
    },
    signs_staged = {
      add = { text = '│' },
      change = { text = '│' },
    },
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 100,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
  },
}
