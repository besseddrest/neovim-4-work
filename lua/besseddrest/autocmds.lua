local augroup = vim.api.nvim_create_augroup
local utils = require("besseddrest.utils")
local buf_map = utils.buf_map

-- Neovim 0.11 lsp autocomplete, etc
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })

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
vim.api.nvim_create_autocmd("BufLeave", {
	desc = "Prevent <C-h>|<C-w>h from switching specific FileType.",
	pattern = {
		"NvimTree",
	},
	group = augroup("PreventFileTypeSwap", { clear = true }),
	callback = function(event)
		local lhs_list = { "<C-h>", "<C-w>l" }
		buf_map(event.filetype, "n", lhs_list, "<nop>")
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	-- pattern = "rosepine",
	-- group = ...,
	callback = function()
		vim.api.nvim_set_hl(0, "CopilotSuggestion", {
			fg = "skyblue",
			ctermfg = 8,
			force = true,
		})
	end,
})
-- autocmds from gale
vim.api.nvim_create_autocmd("Filetype", {
	desc = "Prevent <Tab>/<S-Tab> from switching specific buffers.",
	pattern = {
		"codecompanion",
		"lazy",
		"qf",
		"dbout",
		"dbui",
		"help",
	},
	group = augroup("PreventBufferSwap", { clear = true }),
	callback = function(event)
		local lhs_list = { "<Tab>", "<S-Tab>" }
		buf_map(event.buf, "n", lhs_list, "<nop>")
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
	desc = "Prevent auto-comment on new line.",
	pattern = "*",
	group = augroup("NoNewLineComment", { clear = true }),
	command = [[
    setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  ]],
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yank.",
	group = augroup("HighlightOnYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "YankVisual", timeout = 200, on_visual = true })
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Remove trailing whitespaces on save.",
	group = augroup("TrimWhitespaceOnSave", { clear = true }),
	command = [[ %s/\s\+$//e ]],
})
-- end from gale

-- NvimTree
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   desc = "Add numbers to NvimTree",
--   -- group = augroup("NvimTree", { clear = true }),
--   command = [[ setlocal rnu ]],
-- })

-- Dadbod
-- vim.api.nvim_create_autocmd("FileType", {
--   desc = "Automatically unfold query results",
--   pattern = { "dbout" },
--   callback = function()
--     vim.opt.foldenable = false
--   end,
-- })
