return {
  "stevearc/conform.nvim",
  event = "BufWritePre", -- uncomment for format on save
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier", "eslint_d" },
        javascriptreact = { "prettier", "eslint_d" },
        json = { "jsonlint" },
        lua = { "stylua" },
        markdown = { "mdformat" },
        mysql = { "sqlfluff" },
        scss = { "prettier" },
        typescript = { "prettier", "eslint_d" },
        typescriptreact = { "prettier", "eslint_d" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        lsp_fallback = true,
      },
    }
  end,
}
