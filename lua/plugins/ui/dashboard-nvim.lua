local function move_right()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>l", true, true, true), "n", true)
end

return {
  "nvimdev/dashboard-nvim",
  event = "UIEnter",
  cmds = { "Dashboard" },
  config = function()
    require("dashboard").setup {
      theme = "hyper",
      disable_move = true,
      shortcut_type = "number",
      config = {
        header = {
          [[                                                     ]],
          [[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
          [[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
          [[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
          [[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
          [[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
          [[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
          [[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
          [[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
          [[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
          [[                                 ░                   ]],
          [[                                                     ]],
          [[                   (for work, btw)                   ]],
          [[                                                     ]],
          -- [[                                                                       ]],
          -- [[                                                                     ]],
          -- [[       ████ ██████           █████      ██                     ]],
          -- [[      ███████████             █████                             ]],
          -- [[      █████████ ███████████████████ ███   ███████████   ]],
          -- [[     █████████  ███    █████████████ █████ ██████████████   ]],
          -- [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
          -- [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
          -- [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
          -- [[                                                                       ]],
          -- [[                                   (btw)                               ]],
          -- [[                                                                       ]],
        },
        week_header = {
          enable = false,
          -- append = {
          --   "",
          --   "Reminder:",
          --   "I use Neovim (btw)",
          -- },
        },
        shortcut = {
          {
            desc = "New File ",
            key = "n",
            action = "enew | NvimTreeOpen",
          },
          { desc = "Find Files ", key = "f", action = "Telescope find_files cwd=" },
          -- {
          --   desc = "DBUI ",
          --   key = "d",
          --   action = "enew | DBUI",
          -- },
        },
        mru = { limit = 5, cwd_only = true },
        project = {
          enable = false,
          limit = 4,
        },
        footer = {
          " ",
          "You suck.",
          "Be better for Quintin and Shoshanna",
        },
      },
      change_to_vcs_root = true,
    }
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
