-- This is to help turn off the auto-complete in markdown files.

return {
	{
		"saghen/blink.cmp",
		opts = {
			enabled = function()
				return vim.bo.filetype ~= "markdown"
			end,
		},
	},
}
