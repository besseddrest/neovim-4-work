return {
  "echasnovski/mini.animate",
  version = false,
  event = "VeryLazy",
  config = function()
    local animate = require "mini.animate"
    require("mini.animate").setup {
      cursor = {
        enable = true,
      },
      scroll = {
        timing = animate.gen_timing.linear { duration = 100, unit = "total" },
      },
      open = {
        enable = false,
      },
      close = {
        enable = false,
      },
    }
  end,
}
