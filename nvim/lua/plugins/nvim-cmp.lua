return {
	"hrsh7th/nvim-cmp",
	opts = function(_, opts)
		local cmp = require("cmp")
		opts.completion = {
			autocomplete = false, -- Disable automatic triggering
		}
		opts.preselect = cmp.PreselectMode.None

		-- Explicitly set when to trigger completion
		opts.mapping = cmp.mapping.preset.insert({
			["<C-Space>"] = cmp.mapping.complete(), -- Manual trigger with Ctrl+Space
			["<CR>"] = cmp.mapping.confirm({ select = false }),
			["<Tab>"] = cmp.mapping.select_next_item(),
			["<S-Tab>"] = cmp.mapping.select_prev_item(),
		})

		return opts
	end,
}
