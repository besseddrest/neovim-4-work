return {
  "folke/noice.nvim",
  event = "UIEnter",
  opts = {
    presets = { inc_rename = true },
  },
  config = function()
    require("noice").setup {
      -- add any options here
      lsp = {
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
              { find = "%d fewer lines" },
              { find = "%d more lines" },
            },
          },
          opts = { skip = true },
        },
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
      },
    }
  end,
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- "folke/snacks.nvim",
  },
}
