return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		{ "kkharji/sqlite.lua", module = "sqlite" },
	},
	config = function()
		require("neoclip").setup({
			enable_persistent_history = true,
			db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
		})
	end,
}
