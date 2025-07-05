local map = vim.keymap.set

vim.keymap.set('t', '<C-S-v>', [[<C-\><C-n>"+pa]], { noremap = true })

map({ 'i', 't', 'c', 'x' }, '<A-BS>', '<C-w>', { noremap = true, silent = false, desc = 'delete word with alt+bcspc' })
map({ 'i', 't', 'c', 'x' }, '<C-BS>', '<C-w>', { noremap = true, silent = false, desc = 'delete word with ctrl+bcspc' })

map('i', 'jk', '<ESC>', { noremap = true, silent = true })

map('i', 'ii', '<ESC>', { noremap = true, silent = true })
map('t', 'ii', '<C-\\><C-n>', { noremap = true, silent = true })
map('t', '<esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Terminal mode window navigation
vim.api.nvim_set_keymap('n', '<c-q>', '<cmd>lua Snacks.bufdelete()<cr>', { desc = 'delete buffer' })
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })

-- Insert mode mappings to move the cursor
map('i', '<C-a-h>', '<Left>', { noremap = true, silent = true })
map('i', '<C-a-j>', '<Down>', { noremap = true, silent = true })
map('i', '<C-a-k>', '<Up>', { noremap = true, silent = true })
map('i', '<C-a-l>', '<Right>', { noremap = true, silent = true })

-- Command mode mappings
map('c', '<C-a-h>', '<Left>', { noremap = true, silent = false })
map('c', '<C-a-j>', '<Down>', { noremap = true, silent = false })
map('c', '<C-a-k>', '<Up>', { noremap = true, silent = false })
map('c', '<C-a-l>', '<Right>', { noremap = true, silent = false })

---switch buffers with TAB key
map('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
map('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

vim.keymap.del('n', '<leader>ft')
vim.keymap.del('n', '<leader>fT')
vim.keymap.del('n', '<leader>sr')

---=======================for easy typing--------------------------
map({ 'i', 't', 'c', 'x' }, '<C-BS>', '<C-w>', { noremap = true, silent = false, desc = 'delete word with ctrl+bcspc' })

map({ 'n' }, '<C-S-s>', '<cmd>wa<cr>', { noremap = true, silent = true, desc = 'save all' })

-----------copy and paste--------------
map('v', '<C-c>', '"+y', { silent = true, desc = 'copy in visual mode' })
map('c', '<C-v>', '<C-r>+', { noremap = true, desc = 'paste in command mode' })
map('n', '<C-S-v>', '"+P', { silent = true, desc = 'paste in normal mode' })
map('v', '<C-S-v>', '"+P', { silent = true, desc = 'paste in visual mode' })
map('i', '<C-v>', '<C-R>+', { silent = true, desc = 'paste in insert mode' })

map('n', '<leader>lS', '<cmd>LspRestart<cr>', { desc = 'Force lsp restart' })

map('n', '<leader>qo', '<cmd>source $MYVIMRC<cr>', { desc = 'source nvim config' })

-- Function to open file under cursor in the "main panel" (e.g., window 1)
vim.keymap.set('n', 'gf', function()
  -- Get the full word under the cursor (e.g., "file.txt:42:5")
  local full_path = vim.fn.expand('<cWORD>') -- Use <cWORD> for broader matching

  -- Parse filename, line, and column
  local filename, line, col = full_path:match('^([^:]+):(%d+):?(%d*)$')
  if not filename then
    filename = full_path -- Fallback to full string if no match
    line = nil
    col = nil
  end

  -- Ensure valid numbers (nil or empty string becomes 1)
  line = tonumber(line) or 1
  col = tonumber(col) or 1

  -- Switch to the "main panel" (e.g., window 1 or previous window)
  vim.cmd('1wincmd w') -- Explicitly target window 1 (adjust as needed)

  -- Open the file and ensure buffer is loaded
  vim.cmd('edit ' .. vim.fn.fnameescape(filename))

  -- Move cursor to line and column after buffer is loaded
  vim.schedule(function()
    vim.api.nvim_win_set_cursor(0, { line, col - 1 }) -- Column is 0-based in API
  end)
end, { desc = 'Open file under cursor', noremap = true, silent = true })
