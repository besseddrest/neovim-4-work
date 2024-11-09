return {
  "echasnovski/mini.indentscope",
  version = false,
  event = "User FilePost",
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "alpha",
        "dashboard-nvim",
        "fzf",
        "help",
        "lazy",
        "lazyterm",
        "mason",
        "nvimtree",
        "notify",
        "toggleterm",
        "Trouble",
        "trouble",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
  config = function()
    require("mini.indentscope").setup {
      draw = {
        delay = 100,
        priority = 2,
        animation = function(s, n)
          return s / n * 20
        end,
      }, -- options = {
      --   try_as_border = true,
      -- },
      symbol = "│",
    }
  end,
}
