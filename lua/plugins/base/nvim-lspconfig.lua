return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			require("lspconfig").lua_ls.setup({})
			require("lspconfig").ts_ls.setup({})
			require("lspconfig").cssls.setup({})
			require("lspconfig").html.setup({})
			require("lspconfig").jsonls.setup({})
			require("lspconfig").markdown_oxide.setup({})
			require("lspconfig").qmlls.setup({
				cmd = { "qmlls", "-E" },
			})
			-- vim.list_contains();
		end,
	},
}
