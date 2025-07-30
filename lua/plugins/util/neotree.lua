return {
	"nvim-neo-tree/neo-tree.nvim",
	event = "User FilePost",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			buffers = {
				window = {
					position = "right",
					width = 20,
				},
			},
		})
	end,
}
