return {
	"stevearc/conform.nvim",
	event = "BufWritePre", -- uncomment for format on save
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier", "eslint_d" },
				javascriptreact = { "prettier", "eslint_d" },
				json = { "jsonlint" },
				lua = { "stylua" },
				mysql = { "sqlfluff" },
				scss = { "prettier" },
				typescript = { "prettier", "eslint_d" },
				typescriptreact = { "prettier", "eslint_d" },
			},
			format_on_save = function(bufnr)
				if vim.bo[bufnr].filetype == "markdown" then
					return nil
				end
				return { lsp_fallback = true }
			end,
			formatters = {
				prettier = {
					prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
				},
			},
		})
	end,
}
