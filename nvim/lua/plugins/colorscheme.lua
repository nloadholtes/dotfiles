return {
	-- add gruvbox
	{ "ellisonleao/gruvbox.nvim" },
	{ "shaunsingh/nord.nvim" },
	{ "rmehri01/onenord.nvim" },
	{ "ribru17/bamboo.nvim" },
	{
		"sainnhe/sonokai",
		config = function()
			-- Set the global variable g:sonokai_style *before* loading the colorscheme
			vim.g.sonokai_style = "andromeda"
		end,
	},
	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "sonokai",
		},
	},
}
