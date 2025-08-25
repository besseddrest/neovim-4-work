return {
	{
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
			{
				"mason-org/mason-lspconfig.nvim",
				opts = {},
				dependencies = {
					{ "mason-org/mason.nvim", opts = {} },
					"neovim/nvim-lspconfig",
				},
			},
		},
		config = function()
			local augroup = vim.api.nvim_create_augroup
			local utils = require("utils")
			local buf_map = utils.buf_map
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
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end
					---@diagnostic disable-next-line: missing-parameter
					if client:supports_method("textDocument/formatting") then
						-- Format the damn thing on save
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
							end,
						})
					end
					if client:supports_method("textDocument/completion") then
						vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
						vim.cmd("highlight @comment gui=italic cterm=italic")
					end
				end,
			})

			-- not autocmd but find a place for this later
			vim.diagnostic.config({
				-- virtual_text = true,
				-- float = true,
			})

			-- besseddrest autocmds (kinda)
			-- vim.api.nvim_create_autocmd("BufLeave", {
			-- 	desc = "Prevent <C-h>|<C-w>h from switching specific FileType.",
			-- 	pattern = {
			-- 		"NvimTree",
			-- 	},
			-- 	group = augroup("PreventFileTypeSwap", { clear = true }),
			-- 	callback = function(event)
			-- 		local lhs_list = { "<C-h>", "<C-w>l" }
			-- 		buf_map(event.buf, "n", lhs_list, "<nop>")
			-- 	end,
			-- })

			-- vim.list_contains();
		end,
	},
}
