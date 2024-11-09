return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeOpen" },
  opts = function()
    local chad = require "nvchad.configs.nvimtree"
    chad.view.relativenumber = true
    -- chad.view.width = 30
    chad.view.adaptive_size = true
    chad.view.centralize_selection = true
    chad.view.float = {
      enable = true,
      open_win_config = {
        height = 100,
      },
    }
    chad.filters.dotfiles = false
    chad.filters.git_ignored = false
    chad.filters.custom = { "node_modules" }
    chad.actions = {
      open_file = {
        quit_on_open = true,
      },
    }
    return chad
  end,

  config = function(_, opts)
    dofile(vim.g.base46_cache .. "nvimtree")
    require("nvim-tree").setup(opts)
  end,
}
