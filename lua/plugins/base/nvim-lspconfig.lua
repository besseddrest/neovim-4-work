return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- "saghen/blink.cmp",
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
		-- local  = require("blink.cmp").get_lsp_capabilities()
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
}
