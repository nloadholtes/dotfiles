-- Apparently we do this instead of using Mason? It's what
-- Claude suggested and I don't know enough to have an
-- opinion at this point.

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {},
			},
		},
	},
}
