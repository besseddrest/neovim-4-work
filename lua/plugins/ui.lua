return {
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      local chad = require("nvchad.configs.gitsigns")
      chad.current_line_blame = true
      chad.current_line_blame_opts = {
        delay = 500,
      }
      return chad
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
  -- this is handled by org's prettier/eslint
  -- { import = "plugins.lang.conform" },
  { import = "plugins.base.mason" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },
  { import = "nvchad.blink.lazyspec" },
  {
    "NvChad/nvim-colorizer.lua",
    event = "User FilePost",
    opts = { user_default_options = { names = false } },
    config = function(_, opts)
      require("colorizer").setup(opts)

      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },
}
