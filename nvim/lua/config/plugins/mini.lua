return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.animate").setup()
		require("mini.surround").setup()
	end,
}
