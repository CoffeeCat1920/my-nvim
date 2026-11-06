local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save and quit
map("n", "<Leader>w", ":w<CR>", opts)
map("n", "<Leader>q", ":q<CR>", opts)

-- Buffer navigation
map("n", "<Leader>bn", ":bnext<CR>", opts)
map("n", "<Leader>bp", ":bprev<CR>", opts)

-- Move lines
map("n", "<A-J>", ":m .+1<CR>==", opts)
map("n", "<A-K>", ":m .-2<CR>==", opts)
map("v", "<A-J>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-K>", ":m '<-2<CR>gv=gv", opts)

-- Indent selection
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Splits
map("n", "<leader>sv", ":vsplit<CR>", opts)
map("n", "<leader>sh", ":split<CR>", opts)
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Join lines better
map("n", "J", "mzJ`z", opts)

-- Clipboard
map('v', '<Leader>y', '"+y', { desc = "Yank to system clipboard" })
map('n', '<Leader>y', '"+yy', { desc = "Yank line to system clipboard" })
map('n', '<Leader>p', '"+p', { desc = "Paste from system clipboard" })
map('v', '<Leader>p', '"+p', { desc = "Paste from system clipboard" })

-- Copy file path
map("n", "<leader>pa", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("path copied:", path)
end, { desc = "Copy full file path" })

-- Build and run
map("n", "<Leader>lv", ":make run<CR>", opts)
map("n", "<Leader>llv", ":make clean run<CR>", opts)

-- Plugins
--
-- File Manager
map("n", "<Leader>e", ":make clean run<CR>", opts)

map('n', '<leader>f', function()
  vim.lsp.buf.format({ bufnr = bufnr })
end, { buffer = bufnr, desc = 'Format buffer' })
