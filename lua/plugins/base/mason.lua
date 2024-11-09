return {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      border = "rounded",
    },
    ensure_installed = {
      "lua_ls",
      "html",
      "cssls",
      "marksman",
      "somesass_ls",
      "eslint",
      "jsonls",
      "sqlls",
      "ts_ls",
      "bashls",
    },
  },
}
