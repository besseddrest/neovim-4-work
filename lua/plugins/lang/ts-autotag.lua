return {
  "windwp/nvim-ts-autotag",
  -- https://github.com/windwp/nvim-ts-autotag?tab=readme-ov-file#a-note-on-lazy-loading
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    ---@diagnostic disable-next-line
    require("nvim-ts-autotag").setup {
      autotag = {
        enable = true,
      },
      filetypes = {
        "html",
        "javascript",
        "javascriptreact",
        "tsx",
        "typescript",
        "typescriptreact",
      },
    }
  end,
}
