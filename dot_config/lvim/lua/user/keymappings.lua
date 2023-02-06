local M = {}

M.set_colemak_keymaps = function()

  local map = vim.keymap.set

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
  map("", "h", "s", { noremap = true, silent = true })
  map("", "H", "S", { noremap = true, silent = true })
  map("", "j", "t", { noremap = true, silent = true })
  map("", "J", "T", { noremap = true, silent = true })
  map("", "k", "n", { noremap = true, silent = true })
  map("", "K", "N", { noremap = true, silent = true })

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

  map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
  map("", ";", ":", { noremap = true })
  map("v", "p", '"_dp', { noremap = true, silent = true })
  map("v", "P", '"_dP', { noremap = true, silent = true })
  map({ "o", "v", "c", "i" }, "uy", "<ESC>", { noremap = true, silent = true })
  map({ "o", "v", "c", "i" }, "UY", "<ESC>", { noremap = true, silent = true })
  map("n", "<CR>", ":noh<CR><CR>:<backspace>", { noremap = true, silent = true })
  map("n", "U", "<C-r>", { noremap = true, silent = true })

  map("n", "<Up>", ":resize -2<CR>", { noremap = true, silent = true })
  map("n", "<Down>", ":resize +2<CR>", { noremap = true, silent = true })
  map("n", "<Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
  map("n", "<Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

end

M.set_leap_keymaps = function()
  vim.keymap.set("", "h", "<Plug>(leap-forward-to)", { noremap = true, silent = true })
  vim.keymap.set("", "H", "<Plug>(leap-backward-to)", { noremap = true, silent = true })
end

M.set_harpoon_keymaps = function()

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "m",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    a = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
    c = { "<cmd>silent BookmarkClear<cr>", "Clear" },
    m = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
    n = { "<cmd>silent BookmarkNext<cr>", "Next" },
    e = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
    x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
    S = { "<cmd>silent BookmarkShowAll<cr>", "Prev" },
    s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
    h = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
    ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
    [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
    [";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
  }
  which_key.register(mappings, opts)

end

M.set_bufferline_keymaps = function()

  vim.keymap.set("n", "]b", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "[b", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
  lvim.builtin.which_key.mappings.c = { "<cmd>BufferKill<CR>", " Close Buf" }
  lvim.builtin.which_key.mappings.b = {
    name = "﩯Buffer",
    ["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "goto 1" },
    ["2"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "goto 2" },
    ["3"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "goto 3" },
    ["4"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "goto 4" },
    ["5"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "goto 5" },
    ["6"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "goto 6" },
    ["7"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "goto 7" },
    ["8"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "goto 8" },
    ["9"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "goto 9" },
    c = { "<Cmd>BufferLinePickClose<CR>", "delete buffer" },
    p = { "<Cmd>BufferLineTogglePin<CR>", "toggle pin" },
    s = { "<Cmd>BufferLinePick<CR>", "pick buffer" },
    t = { "<Cmd>BufferLineGroupToggle docs<CR>", "toggle groups" },
    f = { "<cmd>Telescope buffers<cr>", "Find" },
    b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
    o = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    O = {
      "<cmd>BufferLineCloseRight<cr>",
      "Close all to the right",
    },
    D = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "Sort by directory",
    },
    L = {
      "<cmd>BufferLineSortByExtension<cr>",
      "Sort by language",
    },
  }
end

M.set_whichkey_keymaps = function()

  local status_ok_comment, cmt = pcall(require, "Comment.api")
  if status_ok_comment and cmt["toggle"] ~= nil then
    lvim.builtin.which_key.mappings["/"] = {
      "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
      " Comment",
    }
    lvim.builtin.which_key.vmappings["/"] = {
      "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      " Comment",
    }
  else
    lvim.builtin.which_key.mappings["/"] = { "<Plug>(comment_toggle_linewise_current)", " Comment" }
    lvim.builtin.which_key.vmappings["/"] = { "<Plug>(comment_toggle_linewise_visual)", " Comment" }
  end

  lvim.builtin.which_key.mappings[";"] = { "<cmd>Alpha<CR>", "舘Dashboard" }
  lvim.builtin.which_key.mappings.h = {}
  lvim.builtin.which_key.mappings.w = { "<cmd>w!<CR>", " Save" }
  lvim.builtin.which_key.mappings.z = { "<cmd>ZenMode<cr>", " Zen" }
  lvim.builtin.which_key.mappings.L.name = " LunarVim"
  lvim.builtin.which_key.mappings.p.name = " Lazy"
  lvim.builtin.which_key.mappings.s.name = " Search"
  lvim.builtin.which_key.mappings.l.name = " LSP"

  if lvim.builtin.tree_provider == "neo-tree" then
    lvim.builtin.which_key.mappings["e"] = { "<cmd>Neotree toggle<CR>", " Explorer" }
  end

  if lvim.builtin.tag_provider == "symbols-outline" then
    lvim.builtin.which_key.mappings.o = { "<cmd>SymbolsOutline<cr>", " Symbol Outline" }
  elseif lvim.builtin.tag_provider == "vista" then
    lvim.builtin.which_key.mappings.o = { "<cmd>Vista!!<cr>", " Vista" }
  end

  lvim.builtin.which_key.mappings.q = { "<cmd>confirm q<CR>", " Quit" }
  lvim.builtin.which_key.mappings.f = {
    name = " Find",
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    s = { "<cmd>Telescope grep_string<cr>", "Find String" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    H = { "<cmd>Telescope highlights<cr>", "Highlights" },
    l = { "<cmd>Telescope resume<cr>", "Last Search" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  }

  lvim.builtin.which_key.mappings.T = {
    name = "飯Trouble",
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnosticss" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    t = { "<cmd>TodoLocList <cr>", "Todo" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Diagnosticss" },
  }

  lvim.builtin.which_key.mappings.R = {
    name = " Replace",
    f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Current Buffer" },
    p = { "<cmd>lua require('spectre').open()<cr>", "Project" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
    s = {
      function()
        require("ssr").open()
      end,
      "Structural replace",
    },
  }

  lvim.builtin.which_key.mappings.l = {
    name = " LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    f = { require("lvim.lsp.utils").format, "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    n = {
      vim.diagnostic.goto_next,
      "Next Diagnostic",
    },
    e = {
      vim.diagnostic.goto_prev,
      "Prev Diagnostic",
    },
    l = { vim.lsp.codelens.run, "CodeLens Action" },
    q = { vim.diagnostic.setloclist, "Quickfix" },
    r = { vim.lsp.buf.rename, "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    u = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  }

  lvim.builtin.which_key.mappings.g = {
    name = " Git",
    g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
    n = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
    e = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Git Diff",
    },
  }
end

M.config = function()

  -- Colemak-dh
  -- =========================================
  M.set_colemak_keymaps()

  -- Leap
  -- =========================================
  M.set_leap_keymaps()

  -- Harpoon
  -- =========================================
  if lvim.builtin.harpoon.active then
    M.set_harpoon_keymaps()
  end

  -- Bufferline
  -- =========================================
  M.set_bufferline_keymaps()

  -- WhichKey
  -- =========================================
  M.set_whichkey_keymaps()

end

return M
