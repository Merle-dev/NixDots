return {
	"brenoprata10/nvim-highlight-colors",
	opts = { enabled_named_colors = false },
	config = function()
		-- require("cmp").setup({
		-- 	formatting = {
		-- 		format = require("nvim-highlight-colors").format,
		-- 	},
		-- })
		require("nvim-highlight-colors").setup({
			render = "background",
			enable_ansi = true,
			enable_tailwind = true,
		})
	end,
}
