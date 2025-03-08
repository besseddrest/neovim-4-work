return {
  "echasnovski/mini.files",
  version = false,
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("mini.files").setup()
  end,
  dependencies = { "echasnovski/mini.icons" },
}
