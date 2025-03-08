return {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  config = function()
    require("copilot_cmp").setup()
  end,
  dependencies = {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      require("copilot").setup {
        suggestion = {
          auto_trigger = true,
          enabled = true,
          debounce = 1000,
          -- keymap = {
          --   accept = "<Tab>",
          --   dismiss = "<S-Tab>",
          --   next = "<C-]>",
          --   prev = "<C-[>",
          -- },
        },
        panel = {
          enabled = false,
          auto_refresh = false,
          layout = {
            position = "vertical",
            ratio = 0.3,
          },
        },
      }
    end,
  },
}
