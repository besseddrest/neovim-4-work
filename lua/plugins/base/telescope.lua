return {
	{

		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		cmd = "Telescope",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
		},
		opts = {
			defaults = {
				prompt_prefix = "   ",
				selection_caret = " ",
				entry_prefix = " ",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						preview_width = 0.35,
					},
					width = 0.9,
					height = 0.50,
				},
				sorting_strategy = "descending",
			},
			extensions_list = { "themes", "terms", "live_grep_args" },
			extensions = {},
			hl_styles = {
				floats = "transparent",
			},
			pickers = {
				cache_picker = {
					num_pickers = 3,
					limit_pickers = 50,
					ignore_empty_prompt = true,
				},
				projects = {
					num_pickers = 3,
				},
				buffers = {
					previewer = false,
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			-- load extensions
			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("flutter")
		end,
	},
}
