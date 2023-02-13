return {

  -- Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "prettierd",
        "stylua",
        "selene",
        "luacheck",
        "eslint_d",
        "shellcheck",
        "shfmt",
        "black",
        "isort",
        "flake8",
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- language specific extension modules
  { import = "plugins.extras.lang.rust" },
}
