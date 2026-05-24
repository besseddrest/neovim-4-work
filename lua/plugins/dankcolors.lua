return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#151313',
				base01 = '#151313',
				base02 = '#8e8386',
				base03 = '#8e8386',
				base04 = '#e5d8dc',
				base05 = '#fff8fa',
				base06 = '#fff8fa',
				base07 = '#fff8fa',
				base08 = '#ff9fa2',
				base09 = '#ff9fa2',
				base0A = '#f0d6de',
				base0B = '#bbffa5',
				base0C = '#fff0f4',
				base0D = '#f0d6de',
				base0E = '#ffe8ee',
				base0F = '#ffe8ee',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#8e8386',
				fg = '#fff8fa',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#f0d6de',
				fg = '#151313',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#8e8386' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#fff0f4', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#ffe8ee',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#f0d6de',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#f0d6de',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#fff0f4',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#bbffa5',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#e5d8dc' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#e5d8dc' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#8e8386',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
