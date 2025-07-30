return {
	{
		"NvChad/base46",
		branch = "v2.5",
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	{
		"NvChad/ui",
		branch = "v3.0",
		lazy = false,
		config = function()
			require("nvchad")
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			return { override = require("nvchad.icons.devicons") }
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "devicons")
			require("nvim-web-devicons").setup(opts)
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "User FilePost",
		opts = {
			indent = { char = "│", highlight = "IblChar" },
			scope = { char = "│", highlight = "IblScopeChar" },
		},
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "blankline")

			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
			require("ibl").setup(opts)

			dofile(vim.g.base46_cache .. "blankline")
		end,
	},

	-- file managing , picker etc
	{ import = "plugins.util.tree" },
	{ import = "plugins.util.which-key" },
	{ import = "plugins.lang.conform" },

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

	{ import = "plugins.base.mason" },

	{ import = "plugins.base.nvim-lspconfig" },

	-- { import = "plugins.base.cmp" },

	{ import = "plugins.base.telescope" },

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

	{ import = "plugins.base.treesitter" },
}
