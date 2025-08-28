local function move_right()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>l", true, true, true), "n", true)
end

local leppard = [[
                               :
 L.                     ,;    t#,
 EW:        ,ft       f#i    ;##W.              t
 E##;       t#E     .E#t    :#L:WE              Ej            ..       :
 E###t      t#E    i#W,    .KG  ,#D  t      .DD.E#,          ,W,     .Et
 E#fE#f     t#E   L#D.     EE    ;#f EK:   ,WK. E#t         t##,    ,W#t
 E#t D#G    t#E :K#Wfff;  f#.     t#iE#t  i#D   E#t        L###,   j###t
 E#t  f#E.  t#E i##WLLLLt :#G     GK E#t j#f    E#t      .E#j##,  G#fE#t
 E#t   t#K: t#E  .E#L      ;#L   LW. E#tL#i     E#t     ;WW; ##,:K#i E#t
 E#t    ;#W,t#E    f#E:     t#f f#:  E#WW,      E#t    j#E.  ##f#W,  E#t
 E#t     :K#D#E     ,WW;     f#D#;   E#K:       E#t  .D#L    ###K:   E#t
 E#t      .E##E      .D#;     G#t    ED.        E#t :K#t     ##D.    E#t
 ..         G#E        tt      t     t          E#t ...      #G      ..
             fE                                 ,;.          j
              ,
]]

return {
	"nvimdev/dashboard-nvim",
	event = "UIEnter",
	cmds = { "Dashboard" },
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			disable_move = true,
			shortcut_type = "number",
			config = {
				header = leppard,
				-- {
				-- 	[[                                                     ]],
				-- 	[[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
				-- 	[[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
				-- 	[[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
				-- 	[[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
				-- 	[[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
				-- 	[[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
				-- 	[[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
				-- 	[[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
				-- 	[[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
				-- 	[[                                 ░                   ]],
				-- 	[[                                                     ]],
				-- 	[[                   (for work, btw)                   ]],
				-- 	[[                                                     ]],
					-- [[                                                                       ]],
					-- [[                                                                     ]],
					-- [[       ████ ██████           █████      ██                     ]],
					-- [[      ███████████             █████                             ]],
					-- [[      █████████ ███████████████████ ███   ███████████   ]],
					-- [[     █████████  ███    █████████████ █████ ██████████████   ]],
					-- [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
					-- [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
					-- [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
					-- [[                                                                       ]],
					-- [[                                   (btw)                               ]],
					-- [[                                                                       ]],
				},
				week_header = {
					enable = false,
					-- append = {
					--   "",
					--   "Reminder:",
					--   "I use Neovim (btw)",
					-- },
				},
				shortcut = {
					{
						desc = "New File ",
						key = "n",
						action = "enew | NvimTreeOpen",
					},
					{ desc = "Find Files ", key = "f", action = "Telescope find_files cwd=" },
					-- {
					--   desc = "DBUI ",
					--   key = "d",
					--   action = "enew | DBUI",
					-- },
				},
				mru = { limit = 5, cwd_only = true },
				project = {
					enable = false,
					limit = 4,
				},
				footer = {
					" ",
					"You suck.",
					"Be better for Quintin and Shoshanna",
				},
			},
			change_to_vcs_root = true,
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
