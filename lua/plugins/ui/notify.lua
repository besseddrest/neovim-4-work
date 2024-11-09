return {
  "rcarriga/nvim-notify",
  opts = {},
  on_open = function(win)
    vim.api.nvim_win_set_option(win, "winblend", 30)
    vim.api.nvim_win_set_option(win, { zindex = 100 })
  end,
  config = function()
    require("notify").setup {
      background_colour = "#000000",
      timeout = 3000,
      max_width = 50,
      min_width = 50,
      stages = "fade_in_slide_out",
    }
    vim.notify = require "notify"
  end,
}
