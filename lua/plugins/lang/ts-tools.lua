local on_attach = require("nvchad.configs.lspconfig").on_attach

return {
  "pmizio/typescript-tools.nvim",
  ft = {
    -- "html",
    "javascriptreact",
    "javascript",
    "jsx",
    "typescriptreact",
    "typescript",
    "tsx",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    on_attach = on_attach,
    settings = {
      expose_as_code_action = "all",
      tsserver_file_preferences = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeCompletionsForModuleExports = true,
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
      tsserver_plugins = {
        "@styled/typescript-styled-plugin",
      },
      jsx_close_tag = {
        enable = true,
        filetypes = { "javascriptreact", "typescriptreact" },
      },
    },
  },
}
