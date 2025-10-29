return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "*",
	dependencies = {},
	opts = {
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = { "select_next", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 300 },
		},
		-- snippets = { preset = "luasnip" },
		fuzzy = { implementation = "lua" },
		signature = { enabled = true },
	},
}
