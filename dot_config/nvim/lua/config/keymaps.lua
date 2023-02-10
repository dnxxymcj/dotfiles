-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- Unset LazyVim's default bindings
del("n", "<leader>ft")
del("n", "<leader>fT")
del("t", "<esc><esc>")

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

map({ "c", "i" }, "jk", "<ESC>", { noremap = true, silent = true })
map({ "c", "i" }, "jj", "<ESC>", { noremap = true, silent = true })
map({ "c", "i" }, "kj", "<ESC>", { noremap = true, silent = true })
map({ "c", "i" }, "JK", "<ESC>", { noremap = true, silent = true })
map({ "c", "i" }, "JJ", "<ESC>", { noremap = true, silent = true })
map({ "c", "i" }, "KJ", "<ESC>", { noremap = true, silent = true })
map("n", "<CR>", ":noh<CR><CR>:<backspace>", { noremap = true, silent = true })
map("n", "U", "<C-r>", { noremap = true, silent = true })
map("", ";", ":", { noremap = true })

map("", "<Up>", ":resize -2<CR>", { noremap = true, silent = true })
map("", "<Down>", ":resize +2<CR>", { noremap = true, silent = true })
map("", "<Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
map("", "<Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
