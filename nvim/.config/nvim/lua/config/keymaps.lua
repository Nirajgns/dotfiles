local map = vim.keymap.set

map("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })

--jk to exit insert and terminal mode
map("i", "jk", "<ESC>", { noremap = true, silent = true })
map("i", "kj", "<ESC>", { noremap = true, silent = true })
map("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })
map("t", "kj", "<C-\\><C-n>", { noremap = true, silent = true })
map("t", "<esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Terminal mode window navigation

vim.api.nvim_set_keymap("n", "<c-q>", "<cmd>lua Snacks.bufdelete()<cr>", { desc = "delete buffer" })
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true, silent = true })

-- Insert mode mappings to move the cursor
map("i", "<C-h>", "<Left>", { noremap = true, silent = true })
map("i", "<C-j>", "<Down>", { noremap = true, silent = true })
map("i", "<C-k>", "<Up>", { noremap = true, silent = true })
map("i", "<C-l>", "<Right>", { noremap = true, silent = true })

-- Command mode mappings
map("c", "<C-h>", "<Left>", { noremap = true, silent = false })
map("c", "<C-j>", "<Down>", { noremap = true, silent = false })
map("c", "<C-k>", "<Up>", { noremap = true, silent = false })
map("c", "<C-l>", "<Right>", { noremap = true, silent = false })

---switch buffers with TAB key
map("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>sr")

---=======================for easy typing--------------------------
map({ "i", "t", "c", "x" }, "<C-BS>", "<C-w>", { noremap = true, silent = false, desc = "delete word with ctrl+bcspc" })

map({ "n" }, "<C-S-s>", "<cmd>wa<cr>", { noremap = true, silent = true, desc = "save all" })

-----------copy and paste--------------
map("v", "<C-c>", '"+y', { silent = true, desc = "copy in visual mode" })
map("c", "<C-v>", "<C-r>+", { noremap = true, desc = "paste in command mode" })
map("n", "<C-S-v>", '"+P', { silent = true, desc = "paste in normal mode" })
map("v", "<C-S-v>", '"+P', { silent = true, desc = "paste in visual mode" })
map("i", "<C-v>", "<C-R>+", { silent = true, desc = "paste in insert mode" })

map("n", "<leader>lS", "<cmd>LspRestart<cr>", { desc = "Force lsp restart" })

map("n", "<leader>qo", "<cmd>source $MYVIMRC<cr>", { desc = "source nvim config" })
