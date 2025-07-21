return {
	"saghen/blink.cmp",
	opts = {
		keymap = {
			preset = "none", -- Disable all automatic behavior
			["<C-space>"] = { "show", "show_documentation" },
			["<Up>"] = { "select_next", "fallback" },
			["<Down>"] = { "accept", "fallback" },
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
