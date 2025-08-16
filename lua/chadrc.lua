-- This file needs to have same structure as nvconfig.luagitsign
-- https://github-.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

local custom = {
	grey = { "grey", 5 },
	lightgrey = { "grey", 10 },
}

M.nvdash = {
	load_on_startup = false,
}

M.base46 = {
	theme = "rosepine",
	transparency = true,
	telescope = { style = "bordered" },

	hl_override = {
		StatusLine = { bg = { "black", 0 } },
		NvDashAscii = { fg = { "yellow", -10 } },
		TelescopeSelection = { bg = { "purple", -30 } },
		-- NvDashButtons = { fg = { "blue", -5 } },
		-- Comment = { italic = true, fg = custom.lightgrey },
		-- ["@comment"] = { italic = true, fg = custom.lightgrey },
		-- TelescopePromptBorder = { link = "TelescopeBorder" },
		-- TelescopeSelection = { fg = "green" },
		Visual = { bg = "black" },
		-- Normal = { bg = "purple" }
		-- SignColumn = { bg = { "purple", 0 } },
	},

	hl_add = {

		-- SnacksDashboardHeader = { link = "NONE", fg = "pink" },
		-- DashboardHeader = { fg = { "yellow", -10 } },
		-- DashboardProjectTitle = { link = "DashboardHeader" },
		-- DashboardMruTitle = { link = "DashboardHeader" },
		-- DashboardFooter = { link = "DashboardHeader" },
		-- DashboardShortCutIcon = { link = "DashboardHeader" },
		NotifyBackground = { bg = "#000000" },
		-- TelescopePromptCounter = { fg = "orange" },
		MiniIndentscopeSymbol = { fg = { "yellow", 0 } },
		-- WhichKeyNormal = { bg = { "black", 0 } },
		-- WhichKeyBorder = { link = "NONE", bg = { "white", 0 } },
		-- InclineNormal = { fg = "white" },
		-- TelescopeNormal = { link = "NONE", bg = "NONE" },
		dbui_help = { link = "NONE", fg = "orange" },
	},
}

M.cmp = {
	completion = {
		autocomplete = false,
	},
}

M.ui = {
	--     cmp = {
	--         lspkind_text = true,
	--         style = "default", -- default/flat_light/flat_dark/atom/atom_colored
	--         format_colors = {
	--             tailwind = false,
	--         },
	--     },
	--     statusline = {
	--         separator_style = "arrow",
	--     },
	--     border = "rounded",
	tabufline = {
		enabled = false,
	},
}

M.term = {
	winopts = { scl = "auto" },
	float = {
		width = 0.8,
		height = 0.5,
		row = 0.25,
		col = 0.1,
		border = "rounded",
		relative = "editor",
	},
	sizes = {
		vsp = 0.45,
		sp = 0.35,
	},
}

return M
