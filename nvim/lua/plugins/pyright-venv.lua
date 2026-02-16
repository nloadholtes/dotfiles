local function find_venv_python()
	local venv = vim.fs.find(".venv", { upward = true, type = "directory" })[1]
	if not venv then
		return nil
	end
	local py = venv .. "/bin/python"
	if vim.uv.fs_stat(py) then
		return py
	end
	return nil
end

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			setup = {
				pyright = function(_, _)
					vim.api.nvim_create_autocmd("LspAttach", {
						callback = function(args)
							local client = vim.lsp.get_client_by_id(args.data.client_id)
							if not client or client.name ~= "pyright" then
								return
							end

							local py = find_venv_python()
							if not py then
								return
							end

							client.config.settings = client.config.settings or {}
							client.config.settings.python = client.config.settings.python or {}
							client.config.settings.python.pythonPath = py
							client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
						end,
					})
					return false -- let lspconfig do normal setup
				end,
			},
		},
	},
}
