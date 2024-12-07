return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    dashboard = {
      enabled = true,
      preset = {
        header = [[
 ▄▄▄▄    ██▓▒███████▒▄▄▄█████▓ ▄▄▄      ▒██   ██▒
▓█████▄ ▓██▒▒ ▒ ▒ ▄▀░▓  ██▒ ▓▒▒████▄    ▒▒ █ █ ▒░
▒██▒ ▄██▒██▒░ ▒ ▄▀▒░ ▒ ▓██░ ▒░▒██  ▀█▄  ░░  █   ░
▒██░█▀  ░██░  ▄▀▒   ░░ ▓██▓ ░ ░██▄▄▄▄██  ░ █ █ ▒
░▓█  ▀█▓░██░▒███████▒  ▒██▒ ░  ▓█   ▓██▒▒██▒ ▒██▒
░▒▓███▀▒░▓  ░▒▒ ▓░▒░▒  ▒ ░░    ▒▒   ▓▒█░▒▒ ░ ░▓ ░
▒░▒   ░  ▒ ░░░▒ ▒ ░ ▒    ░      ▒   ▒▒ ░░░   ░▒ ░
 ░    ░  ▒ ░░ ░ ░ ░ ░  ░        ░   ▒    ░    ░
 ░       ░    ░ ░                   ░  ░ ░    ░
      ░     ░
                Powered By  eovim              ]],
      },
    },
    bigfile = { enabled = true },
    notifier = {
      enabled = true,
      style = "fancy",
      timeout = 500,
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = true },
    win = {
      enabled = true,
    },
  },
}
