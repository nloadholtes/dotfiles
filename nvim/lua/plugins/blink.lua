return {
	"saghen/blink.cmp",
	opts = {
		keymap = {
			preset = "none", -- Disable all automatic behavior
			["<C-space>"] = { "show", "show_documentation" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Esc>"] = { "hide", "fallback" },
		},
		completion = {
			trigger = {
				show_on_keyword = false,
				show_on_trigger_character = false,
			},
		},
	},
}
