-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- Unset LazyVim's default bindings
del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")
del("n", "<A-j>")
del("v", "<A-j>")
del("i", "<A-j>")
del("n", "<A-k>")
del("v", "<A-k>")
del("i", "<A-k>")

map("", "s", "h", { noremap = true, silent = true })
map("", "t", "l", { noremap = true, silent = true })
map("", "n", "v:count == 0 ? 'gj' : 'j'", { expr = true, noremap = true, silent = true })
map("", "e", "v:count == 0 ? 'gk' : 'k'", { expr = true, noremap = true, silent = true })

map("", "S", "^", { noremap = true, silent = true })
map("", "T", "$", { noremap = true, silent = true })
map("n", "N", ":m .+1<CR>==", { noremap = true, silent = true })
map("n", "E", ":m .-2<CR>==", { noremap = true, silent = true })
map("v", "N", ":m '>+1<CR>gv-gv", { noremap = true, silent = true })
map("v", "E", ":m '<-2<CR>gv-gv", { noremap = true, silent = true })

map("", "l", "e", { noremap = true, silent = true })
map("", "L", "E", { noremap = true, silent = true })
-- map("", "j", "t", { noremap = true, silent = true })
-- map("", "J", "T", { noremap = true, silent = true })
map("", "k", "n", { noremap = true, silent = true })
map("", "K", "N", { noremap = true, silent = true })

-- leap
map({ "x", "o" }, "h", "<Plug>(leap-forward-till)", { noremap = true, silent = true })
map({ "x", "o" }, "H", "<Plug>(leap-backward-till)", { noremap = true, silent = true })
map("n", "h", "<Plug>(leap-forward-to)", { noremap = true, silent = true })
map("n", "H", "<Plug>(leap-backward-to)", { noremap = true, silent = true })

map("", "gl", "ge", { noremap = true, silent = true })
map("", "gL", "gE", { noremap = true, silent = true })

map("", "<A-s>", "<C-w>h", { noremap = true, silent = true })
map("", "<A-t>", "<C-w>l", { noremap = true, silent = true })
map("", "<A-n>", "<C-w>j", { noremap = true, silent = true })
map("", "<A-e>", "<C-w>k", { noremap = true, silent = true })

map({ "c", "i" }, "<C-b>", "<LEFT>", { noremap = true })
map({ "c", "i" }, "<C-f>", "<RIGHT>", { noremap = true })
map({ "c", "i" }, "<C-a>", "<Home>", { noremap = true })
map({ "c", "i" }, "<C-e>", "<End>", { noremap = true })
map("i", "<C-p>", "<Up>", { noremap = true })
map("i", "<C-n>", "<Down>", { noremap = true })

map("", "[<space>", ":<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[", { noremap = true, silent = true })
map("", "]<space>", ":<c-u>put =repeat(nr2char(10), v:count1)<cr>", { noremap = true, silent = true })

map("", ";", ":", { noremap = true })
map({ "o", "v", "c", "i" }, "uy", "<ESC>", { noremap = true, silent = true })
map({ "o", "v", "c", "i" }, "UY", "<ESC>", { noremap = true, silent = true })
map("n", "<CR>", ":noh<CR><CR>:<backspace>", { noremap = true, silent = true })
map("n", "U", "<C-r>", { noremap = true, silent = true })

map("n", "<Up>", ":resize -2<CR>", { noremap = true, silent = true })
map("n", "<Down>", ":resize +2<CR>", { noremap = true, silent = true })
map("n", "<Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
map("n", "<Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
