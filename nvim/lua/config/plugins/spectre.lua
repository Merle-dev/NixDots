return {
	"nvim-pack/nvim-spectre",
	cmd = "Spectre",
	opts = {
		default = {
			find = {
				cmd = "rg",
				options = {},
			},
			replace = {
				cmd = "sed",
			},
		},
		is_insert_mode = true, -- start open panel on is_insert_mode
		is_block_ui_break = true,
	},
	config = function()
		require("spectre").setup({})
	end,
}
