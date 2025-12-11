return {
	{
		"LazyVim/LazyVim",
		init = function()
			-- run after colorscheme applies
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					vim.api.nvim_set_hl(0, "VertSplit", { fg = "#ff00ff", bold = true })
					vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ff00ff", bold = true })
				end,
			})
		end,
	},
}
