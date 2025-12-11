return {
	{
		"nvim-lua/plenary.nvim", -- any always-loaded plugin works; or use LazyVim core
		config = function()
			vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ff00ff", bold = true })
		end,
	},
}
