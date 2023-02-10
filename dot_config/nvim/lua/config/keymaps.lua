-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- Unset LazyVim's default bindings
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")
del("n", "<A-j>")
del("v", "<A-j>")
del("i", "<A-j>")
del("n", "<A-k>")
del("v", "<A-k>")
del("i", "<A-k>")
del("n", "<leader>ft")
del("n", "<leader>fT")
del("t", "<esc><esc>")

map({ "n", "v" }, "s", "h", { noremap = true, silent = true })
map({ "n", "v" }, "t", "l", { noremap = true, silent = true })
map({ "n", "v" }, "n", "v:count == 0 ? 'gj' : 'j'", { expr = true, noremap = true, silent = true })
map({ "n", "v" }, "e", "v:count == 0 ? 'gk' : 'k'", { expr = true, noremap = true, silent = true })

map({ "n", "v" }, "S", "^", { noremap = true, silent = true })
map({ "n", "v" }, "T", "$", { noremap = true, silent = true })
map("n", "N", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move down" })
map("n", "E", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move up" })
map("v", "N", ":m '>+1<CR>gv-gv", { noremap = true, silent = true, desc = "Move down" })
map("v", "E", ":m '<-2<CR>gv-gv", { noremap = true, silent = true, desc = "Move up" })

-- map("", "k", "e", { noremap = true, silent = true })
-- map("", "K", "E", { noremap = true, silent = true })
-- map("", "l", "n", { noremap = true, silent = true })
-- map("", "L", "N", { noremap = true, silent = true })
-- map("", "j", "t", { noremap = true, silent = true })
-- map("", "J", "T", { noremap = true, silent = true })
-- map("", "h", "s", { noremap = true, silent = true })
-- map("", "H", "S", { noremap = true, silent = true })

map("n", "l", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("v", "l", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "L", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("v", "L", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- NOTE: leap
map({ "x", "o" }, "h", "<Plug>(leap-forward-till)", { noremap = true, silent = true })
map({ "x", "o" }, "H", "<Plug>(leap-backward-till)", { noremap = true, silent = true })
map("n", "h", "<Plug>(leap-forward-to)", { noremap = true, silent = true })
map("n", "H", "<Plug>(leap-backward-to)", { noremap = true, silent = true })

map("", "<leader>ws", "<C-w>h", { noremap = true, silent = true, desc = "Go to left window" })
map("", "<leader>wn", "<C-w>j", { noremap = true, silent = true, desc = "Go to lower window" })
map("", "<leader>we", "<C-w>k", { noremap = true, silent = true, desc = "Go to upper window" })
map("", "<leader>wt", "<C-w>l", { noremap = true, silent = true, desc = "Go to right window" })

map({ "c", "i" }, "<C-b>", "<LEFT>", { noremap = true })
map({ "c", "i" }, "<C-f>", "<RIGHT>", { noremap = true })
map({ "c", "i" }, "<C-a>", "<Home>", { noremap = true })
map({ "c", "i" }, "<C-e>", "<End>", { noremap = true })
map("i", "<C-p>", "<Up>", { noremap = true })
map("i", "<C-n>", "<Down>", { noremap = true })

map(
  "",
  "[<space>",
  ":<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[",
  { noremap = true, silent = true, desc = "Add line above" }
)
map(
  "",
  "]<space>",
  ":<c-u>put =repeat(nr2char(10), v:count1)<cr>",
  { noremap = true, silent = true, desc = "Add line below" }
)

map("", ";", ":", { noremap = true })
map({ "o", "v", "c", "i" }, "uy", "<ESC>", { noremap = true, silent = true })
map({ "o", "v", "c", "i" }, "UY", "<ESC>", { noremap = true, silent = true })
map("n", "<CR>", ":noh<CR><CR>:<backspace>", { noremap = true, silent = true })
map("n", "U", "<C-r>", { noremap = true, silent = true })

map("", "<Up>", ":resize -2<CR>", { noremap = true, silent = true })
map("", "<Down>", ":resize +2<CR>", { noremap = true, silent = true })
map("", "<Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
map("", "<Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
