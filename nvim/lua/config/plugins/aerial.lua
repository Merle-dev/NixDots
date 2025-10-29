return {
	"stevearc/aerial.nvim",
	config = function()
		require("aerial").setup({
			on_attach = function(bufnr)
				vim.keymap.set("n", "(", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", ")", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
			layout = {
				width = 0.1,
				default_direction = "prefer_right",
			},
			autojump = false,
		})
	end,
}
