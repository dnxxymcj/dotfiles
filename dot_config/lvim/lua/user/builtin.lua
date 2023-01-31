local M = {}

M.config = function()

  local kind = require "user.lsp_kind"

  -- Lvim
  -- =========================================
  lvim.keys.term_mode["<C-h>"] = false
  lvim.keys.term_mode["<C-j>"] = false
  lvim.keys.term_mode["<C-k>"] = false
  lvim.keys.term_mode["<C-l>"] = false
  lvim.keys.normal_mode["<C-h>"] = false
  lvim.keys.normal_mode["<C-j>"] = false
  lvim.keys.normal_mode["<C-k>"] = false
  lvim.keys.normal_mode["<C-l>"] = false
  lvim.keys.normal_mode["<A-j>"] = false
  lvim.keys.normal_mode["<A-k>"] = false
  lvim.keys.insert_mode["<A-j>"] = false
  lvim.keys.insert_mode["<A-k>"] = false
  lvim.keys.visual_block_mode["<A-j>"] = false
  lvim.keys.visual_block_mode["<A-k>"] = false

  -- Lualine
  -- =========================================
  lvim.builtin.lualine.active = true
  lvim.builtin.lualine.sections.lualine_b = { "branch" }

  -- Mason
  -- =========================================
  lvim.builtin.mason.ui.icons = kind.mason

  -- Dashboard
  -- =========================================
  lvim.builtin.alpha.mode = "custom"
  local alpha_opts = require("user.dashboard").config()
  lvim.builtin.alpha["custom"] = { config = alpha_opts }

  -- Dap
  -- =========================================
  if lvim.builtin.dap.active then
    lvim.builtin.dap.on_config_done = function()
      lvim.builtin.which_key.mappings["d"].name = " Debug"
    end
  end

  -- Nvimtree
  -- =========================================
  lvim.builtin.nvimtree.setup.diagnostics = {
    enable = true,
    icons = {
      hint = kind.icons.hint,
      info = kind.icons.info,
      warning = kind.icons.warn,
      error = kind.icons.error,
    },
  }
  lvim.builtin.nvimtree.setup.view.mappings.list = {
    { key = "e", action = "" },
    { key = "l", action = "rename_basename" },
    { key = "<C-t>", action = "" },
    { key = "T", action = "tabnew" },
  }
  lvim.builtin.nvimtree.on_config_done = function(_)
    lvim.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeToggle<CR>", " Explorer" }
  end

  -- WhichKey
  -- =========================================
  lvim.builtin.which_key.setup.window.winblend = 10
  lvim.builtin.which_key.setup.window.border = "none"
  lvim.builtin.which_key.setup.plugins.presets.z = true
  lvim.builtin.which_key.setup.plugins.presets.g = true
  lvim.builtin.which_key.setup.plugins.presets.windows = true
  lvim.builtin.which_key.setup.plugins.presets.nav = true
  lvim.builtin.which_key.setup.plugins.registers = true
  lvim.builtin.which_key.setup.ignore_missing = true
  lvim.builtin.which_key.setup.icons = {
    breadcrumb = "/", -- symbol used in the command line area that shows your active key combo
    separator = "·", -- symbol used between a key and it's label
    group = "", -- symbol prepended to a group
  }

  -- Telescope
  -- =========================================
  lvim.builtin.telescope.defaults.file_ignore_patterns = {
    "vendor/*",
    "%.lock",
    "__pycache__/*",
    "%.sqlite3",
    "%.ipynb",
    "node_modules/*",
    "%.jpg",
    "%.jpeg",
    "%.png",
    "%.svg",
    "%.otf",
    "%.ttf",
    ".git/",
    "%.webp",
    ".dart_tool/",
    ".github/",
    ".gradle/",
    ".idea/",
    ".settings/",
    ".vscode/",
    "__pycache__/",
    "build/",
    "env/",
    "gradle/",
    "node_modules/",
    "target/",
    "%.pdb",
    "%.dll",
    "%.class",
    "%.exe",
    "%.cache",
    "%.ico",
    "%.pdf",
    "%.dylib",
    "%.jar",
    "%.docx",
    "%.met",
    "smalljre_*/*",
    ".vale/",
    "%.burp",
    "%.mp4",
    "%.mkv",
    "%.rar",
    "%.zip",
    "%.7z",
    "%.tar",
    "%.bz2",
    "%.epub",
    "%.flac",
    "%.tar.gz",
  }
  local _, actions = pcall(require, "telescope.actions")
  lvim.builtin.telescope.defaults.mappings = {
    -- for input mode
    i = {
      ["<C-s>"] = actions.cycle_history_next,
      ["<C-t>"] = actions.cycle_history_prev,
      ["<C-n>"] = actions.move_selection_next,
      ["<C-e>"] = actions.move_selection_previous,

      ["<C-b>"] = actions.results_scrolling_up,
      ["<C-f>"] = actions.results_scrolling_down,

      ["<C-c>"] = actions.close,
      ["<Down>"] = actions.move_selection_next,
      ["<Up>"] = actions.move_selection_previous,

      ["<CR>"] = actions.select_default,
      ["<C-h>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-j>"] = actions.select_tab,
      ["<c-d>"] = require("telescope.actions").delete_buffer,
      ["<esc>"] = actions.close,
      ["<Tab>"] = actions.close,
      ["<S-Tab>"] = actions.close,
      ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      ["<C-l>"] = actions.complete_tag,
      ["<C-/>"] = actions.which_key, -- keys from pressing <C-h>
    },
    -- for normal mode
    n = {
      ["<C-s>"] = actions.cycle_history_next,
      ["<C-t>"] = actions.cycle_history_prev,
      ["<C-n>"] = actions.move_selection_next,
      ["<C-e>"] = actions.move_selection_previous,

      ["<CR>"] = actions.select_default,
      ["<C-h>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-j>"] = actions.select_tab,
      ["<C-b>"] = actions.results_scrolling_up,
      ["<C-f>"] = actions.results_scrolling_down,

      ["<esc>"] = actions.close,
      ["<Tab>"] = actions.close,
      ["<S-Tab>"] = actions.close,
      ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

      ["s"] = actions.cycle_history_next,
      ["t"] = actions.cycle_history_prev,
      ["n"] = actions.move_selection_next,
      ["e"] = actions.move_selection_previous,
      ["M"] = actions.move_to_middle,
      ["q"] = actions.close,
      ["dd"] = require("telescope.actions").delete_buffer,
      ["<c-d>"] = require("telescope.actions").delete_buffer,
      ["h"] = actions.select_horizontal,
      ["v"] = actions.select_vertical,
      ["j"] = actions.select_tab,

      ["<Down>"] = actions.move_selection_next,
      ["<Up>"] = actions.move_selection_previous,
      ["gg"] = actions.move_to_top,
      ["G"] = actions.move_to_bottom,

      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,

      ["<PageUp>"] = actions.results_scrolling_up,
      ["<PageDown>"] = actions.results_scrolling_down,

      ["?"] = actions.which_key,
    },
  }

  -- Treesitter
  -- =========================================
  lvim.builtin.treesitter.context_commentstring.enable = true
  local languages = vim.tbl_flatten {
    { "bash", "c", "c_sharp", "cmake", "comment", "cpp", "css", "d", "dart" },
    { "dockerfile", "elixir", "elm", "erlang", "fennel", "fish", "go", "gomod" },
    { "gomod", "graphql", "hcl", "help", "html", "java", "javascript", "jsdoc" },
    { "json", "jsonc", "julia", "kotlin", "latex", "ledger", "lua", "make" },
    { "markdown", "nix", "ocaml", "perl", "php", "python", "query", "r" },
    { "regex", "rego", "ruby", "rust", "scala", "scss", "solidity", "swift" },
    { "teal", "toml", "tsx", "typescript", "vim", "vue", "yaml", "zig" },
  }
  lvim.builtin.treesitter.ensure_installed = languages
  lvim.builtin.treesitter.highlight.disable = { "org" }
  lvim.builtin.treesitter.highlight.aditional_vim_regex_highlighting = { "org" }
  lvim.builtin.treesitter.ignore_install = { "haskell", "norg" }
  lvim.builtin.treesitter.matchup.enable = true
  lvim.builtin.treesitter.autotag.enable = true
  lvim.builtin.treesitter.auto_install = true
  lvim.builtin.treesitter.query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  }
  lvim.builtin.treesitter.textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["aA"] = "@attribute.outer",
        ["iA"] = "@attribute.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
        ["at"] = "@class.outer",
        ["it"] = "@class.inner",
        ["a/"] = "@comment.outer",
        ["i/"] = "@comment.inner",
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
        ["aF"] = "@frame.outer",
        ["iF"] = "@frame.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["is"] = "@scopename.inner",
        ["as"] = "@statement.outer",
        ["av"] = "@variable.outer",
        ["iv"] = "@variable.inner",
      },
      move = {
        enable = true,
        set_jumps = false, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]]"] = "@function.outer",
        },
        goto_next_end = {
          ["]["] = "@function.outer",
        },
        goto_previous_start = {
          ["[["] = "@function.outer",
        },
        goto_previous_end = {
          ["[]"] = "@function.outer",
        },
      },
    },
  }

  -- LSP
  -- =========================================
  lvim.lsp.buffer_mappings.normal_mode['K'] = nil
  lvim.lsp.buffer_mappings.normal_mode["gk"] = {
    "<cmd>lua require('user.builtin').show_documentation()<CR>",
    "Show Documentation",
  }

  lvim.lsp.on_attach_callback = M.lsp_on_attach_callback

  M.show_documentation = function()
    local filetype = vim.bo.filetype
    if vim.tbl_contains({ "vim", "help" }, filetype) then
      vim.cmd("h " .. vim.fn.expand "<cword>")
    elseif vim.fn.expand "%:t" == "Cargo.toml" then
      require("crates").show_popup()
    elseif vim.tbl_contains({ "man" }, filetype) then
      vim.cmd("Man " .. vim.fn.expand "<cword>")
    elseif filetype == "rust" then
      local found, rt = pcall(require, "rust-tools")
      if found then
        rt.hover_actions.hover_actions()
      else
        vim.lsp.buf.hover()
      end
    else
      vim.lsp.buf.hover()
    end
  end

  M.lsp_on_attach_callback = function(client, _)
    local wkstatus_ok, which_key = pcall(require, "which-key")
    if not wkstatus_ok then
      return
    end
    local mappings = {}

    local opts = {
      mode = "n",
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = true,
    }
    -- local opts = { noremap = true, silent = true }
    if client.name == "clangd" then
      if lvim.builtin.cpp_programming.active then
        mappings["H"] = {
          "<Cmd>ClangdSwitchSourceHeader<CR>",
          "Swich Header/Source",
        }
        mappings["lg"] = { "<cmd>CMakeGenerate<CR>", "Generate CMake" }
        mappings["rm"] = { "<cmd>CMakeRun<CR>", "Run CMake" }
        mappings["mm"] = { "<cmd>CMakeBuild<CR>", "Build CMake" }
        mappings["dm"] = { "<cmd>CMakeDebug<CR>", "Debug CMake" }
        mappings["ms"] = { "<cmd>CMakeSelectBuildType<CR>", "Select Build Type" }
        mappings["mt"] = { "<cmd>CMakeSelectBuildTarget<CR>", "Select Build Target" }
        mappings["rt"] = { "<cmd>CMakeSelectLaunchTarget<CR>", "Select Launch Target" }
        mappings["lo"] = { "<cmd>CMakeOpen<CR>", "Open CMake Console" }
        mappings["lc"] = { "<cmd>CMakeClose<CR>", "Close CMake Console" }
        mappings["mi"] = { "cmd>CMakeInstall<cr>", "Install CMake Targets" }
        mappings["mc"] = { "<cmd>CMakeClean<CR>", "Clean CMake Targets" }
        mappings["rc"] = { "<cmd>CMakeStop<CR>", "Stop CMake" }
      end
    elseif client.name == "gopls" then
      mappings["H"] = {
        "<Cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='go vet .;read',count=2,direction='float'})<CR>",
        "Go Vet",
      }
      if lvim.builtin.go_programming.active then
        mappings["li"] = { "<cmd>GoInstallDeps<cr>", "Install Dependencies" }
        mappings["lT"] = { "<cmd>GoMod tidy<cr>", "Tidy" }
        mappings["lt"] = { "<cmd>GoTestAdd<cr>", "Add Test" }
        mappings["tA"] = { "<cmd>GoTestsAll<cr>", "Add All Tests" }
        mappings["le"] = { "<cmd>GoTestsExp<cr>", "Add Exported Tests" }
        mappings["lg"] = { "<cmd>GoGenerate<cr>", "Generate" }
        mappings["lF"] = { "<cmd>GoGenerate %<cr>", "Generate File" }
        mappings["lc"] = { "<cmd>GoCmt<cr>", "Comment" }
        mappings["dT"] = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" }
      end
    elseif client.name == "jdtls" then
      mappings["rf"] = {
        "<cmd>lua require('toggleterm.terminal').Terminal:new {cmd='mvn package;read', hidden =false}:toggle()<CR>",
        "Maven Package",
      }
      mappings["mf"] = {
        "<cmd>lua require('toggleterm.terminal').Terminal:new {cmd='mvn compile;read', hidden =false}:toggle()<CR>",
        "Maven Compile",
      }
    elseif client.name == "rust_analyzer" then
      mappings["H"] = {
        "<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='cargo clippy;read',count=2,direction='float'})<CR>",
        "Clippy",
      }
      if lvim.builtin.rust_programming.active then
        mappings["lA"] = { "<Cmd>RustHoverActions<CR>", "Hover Actions" }
        mappings["lm"] = { "<Cmd>RustExpandMacro<CR>", "Expand Macro" }
        mappings["lH"] = { "<Cmd>RustToggleInlayHints<CR>", "Toggle Inlay Hints" }
        mappings["le"] = { "<Cmd>RustRunnables<CR>", "Runnables" }
        mappings["lD"] = { "<cmd>RustDebuggables<Cr>", "Debuggables" }
        mappings["lP"] = { "<cmd>RustParentModule<Cr>", "Parent Module" }
        mappings["lv"] = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" }
        mappings["lR"] = {
          "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
          "Reload Workspace",
        }
        mappings["lc"] = { "<Cmd>RustOpenCargo<CR>", "Open Cargo" }
        mappings["lo"] = { "<Cmd>RustOpenExternalDocs<CR>", "Open External Docs" }
      end
    elseif client.name == "taplo" then
      if lvim.builtin.rust_programming.active then
        mappings["lt"] = { "<Cmd>lua require('crates').toggle()<CR>", "Toggle Crate" }
        mappings["lu"] = { "<Cmd>lua require('crates').update_crate()<CR>", "Update Crate" }
        mappings["lU"] = { "<Cmd>lua require('crates').upgrade_crate()<CR>", "Upgrade Crate" }
        mappings["lg"] = { "<Cmd>lua require('crates').update_all_crates()<CR>", "Update All" }
        mappings["lG"] = { "<Cmd>lua require('crates').upgrade_all_crates()<CR>", "Upgrade All" }
        mappings["lH"] = { "<Cmd>lua require('crates').open_homepage()<CR>", "Open HomePage" }
        mappings["lD"] = { "<Cmd>lua require('crates').open_documentation()<CR>", "Open Documentation" }
        mappings["lR"] = { "<Cmd>lua require('crates').open_repository()<CR>", "Open Repository" }
        mappings["lv"] = { "<Cmd>lua require('crates').show_versions_popup()<CR>", "Show Versions" }
        mappings["lF"] = { "<Cmd>lua require('crates').show_features_popup()<CR>", "Show Features" }
        mappings["lD"] = { "<Cmd>lua require('crates').show_dependencies_popup()<CR>", "Show Dependencies" }
      end
    elseif client.name == "tsserver" then
      mappings["lA"] = { "<Cmd>TSLspImportAll<CR>", "Import All" }
      mappings["lR"] = { "<Cmd>TSLspRenameFile<CR>", "Rename File" }
      mappings["lO"] = { "<Cmd>TSLspOrganize<CR>", "Organize Imports" }
      mappings["li"] = { "<cmd>TypescriptAddMissingImports<Cr>", "AddMissingImports" }
      mappings["lo"] = { "<cmd>TypescriptOrganizeImports<cr>", "OrganizeImports" }
      mappings["lu"] = { "<cmd>TypescriptRemoveUnused<Cr>", "RemoveUnused" }
      mappings["lF"] = { "<cmd>TypescriptFixAll<Cr>", "FixAll" }
      mappings["lg"] = { "<cmd>TypescriptGoToSourceDefinition<Cr>", "GoToSourceDefinition" }
    elseif client.name == "pyright" then
      if lvim.builtin.python_programming.active then
        mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
        mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
        mappings["dS"] = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" }
        mappings["P"] = {
          name = "Python",
          i = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Pick Env" },
          d = { "<cmd>lua require('swenv.api').get_current_venv()<cr>", "Show Env" },
        }
      end
    elseif client.name == "jsonls" then
      if lvim.builtin.web_programming.active then
        mappings["ls"] = { "<cmd>lua require('package-info').show()<cr>", "Show pkg info" }
        mappings["lc"] = { "<cmd>lua require('package-info').hide()<cr>", "Hide pkg info" }
        mappings["lu"] = { "<cmd>lua require('package-info').update()<cr>", "Update dependency" }
        mappings["ld"] = { "<cmd>lua require('package-info').delete()<cr>", "Delete dependency" }
        mappings["li"] = { "<cmd>lua require('package-info').install()<cr>", "Install dependency" }
        mappings["lC"] = { "<cmd>lua require('package-info').change_version()<cr>", "Change Version" }
      end
    end
    which_key.register(mappings, opts)
  end

end

return M
